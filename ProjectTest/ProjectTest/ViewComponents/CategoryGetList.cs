using Microsoft.AspNetCore.Mvc;
using ProjectTest.Repositories;

namespace ProjectTest.ViewComponents
{
    public class CategoryGetList:ViewComponent
    {
        public IViewComponentResult Invoke() 
        { 
            CategoryRepository categoryRepository = new CategoryRepository();
            var categoryList = categoryRepository.TList();
            return View(categoryList);
        }
    }
}
