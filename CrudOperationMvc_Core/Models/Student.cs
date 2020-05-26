using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CrudOperationMvc_Core.Models
{
    public class Student
    {
        [Display(Name = "N° Alumno")]
        public int Id { get; set; }
        [Required(ErrorMessage ="Campo Nombre Requerido")]
        [Display(Name ="Nombre")]
        public string Name { get; set; }
        [Display(Name = "Genero")]
        [Required(ErrorMessage = "Campo Genero Requerido")]
        public string Gender{ get; set; }
        [Display(Name = "Clase")]
        [Required(ErrorMessage = "Campo Clase Requerido")]
        public string Class{ get; set; }
        [Display(Name = "Direccion")]
        [Required(ErrorMessage = "Campo Direccion Requerido")]
        public string Adress { get; set; }
        [Display(Name = "Nota")]
        [Required(ErrorMessage = "Campo Nota Requerido")]
        public string Note{ get; set; }
    }
}

