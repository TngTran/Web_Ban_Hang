using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyThoiTrang.Models;
namespace QuanLyThoiTrang.Controllers
{
    public class TrangChuController : Controller
    {
        QuanLyBanDongHoModelDataContext s = new QuanLyBanDongHoModelDataContext();
        //
        // GET: /TrangChu/

        //public ActionResult Index()
        //{
        //    return View();
        //}
        private List<TINTUC> Laytinmoi(int count)
        {
            return s.TINTUCs.OrderByDescending(a => a.MoiNhat).Take(count).ToList();
        }
        public ActionResult Index()
        {
            //lay 5 quyen sach moi
            var dhmoi = Laytinmoi(4);
            return View(dhmoi);
            //return View();

        }
    }
}
