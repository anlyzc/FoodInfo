using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectTest.Data.Models
{
    public class Category
    {
        public int CategoryID { get; set; }
        [Required(ErrorMessage ="Category name  cannot be empty")]
        [StringLength(20,ErrorMessage = "Please only enter 4-20 length character.",MinimumLength =4)]
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        public bool Status { get; set; }
        public List<Food> Foods { get; set; }
    }
}