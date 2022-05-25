using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin
{
    public partial class UiCauHinh : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_USER NguoiDungs = new DB_USER();
        public  DB_CAUHINH HeThongs = new DB_CAUHINH();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadThongTinNguoiDung();
                NguoiDung.CheckAdmin(Convert.ToInt32(NguoiDungs.quyen_han));

                LoadHeThong();
                
                LoadCapNhat();
            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        // load thong tin nguoi dung
        public void LoadThongTinNguoiDung()
        {
            NguoiDungs = Admin.Theme.NguoiDungs;
            // String MaKhoa = Request.Cookies["log"].Value;

            //  var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            // if (dt != null)
            // {
            //      NguoiDungs = dt.First();
            //  }
        }

        public void LoadHeThong()
        {
            HeThongs = Admin.Theme.listCauHinh;
            // var dt = (from q in dl.DB_CAUHINHs select q);

            // if (dt != null)
            /// {
            //     HeThongs = dt.First();
            //   }
        }

        public void LoadCapNhat()
        {
            string FileLogo = "";
            string FileThanhToan = "";
            string File404 = "";
            string FileNhanVat = "";
            string FileNen = "";
            string FileChu = "";
            string FileADS = "";
            string FileImgVideo = "";
            try
            {
                if (HttpContext.Current.Request.Files["UploadedFileLogo"] != null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFileLogo"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/logo/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileLogo = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileLogo);
                    }
                }

                if (HttpContext.Current.Request.Files["UploadedFileThanhToan"] !=
                    null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFileThanhToan"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/thanhtoan/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileThanhToan =
                            HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileThanhToan);
                    }
                }

                // up anh 404
                if (HttpContext.Current.Request.Files["UploadedFile404"] != null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFile404"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/404/");
                    if (MyFile.ContentLength > 2)
                    {
                        File404 = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + File404);
                    }
                }
                // up anh nhan vat
                if (HttpContext.Current.Request.Files["UploadedFileNhanVat"] != null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFileNhanVat"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/noti/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileNhanVat = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileNhanVat);
                    }
                }
                // up load anh nen thong bao

                if (HttpContext.Current.Request.Files["UploadedFileNen"] != null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFileNen"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/noti/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileNen = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileNen);
                    }
                }

                // up load anh chu thong bao

                if (HttpContext.Current.Request.Files["UploadedFileChu"] != null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFileChu"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/noti/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileChu = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileChu);
                    }
                }
                if (HttpContext.Current.Request.Files["Upvideo"] != null)
                {
                    HttpPostedFile MyFile = HttpContext.Current.Request.Files["Upvideo"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/video/quang-cao/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileADS = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileADS);
                    }
                }

                if (HttpContext.Current.Request.Files["UploadedFileImgVideo"] != null)
                {
                    HttpPostedFile MyFile =
                        HttpContext.Current.Request.Files["UploadedFileImgVideo"];
                    string TargetLocation =
                        HttpContext.Current.Server.MapPath("/public/img/www/quang-cao/");
                    if (MyFile.ContentLength > 2)
                    {
                        FileImgVideo =
                            HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                        int FileSize = MyFile.ContentLength;
                        byte[] FileByteArray = new byte[FileSize];
                        MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                        MyFile.SaveAs(TargetLocation + FileImgVideo);
                    }
                }

            }
            catch
            {
                noti.Text = "Có lỗi xảy ra, upload ảnh ko thành công !";
            }

            if (FileLogo == "")
            {
                FileLogo = HeThongs.logo_web;
            }
            if (FileThanhToan == "")
            {
                FileThanhToan = HeThongs.thanhtoan_online;
            }
            if (File404 == "")
            {
                File404 = HeThongs.img_404;
            }
            if (FileNhanVat == "")
            {
                FileNhanVat = HeThongs.img_nhanvat;
            }
            if (FileNen == "")
            {
                FileNen = HeThongs.img_nen;
            }
            if (FileChu == "")
            {
                FileChu = HeThongs.img_chu;
            }
            if (FileADS == "")
            {
                FileADS = HeThongs.video_quangcao;
            }
            if (FileImgVideo == "")
            {
                FileImgVideo = HeThongs.anh_video;
            }

            if (!string.IsNullOrEmpty(Request.Form["capnhat"]))
            {
                string tenweb = HeThong.XoaKhoanTrangThua(Request
                                                              .Form["tenweb"]
                                                              .ToString());
                string diachi = HeThong.XoaKhoanTrangThua(Request
                                                              .Form["diachi"]
                                                              .ToString());
                string mail = HeThong.XoaKhoanTrangThua(Request
                                                            .Form["mail"]
                                                            .ToString());
                string sdt_lh = HeThong.XoaKhoanTrangThua(Request
                                                              .Form["sdt_lh"]
                                                              .ToString());
                string lh_fb = HeThong.XoaKhoanTrangThua(Request
                                                             .Form["lh_fb"]
                                                             .ToString());
                string lh_zalo = HeThong.XoaKhoanTrangThua(Request
                                                               .Form["lh_zalo"]
                                                               .ToString());
                string copyright = HeThong.XoaKhoanTrangThua(Request
                                                                 .Form["copyright"]
                                                                 .ToString());
                string lh_itg = HeThong.XoaKhoanTrangThua(Request
                                                              .Form["lh_itg"]
                                                              .ToString());
                string event_noel = Request
                                        .Form["event_noel"]
                                        .ToString();
                string event_tet = Request
                                       .Form["event_tet"]
                                       .ToString();
                string fb_chat = HeThong.XoaKhoanTrangThua(Request
                                                               .Form["fb_chat"]
                                                               .ToString());
                string fb_page = HeThong.XoaKhoanTrangThua(Request
                                                               .Form["fb_page"]
                                                               .ToString());
                string fb_Comment = HeThong.XoaKhoanTrangThua(Request
                                                                  .Form["fb_Comment"]
                                                                  .ToString());
                string Time_Ads = Request
                                      .Form["Time_Ads"]
                                      .ToString();

                if (tenweb != "" || diachi != "" || mail != "" || sdt_lh != "" ||
                    lh_itg != "" || lh_fb != "" || lh_zalo != "" || copyright != "")
                {
                    if (event_noel == "true")
                    {
                        event_tet = "false";
                    }
                    if (event_tet == "true")
                    {
                        event_noel = "false";
                    }
                    // dl.CapNhatCauHinh(tenweb, FileLogo, FileThanhToan, mail, diachi,
                    // sdt_lh, lh_fb, lh_zalo, lh_itg, copyright);

                    DB_CAUHINH chdb = dl.DB_CAUHINHs.Single(q => q.id_cauhinh == 0);

                    chdb.ten_web = tenweb;
                    chdb.diachi_lh = diachi;
                    chdb.email_lh = mail;
                    chdb.sdt_lh = sdt_lh;
                    chdb.lh_fb = lh_fb;
                    chdb.lh_zalo = lh_zalo;
                    chdb.lh_itg = lh_itg;
                    chdb.copyright = copyright;
                    chdb.logo_web = FileLogo;
                    chdb.thanhtoan_online = FileThanhToan;
                    chdb.img_404 = File404;
                    chdb.img_nhanvat = FileNhanVat;
                    chdb.img_nen = FileNen;
                    chdb.img_chu = FileChu;
                    chdb.video_quangcao = FileADS;
                    chdb.anh_video = FileImgVideo;
                    chdb.event_noel = event_noel;
                    chdb.event_tet = event_tet;
                    chdb.Fb_mess = fb_chat;
                    chdb.Fb_page = fb_page;
                    chdb.Cm_FB = fb_Comment;
                    chdb.Time_Ads = Time_Ads;

                    dl.SubmitChanges();

                    string scriptText =
                        "alert('Cập nhật thành công !');  window.location='" +
                        Request.ApplicationPath + "cp-admin/cauhinh'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                        "alertMessage", scriptText, true);
                }
            }
        }

    }  //
}