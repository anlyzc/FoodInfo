using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectTest.Data.Models;
using ProjectTest.Repositories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using X.PagedList;

namespace ProjectTest.Controllers
{
	public class FoodController : Controller
	{
        Context c=new Context();
        FoodRepository foodRepository = new FoodRepository();
        public IActionResult Index(int page = 1)
		{
            FoodRepository foodRepository = new FoodRepository();
            return View(foodRepository.TList("Category").ToPagedList(page,3));
		}
        [HttpGet]
        public IActionResult FoodAdd()
        {
            List<SelectListItem> values = (from x in c.Categories.ToList()
                                           select new SelectListItem
                                           {
                                               Text=x.CategoryName,
                                               Value=x.CategoryID.ToString()
                                           }).ToList();
            ViewBag.v1 = values;
            return View();
        }
        [HttpPost]
        public IActionResult FoodAdd(ProductAdd p)
        {
            Food food = new Food();
            if (p.ImageURL != null)
            {
                var extension = Path.GetExtension(p.ImageURL.FileName);
                var newimagename=Guid.NewGuid() + extension;
                var location=Path.Combine(Directory.GetCurrentDirectory(),"wwwroot/images/",newimagename);
                var stream=new FileStream(location,FileMode.Create);
                p.ImageURL.CopyTo(stream);
                food.ImageURL = newimagename;
            }
            food.FoodName = p.FoodName;
            food.Stock=p.Stock;
            food.Price = p.Price;
            food.CategoryID= p.CategoryID;
            food.Description= p.Description;
            foodRepository.TAdd(food);
            return RedirectToAction("Index");
        }
        public IActionResult FoodDelete(int id)
        {
            foodRepository.TRemove(new Food { FoodID=id});
            return RedirectToAction("Index");
        }
        public IActionResult FoodGet(int id)
        {
            var x=foodRepository.TGet(id);
            List<SelectListItem> values = (from y in c.Categories.ToList()
                                           select new SelectListItem
                                           {
                                               Text = y.CategoryName,
                                               Value = y.CategoryID.ToString()
                                           }).ToList();
            ViewBag.v1 = values;
            Food f = new Food()
            {
                FoodID=x.FoodID,
                CategoryID = x.CategoryID,
                FoodName = x.FoodName,
                Price=x.Price,
                Stock=x.Stock,
                Description=x.Description,
                ImageURL=x.ImageURL
            };
            return View(f);
        }
        [HttpPost]
        public IActionResult FoodUpdate(Food p)
        {
            var x = foodRepository.TGet(p.FoodID);
            x.FoodName = p.FoodName;
            x.Price=p.Price;
            x.Stock= p.Stock;
            x.Description=p.Description;
            x.ImageURL=p.ImageURL;
            x.CategoryID=p.CategoryID;
            foodRepository.TEdit(x);
            return RedirectToAction("Index");
        }
    }
}
