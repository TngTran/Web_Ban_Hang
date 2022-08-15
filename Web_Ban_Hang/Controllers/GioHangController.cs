
using QuanLyBanSach.Models;
using QuanLyThoiTrang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThoiTrang.Controllers
{
    public class GioHangController : Controller
    {

         QuanLyBanDongHoModelDataContext data = new QuanLyBanDongHoModelDataContext();

        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(int iMaDH, string strURL)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.Find(n => n.iMaDH == iMaDH);
            if (sanpham == null)
            {
                sanpham = new GioHang(iMaDH);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
        }

        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

        private double tinhTongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhTien);
            }
            return iTongTien;
        }

        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "DongHo");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tinhTongTien();
            return View(lstGiohang);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tinhTongTien();
            return PartialView();
        }
        //public ActionResult DatHang()
        //{
        //    return View();
        //}
        [HttpGet]
        public ActionResult DatHang()
        {

            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap","NguoiDung");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index","DongHo");
            }

            List<GioHang> lsGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tinhTongTien();

            return View(lsGiohang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["Ngaygiao"]);
            if (String.IsNullOrEmpty(ngaygiao))
            {
                ViewData["Loi1"] = "Phải chọn ngày giao hàng";
            }
            else
            {

                DONHANG dh = new DONHANG();
                KHACHHANG kh = (KHACHHANG)Session["TaiKhoan"];
                List<GioHang> lstGiohang = Laygiohang();
                
                dh.MAKH = kh.MAKH;
                dh.NGAYDAT = DateTime.Now; dh.NGAYGIAO = DateTime.Parse(ngaygiao);
                dh.TINHTRANGGIAO = null;
                dh.DATHANHTOAN = null;
                data.DONHANGs.InsertOnSubmit(dh);
                data.SubmitChanges();

                foreach (var item in lstGiohang)
                {
                    CHITIETDONHANG ctdh = new CHITIETDONHANG();
                    ctdh.MADONHANG = dh.MADONHANG;
                    ctdh.MaSP = item.iMaDH;
                    ctdh.SOLUONG = item.iSoLuong;
                    ctdh.DONGIA = Convert.ToInt32(item.dDonGia);
                    data.CHITIETDONHANGs.InsertOnSubmit(ctdh);
                }
                data.SubmitChanges();
                Session["Giohang"] = null;
                return RedirectToAction("Xacnhandonhang", "GioHang");
            }
            return this.DatHang();

        }
        public ActionResult XoaGioHang(int iMaDH)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.iMaDH == iMaDH);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.iMaDH == iMaDH);
                return RedirectToAction("GioHang");

            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "SanPham");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}
