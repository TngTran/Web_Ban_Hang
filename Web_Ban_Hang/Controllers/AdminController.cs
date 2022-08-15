using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyThoiTrang.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace QuanLyThoiTrang.Controllers
{
    public class AdminController : Controller
    {
        QuanLyBanDongHoModelDataContext s=new QuanLyBanDongHoModelDataContext();
        //
        // GET: /Admin/

        //public ActionResult Index()
        //{
        //    if (Session["tk"] == null || Session["tk"].ToString() == "")
        //    {
        //        return RedirectToAction("DangNhap", "Admin");
        //    }
          
        //    return View();
        //}

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection cl)
        {
            //Session["tk"] = null;
            var tk = cl["tk"];
            var mk = cl["mk"];
            DangNhapAmin ad = s.DangNhapAmins.SingleOrDefault(n => n.TaiKhoan == tk && n.MatKhau == mk);
            if (ad != null)
            {
                Session["tk"] = ad.TaiKhoan;
                Session["mk"] = ad.MatKhau;
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ViewBag.Thongbao = "Tài khoản hoặc mật khẩu không chính xác ";
            }
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["tk"]=null;
            return RedirectToAction("DangNhap");
        }
        public ActionResult Index(int? page)
        {
            if (Session["tk"] == null || Session["tk"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "Admin");
            }
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            //return View(s.DONGHOs.ToList());
            return View(s.SANPHAMs.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            //ViewBag.MaHA = new SelectList(HANG.ToList().OderBy(n => n.TenHA), "MaHA", "TenHA");
            return View();
        }
        [HttpPost]
        public ActionResult Create(FormCollection collection, SANPHAM L_banDH)
        {
            var CB_1 = collection["TenSP"];
            var CB_2= collection["Gia"];
            var CB_3 = collection["MoTa"];
            var CB_4= collection["Ngay"];
            var CB_5 = collection["Anh"];
            var CB_6= collection["Sl"];
            var CB_7 = collection["Ma"];
            var CB_8 = collection["XX"];
            var CB_9 = collection["Moi"];
            //if (string.IsNullOrEmpty(CB_1))
            //{
            //    ViewData["Loi"] = "Tên Đồng Hồ không được để trống";
            //}
            //else
            //{
                L_banDH.TenSP = CB_1;
                L_banDH.GiaBan = Convert.ToInt32(CB_2);
                L_banDH.MoTa = CB_3;
                L_banDH.NgayCapNhat = DateTime.Parse(CB_4);
                L_banDH.AnhBia = CB_5;
                L_banDH.SoLuongTon = Convert.ToInt32(CB_6);
                L_banDH.MaHA = Convert.ToInt32(CB_7);
                L_banDH.XuatXu = CB_8;
                L_banDH.Moi = Convert.ToInt32(CB_9);
                s.SANPHAMs.InsertOnSubmit(L_banDH);
                s.SubmitChanges();
                return RedirectToAction("Index");
            //}
            //return this.Create();
        }

    
        public ActionResult Details(int id)
        {
            var Details_DH = s.SANPHAMs.Where(m => m.MaSP == id).First();
            return View(Details_DH);
        }

        
        public ActionResult Edit(int ma)
        {
            var ED_Dongho = s.SANPHAMs.First(m => m.MaSP == ma);
            return View(ED_Dongho);
        }
        [HttpPost]
        public ActionResult Edit(int ma, FormCollection collection)
        {
            //var Ltin = s.DONGHOs.First(m => m.MaDH == id);
            var lDongho = s.SANPHAMs.First(m => m.MaSP == ma);
            var CB_1 = collection["TenSP"];
            var CB_2= collection["Gia"];
            var CB_3 = collection["MoTa"];
            var CB_4= collection["Ngay"];
            var CB_5 = collection["Anh"];
            var CB_6= collection["Sl"];
            var CB_7 = collection["Ma"];
            var CB_8 = collection["XX"];
            var CB_9 = collection["Moi"];
            lDongho.MaSP = ma;
           
           
            //{
            //    lDongho.TenDH = E_dongho;
            //    s.DONGHOs.InsertOnSubmit(lDongho);
            //    s.SubmitChanges();
            //    return RedirectToAction("Index");
                UpdateModel(lDongho);
                s.SubmitChanges();
                return RedirectToAction("Index");
            
          
        }

        public ActionResult Delete(int ma)
        {
            var D_Dongho = s.SANPHAMs.First(m => m.MaSP == ma);
            return View(D_Dongho);
        }
        [HttpPost]
        public ActionResult Delete(int ma, FormCollection collection)
        {
            var D_Dongho = s.SANPHAMs.Where(m => m.MaSP == ma).First();
            s.SANPHAMs.DeleteOnSubmit(D_Dongho);
            s.SubmitChanges();
            return RedirectToAction("Index");

        }
        //public ActionResult Chitietdongho(int id)
        //{
        //    DONGHO dh = s.DONGHOs.SingleOrDefault(n => n.MaDH == id);
        //    ViewBag.MaDH = dh.MaDH;
        //    if (dh == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    return View(dh);
        //}
        //public ActionResult XoaDongho(int id)
        //{
        //    DONGHO dh = s.DONGHOs.SingleOrDefault(n => n.MaDH == id);
        //    ViewBag.MaDH = dh.MaDH;
        //    if (dh == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    return View(dh);
        //}
        //[HttpPost, ActionName("XoaDongho")]
        //public ActionResult Xacnhanxoa(int id)
        //{
        //    DONGHO dh = s.DONGHOs.SingleOrDefault(n => n.MaDH == id);
        //    ViewBag.MaDH = dh.MaDH;
        //    if (dh == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    s.DONGHOs.DeleteOnSubmit(dh);
        //    s.SubmitChanges();
        //    return RedirectToAction("dh");

        //}
        //[HttpGet]
        //public ActionResult SuaDongho(int id)
        //{
        //    DONGHO dh = s.DONGHOs.SingleOrDefault(n => n.MaDH == id);
        //    ViewBag.MaDH = dh.MaDH;
        //    if (dh == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    return View(dh);
        //}



        //[HttpGet]
        //public ActionResult Themdonghohmoi()
        //{
        //    ViewBag.MaHA = new SelectList(s.HANGs.ToList().OrderBy(n => n.TenHA), "MaHA", "TenHA");
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult SuaDongho(DONGHO dongho, HttpPostedFileBase fileupload)
        //{
        //    ViewBag.MaHA = new SelectList(s.HANGs.ToList().OrderBy(n => n.TenHA), "MaHA", "TenHA");
        //    if (fileupload == null)
        //    {
        //        ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
        //        return View();
        //    }
        //    else
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            var fileName = Path.GetFileName(fileupload.FileName);
        //            var path = Path.Combine(Server.MapPath("~/HinhAnhSP"), fileName);

        //            if (System.IO.File.Exists(path))
        //            {
        //                ViewBag.Thongbao = "Hình ảnh đã tồn tại";
        //            }
        //            else
        //            {
        //                fileupload.SaveAs(path);
        //            }
        //            dongho.AnhBia = fileName;
        //            s.DONGHOs.InsertOnSubmit(dongho);
        //            s.SubmitChanges();

        //            //ViewBag.MaHA = new SelectList(s.HANGs.ToList().OrderBy(n => n.TenHA), "MaHA", "TenHA");
        //            //return View();
        //        }
        //        return RedirectToAction("dongho");
        //    }

        //}



    }
}
