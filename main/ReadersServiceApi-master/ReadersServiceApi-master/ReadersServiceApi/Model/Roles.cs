using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReadersServiceApi.Model
{
    public class Roles
    {
        [Key]
        public int Id_Role { get; set; }
        public string Name { get; set; }
    }
}
