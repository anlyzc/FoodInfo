using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using ProjectTest.Data;
using ProjectTest.Data.Models;
using System.Collections.Generic;
using System.Linq;

namespace ProjectTest.Controllers
{
    public class ChartController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Index2()
        {
            return View();
        }
        public IActionResult VisualizeProductResult() 
        {
            return Json(ProList());
        }
        public List<Class1> ProList() 
        { 
            List<Class1> cs = new List<Class1>();
            cs.Add(new Class1()
            {
                proname= "Computer",
                stock=150
            });
            cs.Add(new Class1()
            {
                proname = "LCD",
                stock = 75
            });
            cs.Add(new Class1()
            {
                proname = "USB Disk",
                stock = 200
            });
            return cs;
        }

        public IActionResult Index3()
        {
            return View();
        }
        public IActionResult VisualizeProductResult2()
        {
            return Json(FoodList());
        }
        public List<Class2> FoodList()
        {
            List<Class2> cs2 = new List<Class2>();
            using(var c=new Context())
            {
                cs2 = c.Foods.Select(x => new Class2()
                {
                    foodname = x.FoodName,
                    stock = x.Stock
                }).ToList();
            }
            return cs2;
        }
        public IActionResult Statistics()
        {
            Context c=new Context();
            var value1 = c.Foods.Count();
            ViewBag.v1 = value1;

            var value2 = c.Categories.Count();
            ViewBag.v2 = value2;

            var foid = c.Categories.Where(x => x.CategoryName == "Fruit").Select(y => y.CategoryID).FirstOrDefault();

            var value3 = c.Foods.Where(x => x.CategoryID == foid).Count();
            ViewBag.v3 = value3;

            var value4 = c.Foods.Where(x => x.CategoryID == (c.Categories.Where(z => z.CategoryName == "Vegatables").Select(y => y.CategoryID).FirstOrDefault())).Count();
            ViewBag.v4 = value4;

            var value5 = c.Foods.Sum(x => x.Stock);
            ViewBag.v5 = value5;

            var value6 = c.Foods.Where(x => x.CategoryID == c.Categories.Where(y => y.CategoryName == "Legumes").Select(z => z.CategoryID).FirstOrDefault()).Count();
            ViewBag.v6 = value6;

            var value7= c.Foods.OrderByDescending(x=>x.Stock).Select(y=>y.FoodName).FirstOrDefault();
            ViewBag.v7= value7;

            var value8 = c.Foods.OrderBy(x => x.Stock).Select(y => y.FoodName).FirstOrDefault();
            ViewBag.v8 = value8;

            var value9 = c.Foods.Average(x => x.Price).ToString("0.00");
            ViewBag.v9 = value9;

            var value10 = c.Categories.Where( x => x.CategoryName == "Fruit").Select(y => y.CategoryID).FirstOrDefault();
            var value10p = c.Foods.Where(y => y.CategoryID == value10).Sum(x => x.Stock);
            ViewBag.v10 = value10p;
            
            var value11 = c.Categories.Where( x => x.CategoryName == "Vegatables").Select(y => y.CategoryID).FirstOrDefault();
            var value11p = c.Foods.Where(y => y.CategoryID == value10).Sum(x => x.Stock);
            ViewBag.v11 = value11p;

            var value12 = c.Foods.OrderByDescending(x => x.Price).Select(y => y.FoodName).FirstOrDefault();
            ViewBag.v12 = value12;


            return View();
        }
    }
}
