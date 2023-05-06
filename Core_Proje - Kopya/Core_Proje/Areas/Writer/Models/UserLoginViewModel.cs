using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Core_Proje.Areas.Writer.Models
{
    public class UserLoginViewModel
    {
        [Display(Name ="Kullanıcı Adı")]
        [Required(ErrorMessage ="Kullanıcı Adını Girin")]
        public string UserName { get; set; }
        [Display(Name = "Şifreyi")]
        [Required(ErrorMessage = "Şifreyi Girin")]
        public string Password { get; set; }
    }
}
