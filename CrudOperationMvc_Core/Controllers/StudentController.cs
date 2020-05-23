using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using CrudOperationMvc_Core.Context;
using CrudOperationMvc_Core.Models;

namespace CrudOperationMvc_Core.Controllers
{
    public class StudentController : Controller
    {
        readonly StudentContextDB StudentDB = new StudentContextDB();

        // GET: StudentController
        public ActionResult Index()
        {
            List<Student> listStudent = StudentDB.GetAllStudent().ToList();
            return View(listStudent);
        }

        // GET: StudentController/Details/5
        public ActionResult Details(int id)
        {
            if (id<=0)
            {
                return NotFound();
            }
            Student objStudent = StudentDB.GetStudentById(id);
            if (objStudent==null)
            {
                return NotFound();
            }
            return View(objStudent);
        }

        // GET: StudentController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: StudentController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind] Student student)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    StudentDB.CreateStudent(student);
                    return RedirectToAction("Index");
                }
                return View(student);
            }
            catch
            {
                return View();
            }
        }

        // GET: StudentController/Edit/5
        public ActionResult Edit(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }
            Student objStudent = StudentDB.GetStudentById(id);
            if (objStudent == null)
            {
                return NotFound();
            }
            return View(objStudent);
        }

        // POST: StudentController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, [Bind] Student student)
        {
            try
            {
                if (id <= 0)
                {
                    return NotFound();
                }
                if (ModelState.IsValid)
                {
                    StudentDB.UpdateStudent(student);
                return RedirectToAction("Index");
                }
                return View(StudentDB);
            }
            catch
            {
                return View();
            }
        }

        // GET: StudentController/Delete/5
        public ActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }
            Student student = StudentDB.GetStudentById(id);
            return View(student);
        }

        // POST: StudentController/Delete/5
        [HttpPost ,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                StudentDB.DeleteStudent(id);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
