using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ReadersServiceApi.dbContext;
using ReadersServiceApi.Model;
using ReadersServiceApi.Requests;
using Microsoft.AspNetCore.Authorization;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using ReadersServiceApi.Interfaces;
using System.Reflection.PortableExecutable;
using Microsoft.AspNetCore.Mvc.Abstractions;
namespace LibraryWebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReaderController : Controller
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IReaderService _reader;
        //private readonly IRentService _rent;
        public ReaderController(IReaderService readerService/*, IRentService rent*/)
        {
            _reader = readerService;
            //_rent = rent;
        }
        
        [HttpGet("getAllReaders")]
        public async Task<ActionResult> GetAllReaders([FromQuery] int? page, [FromQuery] int? pageSize)
        {

            return new OkObjectResult(new
            {
                readers = _reader.GetAllReaders(page, pageSize)
            });
        }
        
        [HttpPost("addNewReader")]
        public async Task<IActionResult> AddNewReader([FromQuery] createReader reader)
        {

            if (_reader.ReaderExists(reader.Login))
            {
                return new NotFoundObjectResult(new
                {
                    error = NotFound("reader with that login and password already exists")
                });
            }
            if (string.IsNullOrWhiteSpace(reader.Name) || string.IsNullOrWhiteSpace(reader.Password) || string.IsNullOrWhiteSpace(reader.Login) || string.IsNullOrWhiteSpace(reader.Date_Birth.ToString()))
            {
                return new BadRequestObjectResult(new
                {
                    error = BadRequest("fill in all fields")
                });
            }
            await _reader.AddNewReader(reader);
            return Ok();
        }
        
        [HttpPut("updateReaderById/{id}")]
        public async Task<IActionResult> UpdateReaderById(int id, [FromQuery] createReader reader)
        {

            if (!_reader.GetAll().Any(r => r.Id_User == id))
            {
                return new NotFoundObjectResult(new
                {
                    error = NotFound("reader with that id does not exists")
                });
            }
            if (string.IsNullOrWhiteSpace(reader.Name) || string.IsNullOrWhiteSpace(reader.Password) || string.IsNullOrWhiteSpace(reader.Login) || string.IsNullOrWhiteSpace(reader.Date_Birth.ToString()))
            {
                return new BadRequestObjectResult(new
                {
                    error = BadRequest("fill in all fields")
                });
            }
            await _reader.UpdateReaderById(id, reader);
            return Ok();
        }
        
        [HttpDelete("deleteReaderById/{id}")]
        public async Task<IActionResult> DeleteReaderById(int id)
        {

            if (!_reader.GetAll().Any(r => r.Id_User == id))
            {
                return new NotFoundObjectResult(new
                {
                    error = NotFound("reader with that id does not exists")
                });
            }
            await _reader.DeleteReaderById(id);
            return Ok();
        }
        
        [HttpGet("getReaderById/{id}")]
        public async Task<IActionResult> GetReaderById(int id)
        {

            if (!_reader.GetAll().Any(r => r.Id_User == id))
            {
                return new NotFoundObjectResult(new
                {
                    error = NotFound("reader with that id does not exists")
                });
            }

            return new OkObjectResult(new
            {
                reader = _reader.GetReaderById(id)
            });
        }
        //[HttpGet("getReadersBooks/{id}")]
        //public async Task<IActionResult> GetReadersRentals(int id)
        //{

        //    if (_rent.ReaderInRent(id))
        //    {
        //        return new NotFoundObjectResult(new
        //        {
        //            error = NotFound("reader has no rentals")
        //        });
        //    }
        //    return new OkObjectResult(new
        //    {
        //        books = _reader.GetReadersRentals(id)
        //    });
        //}
        
        [HttpPost("uploadpfp")]
        public async Task<IActionResult> UploadProfilePhoto(int readerId, IFormFile photo)
        {
            var url = await _reader.UploadProfilePhoto(readerId, photo);
            return new OkObjectResult(new { url = url });
        }
        
        [HttpPut("updatepfp/{readerId}")]
        public async Task<IActionResult> UpdateProfilePhoto(int readerId, IFormFile photo)
        {
            var url = await _reader.UpdateProfilePhoto(readerId, photo);
            return new OkObjectResult(new { url = url });
        }
        
        [HttpDelete("deletepfp/{readerId}")]
        public async Task<IActionResult> DeleteProfilePhoto(int readerId)
        {
            await _reader.DeleteProfilePhoto(readerId);
            return Ok();
        } 
    }
}
