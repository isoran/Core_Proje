using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Core_Proje.Areas.Writer.Controllers
{
    [Area("Writer")]
    public class DashboardController : Controller
    {
        private readonly UserManager<WriterUser> _userManager;
        public DashboardController(UserManager<WriterUser> userManager)
        {
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            var values = await _userManager.FindByNameAsync(User.Identity.Name);// sisteme bağlanan kullanıcı
            ViewBag.v1 = values.Name + " " + values.SurName;

            //water API
            string ApiID = "ee7992d07615b7a8e44a95af2312d9d3";
            string ApiConn = "https://api.openweathermap.org/data/2.5/weather?q=ankara&mode=xml&lang=tr&units=metric&appid=" + ApiID;
            XDocument document = XDocument.Load(ApiConn);
            ViewBag.v6 = document.Descendants("temperature").ElementAt(0).Attribute("value").Value;

            // istatistikler
            Context c = new Context();
            ViewBag.v2 = c.WriterMessages.Where(x=>x.Receiver ==values.Email).Count();
            ViewBag.v3 = c.Announcements.Count();
            ViewBag.v4 = c.Users.Count();
            ViewBag.v5 = c.Skills.Count();
            return View();
        }
    }
}
