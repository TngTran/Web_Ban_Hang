using QuanLyThoiTrang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyBanSach.Models
{
    public class GioHang
    {
        QuanLyBanDongHoModelDataContext data = new QuanLyBanDongHoModelDataContext();
        public int iMaDH { get; set; }

        public string sTenDH { get; set; }

        public string sAnhBia { get; set; }

        public double dDonGia { get; set; }

        public int iSoLuong { get; set; }

        public double dThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }

        public GioHang(int maDH)
        {
            iMaDH = maDH;
            SANPHAM DH = data.SANPHAMs.Single(m => m.MaSP == maDH);
            sTenDH = DH.TenSP;
            sAnhBia = DH.AnhBia;
            dDonGia = double.Parse(DH.GiaBan.ToString());
            iSoLuong = 1;
        }
    }
}