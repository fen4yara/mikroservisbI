using Microsoft.EntityFrameworkCore;
using ReadersServiceApi.Model;

namespace ReadersServiceApi.dbContext
{
    public class ReadersApiDb : DbContext
    {
        public ReadersApiDb(DbContextOptions options) : base(options)
        {
            
        }
        public DbSet<Readers> Readers { get; set; }
        public DbSet<Roles> Roles { get; set; }
    }
}
