using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CrudOperationMvc_Core.Models;
using System.Data.SqlClient;
using System.Data;

namespace CrudOperationMvc_Core.Context
{
    public class StudentContextDB
    {
        readonly string connectionString= "Data Source = EQUIPO; Integrated Security = true; Initial Catalog = CrudOperation_MvcCore;";

        //this method help to get the student list
        public IEnumerable<Student> GetAllStudent()
        {
            var studentList = new List<Student>();
            using (SqlConnection cnnt = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SP_GetAllStudent", cnnt)
                {
                    CommandType = CommandType.StoredProcedure              // avisamos que trabajamos con un stored procedure
                };  // procedimiento almacenado para ejecutar en una base de datos de SQL Server.
                cnnt.Open();                                                //abrimos coneccion
                SqlDataReader reader = cmd.ExecuteReader();                 //Proporciona una forma de leer una secuencia de filas
                while (reader.Read())                                       //condicion de lectura. si es true iguala los campos
                {
                    var student = new Student();
                    student.Id = Convert.ToInt32(reader["Id"].ToString());
                    student.Name = reader["Name"].ToString();
                    student.Gender = reader["Gender"].ToString();
                    student.Class = reader["Class"].ToString();
                    student.Adress = reader["Adress"].ToString();
                    student.Note = reader["Note"].ToString();

                    studentList.Add(student);                                //agregamos los cambios a la list<student>
                }
                cnnt.Close();                                                //cerramos coneccion
            }
            return studentList;                 
        }


        //create new Student
        public void CreateStudent(Student student)
        {
            using (SqlConnection cnnt = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SP_CreateNewStudent", cnnt)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Name", student.Name);
                cmd.Parameters.AddWithValue("@Gender", student.Gender);
                cmd.Parameters.AddWithValue("@Class", student.Class);
                cmd.Parameters.AddWithValue("@Adress", student.Adress);
                cmd.Parameters.AddWithValue("@Note", student.Note);

                cnnt.Open();
                cmd.ExecuteNonQuery();                                         //Ejecuta una instrucción Transact-SQL contra la conexión y devuelve el número de filas afectadas
                cnnt.Close();
            }
        }

        //Update Student
        public void UpdateStudent(Student student)
        {
            using (SqlConnection cnnt = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SP_UpdateStudent", cnnt)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Id", student.Id);
                cmd.Parameters.AddWithValue("@Name", student.Name);
                cmd.Parameters.AddWithValue("@Gender", student.Gender);
                cmd.Parameters.AddWithValue("@Class", student.Class);
                cmd.Parameters.AddWithValue("@Adress", student.Adress);
                cmd.Parameters.AddWithValue("@Note", student.Note);

                cnnt.Open();
                cmd.ExecuteNonQuery();                                         //Ejecuta una instrucción Transact-SQL contra la conexión y devuelve el número de filas afectadas
                cnnt.Close();
            }
        }

        //Delete Student
        public void DeleteStudent(int? Id)
        {
            using (SqlConnection cnnt = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SP_DeleteStudent", cnnt)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Id", Id);

                cnnt.Open();
                cmd.ExecuteNonQuery();                                         //Ejecuta una instrucción Transact-SQL contra la conexión y  devuelve el número de filas afectadas
                cnnt.Close();
            }
        }

        //Get By Student Id
        public Student GetStudentById(int? Id)
        {
            var student = new Student();
            using (SqlConnection cnnt = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SP_GetByStudentId", cnnt)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Id", Id);

                cnnt.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    student.Id = Convert.ToInt32(reader["Id"].ToString());
                    student.Name = reader["Name"].ToString();
                    student.Gender = reader["Gender"].ToString();
                    student.Class = reader["Class"].ToString();
                    student.Adress = reader["Adress"].ToString();
                    student.Note = reader["Note"].ToString();
                }


                cnnt.Close();
            }
            return student;
        }

    }
}
