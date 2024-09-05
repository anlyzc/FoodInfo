using Microsoft.AspNetCore.Mvc;
using ProjectTest.Repositories;

namespace ProjectTest.ViewComponents
{
    public class FoodGetList:ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            FoodRepository foodRepository = new FoodRepository();
            var foodList = foodRepository.TList();
            return View(foodList);
        }
    }
}
