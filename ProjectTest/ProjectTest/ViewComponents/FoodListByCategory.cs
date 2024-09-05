using Microsoft.AspNetCore.Mvc;
using ProjectTest.Repositories;

namespace ProjectTest.ViewComponents
{
    public class FoodListByCategory:ViewComponent
    {
        public IViewComponentResult Invoke(int id)
        {
            FoodRepository foodRepository = new FoodRepository();
            var foodList = foodRepository.List(x => x.CategoryID == id);
            return View(foodList);
        }
    }
}
