using Microsoft.AspNetCore.Mvc;
using ProjectTest.Repositories;
using ProjectTest.Data.Models;
using Microsoft.AspNetCore.Authorization;

namespace ProjectTest.Controllers
{
	public class CategoryController : Controller
	{
        CategoryRepository categoryRepository = new CategoryRepository();

        public IActionResult Index(string p)
		{
			if (!string.IsNullOrEmpty(p))
			{
				return View(categoryRepository.List(x => x.CategoryName == p));
			}
			return View(categoryRepository.TList());
		}
		[HttpGet]
		public IActionResult CategoryAdd()
		{
			return View();
		}
		[HttpPost]
        public IActionResult CategoryAdd(Category cat)
        {
			if (!ModelState.IsValid)
			{
				return View("CategoryAdd");
			}
			categoryRepository.TAdd(cat);
            return RedirectToAction("Index");
        }
		public IActionResult CategoryGet(int id) 
		{
			var x = categoryRepository.TGet(id);
			Category ct=new Category()
			{
				CategoryName= x.CategoryName,
				CategoryDescription= x.CategoryDescription,
				CategoryID= x.CategoryID,
			};
			return View(ct);
		}
		public IActionResult CategoryUpdate(Category p) 
		{
            var x = categoryRepository.TGet(p.CategoryID);
			x.CategoryName = p.CategoryName;
			x.CategoryDescription = p.CategoryDescription;
			x.Status = true;
			categoryRepository.TEdit(x);
            return RedirectToAction("Index");
		}
		public IActionResult CategoryDelete(int id)
		{
			var x = categoryRepository.TGet(id);
			x.Status=false;
			categoryRepository.TEdit(x);
            return RedirectToAction("Index");
        }
    }
}
