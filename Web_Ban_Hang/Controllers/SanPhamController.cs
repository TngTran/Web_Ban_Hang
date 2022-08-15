using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyThoiTrang.Models;
namespace QuanLyThoiTrang.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /Sach/
        QuanLyBanDongHoModelDataContext s = new QuanLyBanDongHoModelDataContext();
        private List<SANPHAM> LaySPmoi(int count)
        {
            return s.SANPHAMs.OrderByDescending(a => a.Moi).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var dhmoi = LaySPmoi(6);
            return View(dhmoi);

        }
        public ActionResult Hang()
        {
            var hang = from h in s.HANGs select h;
            return PartialView(hang);
        }
        public ActionResult Details(int id)
        {
            var Details_DH = s.SANPHAMs.Where(m => m.MaSP == id).First();
            return View(Details_DH);
        }
        public ActionResult SPTheoHang(int id)
        {
            List<SANPHAM> lst = s.SANPHAMs.Where(t => t.MaHA == id).ToList();
            return View(lst);
        }

    }
}
