using LibraryWebApi.Controllers;
using ReadersServiceApi.dbContext;
using ReadersServiceApi.Interfaces;
using ReadersServiceApi.Model;
using ReadersServiceApi.Requests;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;

namespace LibraryWebApi.Services
{

    public class ReaderService(ReadersApiDb context, IHttpContextAccessor httpContextAccessor,HttpClient httpClient) : IReaderService
    {
        readonly ReadersApiDb _context = context;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;
        private readonly HttpClient _httpClient=httpClient;
        private readonly string URL = "https://localhost:7270/api/Photos";
        public List<Readers> GetAllReaders([FromQuery] int? page, [FromQuery] int? pageSize)
        {
            var users = _context.Readers;
            var totalUsers =  users.Count();
            if (page.HasValue && pageSize.HasValue)
            {
                var usersPaginated =  users.Skip((int)((page - 1) * (int)pageSize)).Take((int)pageSize).ToList();
                return usersPaginated;
            }
            return users.ToList();
            
        }

        public async Task AddNewReader([FromQuery]createReader reader)
        {
            var check = await _context.Readers.FirstOrDefaultAsync(r => r.Login == reader.Login);
            var Reader = new Readers
            {
                Name = reader.Name,
                Password = reader.Password,
                Date_Birth = reader.Date_Birth,
                Login = reader.Login,
                Id_Role = 2
            };
            await _context.Readers.AddAsync(Reader);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteReaderById(int id)
        {
            var check = await _context.Readers.FirstOrDefaultAsync(r => r.Id_User == id);
            _context.Readers.Remove(check);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateReaderById(int id, [FromQuery]createReader reader)
        {
            var check = await _context.Readers.FirstOrDefaultAsync(r => r.Id_User==id);
            check.Name = reader.Name;
            check.Password = reader.Password;
            check.Date_Birth = reader.Date_Birth;
            check.Login = reader.Login;
            await _context.SaveChangesAsync();
        }

        public Readers GetReaderById(int id)
        {
            return _context.Readers.FirstOrDefault(r=>r.Id_User==id);
        }

        //public List<RentHistory> GetReadersRentals(int id)
        //{
        //    return _context.RentHistory.Where(r=>r.Id_Reader==id).Include(r=>r.Reader).Include(r=>r.Book).ToList();
        //}

        public bool ReaderExists(string login)
        {
            return _context.Readers.Any(r => r.Login == login);
        }
        public List<Readers> GetAll()
        {
            return _context.Readers.ToList();
        }

        public async Task<string> UploadProfilePhoto(int readerId, IFormFile file)
        {
            using (var content = new MultipartFormDataContent())
            {
                var fileContent = new StreamContent(file.OpenReadStream());
                fileContent.Headers.ContentType = new MediaTypeHeaderValue(file.ContentType);
                content.Add(fileContent, "file", file.FileName);

                var response = await _httpClient.PostAsync($"{URL}/upload",content);
                if (response.IsSuccessStatusCode)
                {
                    var photoURL = $"{URL}/photo/{file.FileName}";
                    var reader = await _context.Readers.FirstOrDefaultAsync(r => r.Id_User == readerId);
                    reader.Profile_Photo = photoURL;
                    await _context.SaveChangesAsync();
                    return photoURL;
                }
                else
                {
                    string errorContent = await response.Content.ReadAsStringAsync();

                    return $"{response.StatusCode}, {errorContent}";
                }

            }
        }

        public async Task<string> UpdateProfilePhoto(int readerId,IFormFile file)
        {
            var reader = await _context.Readers.FirstOrDefaultAsync(r => r.Id_User == readerId);
            var fileName = removeUrl(reader.Profile_Photo);

            using (var content = new MultipartFormDataContent())
            {
                var fileContent = new StreamContent(file.OpenReadStream());
                fileContent.Headers.ContentType = new MediaTypeHeaderValue(file.ContentType);
                content.Add(fileContent, "file", file.FileName);

                var response = await _httpClient.PutAsync($"{URL}/update/{fileName}", content);
                if (response.IsSuccessStatusCode)
                {
                    var photoURL = $"{URL}/photo/{file.FileName}";
                    reader.Profile_Photo = photoURL;
                    await _context.SaveChangesAsync();
                    return photoURL;
                }
                else
                {
                    string errorContent = await response.Content.ReadAsStringAsync();
                    return $"{response.StatusCode}, {errorContent}";
                }
            }
        }

        public async Task DeleteProfilePhoto(int readerId)
        {
            var reader = await _context.Readers.FirstOrDefaultAsync(r => r.Id_User == readerId);
            var fileName = removeUrl(reader.Profile_Photo);
            var response = await _httpClient.DeleteAsync($"{URL}/delete/{fileName}");
            if(response.IsSuccessStatusCode)
            {
                reader.Profile_Photo = "";
                await _context.SaveChangesAsync();
            }
        }

        public string removeUrl(string url)
        {
            var remove = "https://localhost:7270/api/Photos/photo/";
            if (url.StartsWith(remove))
            {
                return url.Substring(remove.Length);
            }
            return url.Substring(remove.Length);
        }
    }
}
