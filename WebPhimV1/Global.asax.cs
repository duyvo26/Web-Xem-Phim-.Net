using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing; // them thu vien vao

namespace WebPhimV1
{
    public class Global : System.Web.HttpApplication
    {
       
        // cau hinh url
        void GhiUrl(RouteCollection routes)
        {
            // trang nguoi dung
            routes.MapPageRoute("TrangChu", "", "~/Index.aspx"); // trang chu
            routes.MapPageRoute("NapCoin", "napcoin", "~/NapCoin.aspx"); // NapCoin
            routes.MapPageRoute("ThongTin", "thongtin", "~/ThongTin.aspx"); // NapCoin
            routes.MapPageRoute("TimKiemPhim", "TimKiemPhim", "~/TimKiemPhim.aspx"); // NapCoin

            //login
            routes.MapPageRoute("DangNhap", "DangNhap", "~/taikhoan/DangNhap.aspx"); // dang nhap 
            routes.MapPageRoute("DangKy", "DangKy", "~/taikhoan/DangKy.aspx"); // dang ky
            // tai khoản
            routes.MapPageRoute("ThongTinNguoiDung", "TaiKhoan/Info", "~/taikhoan/ThongTinNguoiDung.aspx"); // thong tin tai khoan
            routes.MapPageRoute("CapNhatNguoiDung", "TaiKhoan/CapNhat", "~/taikhoan/CapNhatNguoiDung.aspx"); // cap nhat thong tin
            //routes.MapPageRoute("ThuVienDoc", "TaiKhoan/ThuVienDoc", "~/taikhoan/ThuVienDoc.aspx"); // thu vien doc
            routes.MapPageRoute("Thongbao", "TaiKhoan/Thongbao", "~/taikhoan/Thongbao.aspx"); // thong bao
            // QuanLyPhim
           // routes.MapPageRoute("ThemPhim", "TaiKhoan/ThemPhim", "~/QuanLyPhim/ThemPhim.aspx"); // them Phim
           // routes.MapPageRoute("ThemTap_Phim", "TaiKhoan/ThemTap_Phim-{IdPhim}", "~/QuanLyPhim/ThemTap_Phim.aspx"); // Them Tap_Phim
           // routes.MapPageRoute("DanhsachTap_Phim", "TaiKhoan/DanhsachTap_Phim-{IdPhim}", "~/QuanLyPhim/DanhsachTap_Phim.aspx"); // Danh sach Tap_Phim
           // routes.MapPageRoute("CapNhatPhim", "TaiKhoan/CapNhatPhim-{IdPhim}", "~/QuanLyPhim/CapNhatPhim.aspx"); // Cap Nhat Phim
           // routes.MapPageRoute("CapNhatTap_Phim", "TaiKhoan/CapNhatTap_Phim-{IdTap_Phim}", "~/QuanLyPhim/CapNhatTap_Phim.aspx"); // Cap Nhat Phim

            // trang Phim
            routes.MapPageRoute("Thong tin Phim", "Phim/{LinkRawPhim}-{IdPhim}", "~/TrangPhim/ThongTinPhim.aspx"); // DocPhim
            routes.MapPageRoute("DocPhim", "Phim/{LinkRawPhim}-{IdPhim}/{IdTap_Phim}", "~/TrangPhim/TapPhim.aspx"); // Tap_Phim
            routes.MapPageRoute("LoadDanhSachTap_Phim", "LoadDanhSachTap_Phim/{LinkRawPhim}/{IdPhim}", "~/TrangPhim/LoadDanhSachTap_Phim.aspx"); // Tap_Phim
            

             //trang 505
            routes.MapPageRoute("404", "404", "~/404.aspx");

            routes.MapPageRoute("testvideo", "testvideo", "~/testvideo.aspx"); 

            // admin
                 // index
            routes.MapPageRoute("index_ad", "cp-admin", "~/admin/index.aspx"); // 
            routes.MapPageRoute("cauhinh_ad", "cp-admin/Cauhinh", "~/admin/cauhinh.aspx"); // 
            routes.MapPageRoute("log404_ad", "cp-admin/Log-404", "~/admin/log-404.aspx"); // 
            routes.MapPageRoute("loggd_ad", "cp-admin/Log-gd", "~/admin/log-giaodich.aspx"); // 
                  // nguoi dung
                        // them moi
            routes.MapPageRoute("ThemNguoiDung_ad", "cp-admin/Nguoidung/Them", "~/admin/nguoidungs/ThemNguoiDung.aspx"); // 
                        //danhsach
            routes.MapPageRoute("DanhSachNGUOIDUNG_ad", "cp-admin/Nguoidung/DanhSach", "~/admin/nguoidungs/DanhSach.aspx"); // 
                         //capnhat
            routes.MapPageRoute("CapNhatNGUOIDUNG_ad", "cp-admin/Nguoidung/CapNhat-{id_user}", "~/admin/nguoidungs/capnhat.aspx"); // 
                       // nap coin
            routes.MapPageRoute("CapNhatCoinNGUOIDUNG_ad", "cp-admin/Nguoidung/NapCoin-{id_user}", "~/admin/nguoidungs/napcoin.aspx"); // 
                 //Phim
                         //danhsach
            routes.MapPageRoute("DanhSachPhim_ad", "cp-admin/Phim/DanhSach", "~/admin/Phims/DanhSach.aspx"); // 
                        // them Phim
            routes.MapPageRoute("ThemPhim_ad", "cp-admin/Phim/themPhim", "~/admin/Phims/themPhim.aspx"); // 
                       // cap nhat Phim
            routes.MapPageRoute("CapNhatPhim_ad", "cp-admin/Phim/capnhat-{IdPhim}", "~/admin/Phims/capnhat.aspx"); // 
                        // binh luan
            routes.MapPageRoute("dnhsachbinhluan_ad", "cp-admin/Phim/binhluan", "~/admin/Phims/binhluan.aspx"); // 
                        // thu vien
            routes.MapPageRoute("danhsachthuvien_ad", "cp-admin/Phim/thuvien", "~/admin/Phims/thuvien.aspx"); // 
                        // danh gia
            routes.MapPageRoute("danhsachdanhgia_ad", "cp-admin/Phim/danhgia", "~/admin/Phims/danhgia.aspx"); // 
                //Tap_Phim
                      //danhsach
            routes.MapPageRoute("DanhSachTap_Phim_ad", "cp-admin/tap-phim/DanhSach-{IdPhim}", "~/admin/TapPhims/DanhSach.aspx"); // 
                     // them Tap_Phim
            routes.MapPageRoute("ThemTap_Phim_ad", "cp-admin/tap-phim/Them-tap-phim-{IdPhim}", "~/admin/TapPhims/ThemTapPhim.aspx"); // 
                      //capnhat
            routes.MapPageRoute("capnhatTap_Phim_ad", "cp-admin/tap-phim/capnhat-{IdTap_Phim}", "~/admin/TapPhims/capnhat.aspx"); // 
               // the loai
            routes.MapPageRoute("DanhSachTheLoai_ad", "cp-admin/theloai/DanhSach", "~/admin/theloais/DanhSach.aspx"); // 
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            GhiUrl(RouteTable.Routes);// goi ham cau hinh duong dan
        }

        

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            if (exc is HttpUnhandledException)
            {
                // Pass the error on to the error page.
                Server.Transfer("404", true);
            }
        }


        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }


    }
}