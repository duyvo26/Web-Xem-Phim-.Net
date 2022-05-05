using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace WebPhimV1.Code
{
    public class NguoiDung
    {


        public static string FileName_IMG = "";


        // dem thong bao cua nguoi dung
        public static int DemThongBao(int id)
        {
            using (DataWebPhimDataContext dl = new DataWebPhimDataContext()) {
                var dt = 0; 
                try
                {
                     dt = (from q in dl.DB_THONGBAOs where q.id_user == id && q.truy_cap == null select q).Count();
                }
                catch (Exception ex){}
                if (dt > 0)
                {
                    return dt;
                }
                else
                {
                    return 0;
                }
            }
            
        }


        public static void ThemThongBao(int id, int id_phanhoi, string noidung, string urls)
        {
            using(DataWebPhimDataContext dl = new DataWebPhimDataContext()){
                        DB_THONGBAO db = new DB_THONGBAO();
                        db.id_user = id;
                        db.noi_dung = noidung;
                        db.url = urls;
                        db.id_user_phanhoi = id_phanhoi;
                        db.created_at = DateTime.Now;
                        db.updated_at = DateTime.Now;
                        dl.DB_THONGBAOs.InsertOnSubmit(db);
                        dl.SubmitChanges();  
        }

    }

        // add cookie voi ma khoa cua nguoi dung
        public static void SetCookie(string ma_khoa)
        {
            HttpCookie Log = new HttpCookie("Log");
            Log.Value = ma_khoa;
            Log.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(Log);
        }

        // xoa cookie dang xuat
        public static void DelCookie()
        {
            foreach (string key in HttpContext.Current.Request.Cookies.AllKeys)
            {
                HttpCookie c = HttpContext.Current.Request.Cookies[key];
                c.Expires = DateTime.Now.AddMonths(-1);
                HttpContext.Current.Response.AppendCookie(c);
            }

           // HttpCookie Log = new HttpCookie("Log");
            //Log.Expires = DateTime.Now.AddDays(-1);
           // HttpContext.Current.Response.Cookies.Add(Log);
        }

        // danh hieu tren web
        public static string HuyHieuUser(int quyenhan)
        {
            if (quyenhan != 0)
            {
                if (quyenhan == 1)
                {
                    return "&nbsp;<span class='badge badge-info'>Mod</span>";
                }
                else
                {
                    return "&nbsp;<span class='badge badge-danger'>Admin</span>";
                }
            }
            else
            {
                return "";
            }
        }

        //kiem tra nguoi dung da dang nhap chua
        public static bool CheckLogin()
        {
                if (HttpContext.Current.Request.Cookies["Log"] != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
        }


        //kiem tra quyen mod
        public static void CheckAdmin(int maQuyen)
        {
            if (maQuyen == 0)
            {
                HttpContext.Current.Response.Redirect("~/");
            }
            if (maQuyen == 1)
            {
                HttpContext.Current.Response.Redirect("~/cp-admin");
            }
        }
        //kiem tra quyen mod
        public static void CheckMod(int maQuyen)
        {
            if (maQuyen == 0)
            {
                HttpContext.Current.Response.Redirect("~/");
            }
        }

        // upload anh len
        public static void upload_img()
        {
            if (HttpContext.Current.Request.Files["UploadedFile"] != null)
            {
                HttpPostedFile MyFile = HttpContext.Current.Request.Files["UploadedFile"];
                //Setting location to upload files
                string TargetLocation = HttpContext.Current.Server.MapPath("/public/img/www/avatar/");

                if (MyFile.ContentLength > 2)
                {
                    //Determining file name. You can format it as you wish.
                    FileName_IMG = HeThong.LaySoNgauNhien().ToString() + MyFile.FileName;
                    //Determining file size.
                    int FileSize = MyFile.ContentLength;
                    //Creating a byte array corresponding to file size.
                    byte[] FileByteArray = new byte[FileSize];
                    //Posted file is being pushed into byte array.
                    MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                    //Uploading properly formatted file to server.
                    MyFile.SaveAs(TargetLocation + FileName_IMG);
                }
            }

        }
    }

    //
}