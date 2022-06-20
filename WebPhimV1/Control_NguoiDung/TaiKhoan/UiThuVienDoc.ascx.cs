using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TaiKhoan
{
    public partial class UiThuVienDoc : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public  DB_USER NguoiDungs = new DB_USER();
        public  int page_number = 0; // trang thu n
        public static  int SumPage = 0;
        public  List<LayThuVienDocResult> ThuVien = new List<LayThuVienDocResult>();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (NguoiDung.CheckLogin() != true) // kiem tra dang nhap cua nguoi dung
            {
                Response.Redirect("/dangnhap");
                NguoiDung.DelCookie();
            }
            else
            {
                try
                {

                    LoadThongTinNguoiDung();
                    LoadThuVien();
                    XoaThuVien();

                }
                catch (Exception err)
                {
                    string url = "~/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                    Response.Redirect(url);
                }
            }
        }
        //load thong tin người dùng
        private void LoadThongTinNguoiDung()
        {
            NguoiDungs = Theme.NguoiDung.NguoiDungs;

           // String MaKhoa = "";
           // MaKhoa = Request.Cookies["Log"].Value;
           // NguoiDungs = null;
           // var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

           // if (dt != null)
           // {
           //     NguoiDungs = dt.FirstOrDefault();
           // }
           // else
            //{
            //    NguoiDungs = null;
            //}
        }

        public DateTime GetDateTimeTV(int id_tap_phim)
        {
            var dt = (from q in dl.DB_THUVIENs where q.id_tap_phim == id_tap_phim && q.id_user == NguoiDungs.id_user select q.updated_at).FirstOrDefault();
            if (dt != null)
            {
                return dt;
            }
            else
            {
                return DateTime.ParseExact("", "d", null);
            }
        }

        public DateTime GetDateTimePhim(int id_phim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id_phim select q.updated_at).FirstOrDefault();
            if (dt != null)
            {
                return dt;
            }
            else
            {
                return DateTime.ParseExact("", "d", null);
            }
        }

        private void LoadThuVien()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page_number = Convert.ToInt32(Request.QueryString["page"]);

                int take = 29; // lay n phan tu
                int skip = page_number * take; // bo qua trang thu n
                SumPage = (from q in dl.LayThuVienDoc(NguoiDungs.id_user) select q).Count() / take;

                var dt = (from q in dl.LayThuVienDoc(NguoiDungs.id_user) select q).Skip(skip).Take(take);

                try
                {
                    ThuVien = dt.ToList();
                }
                catch
                {
                    noti.Text = "Chưa có thông tin !";
                }
            }
            else
            {
                page_number = Convert.ToInt32(Request.QueryString["page"]);

                int take = 29; // lay n phan tu
                int skip = 0 * take; // bo qua trang thu n
                SumPage = (from q in dl.LayThuVienDoc(NguoiDungs.id_user) select q).Count() / take;

                var dt = (from q in dl.LayThuVienDoc(NguoiDungs.id_user) select q).Skip(skip).Take(take);

                try
                {
                    ThuVien = dt.ToList();
                }
                catch
                {
                    noti.Text = "Chưa có thông tin !";
                }
            }

        }

        private void XoaThuVien()
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString["XoaPhim"]))
                {
                    int idThuVien = Convert.ToInt32(Request.QueryString["XoaPhim"]);

                    dl.XoaThuVien(NguoiDungs.id_user, idThuVien);
                    string scriptText = "alert('Xoá thành công !'); window.location='" + Request.ApplicationPath + "taikhoan/info'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
            }
            catch
            {
                Response.Redirect("/404");
            }
        }

        public string TenTap_Phim(int idTap_Phim)
        {
            var dt = (from q in dl.DB_TAP_PHIMs where q.id_tap_phim == idTap_Phim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_tap_phim;
            }
            else
            {
                return "";
            }
        }

    } //
}