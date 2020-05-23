using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CrudOperationMvc_Core.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender{ get; set; }
        public string Class{ get; set; }
        public string Adress { get; set; }
        public string Note{ get; set; }
    }
}
