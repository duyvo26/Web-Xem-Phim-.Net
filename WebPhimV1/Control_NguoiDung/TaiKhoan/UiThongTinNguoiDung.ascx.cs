using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TaiKhoan
{
    public partial class UiThongTinNguoiDung : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public  DB_USER NguoiDungs = new DB_USER();
        public  List<DB_PHIM> PhimDaDang = new List<DB_PHIM>();
        public  List<DB_COMMENT> BinhLuanNguoiDung = new List<DB_COMMENT>();
        public  List<DB_LOG_COIN> LogPhim = new List<DB_LOG_COIN>();
        public  int page_number = 0; // trang thu n
        public static  int SumPage = 0;

  

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
                    XoaPhim_Click();
                    LoadBinhLuanNguoiDung();
                    LoadDoanhThu();
                    XoaBinhLuan();
                    DangXuat();

                }
                catch (Exception err)
                {
                    string url = "~/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                    Response.Redirect(url);
                }

            }

        }

        //format time
        public string formatTime(string str)
        {
            DateTime date = Convert.ToDateTime(str);
            return date.ToString("MM/dd/yyyy HH:mm:ss");
        }

        //load thong tin nguoi dung
        private void LoadThongTinNguoiDung()
        {
            NguoiDungs = Theme.NguoiDung.NguoiDungs;

            //String MaKhoa = "";
           // MaKhoa = Request.Cookies["Log"].Value;
           // NguoiDungs = null;
            //var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

           // if (dt != null)
           // {
            //    NguoiDungs = dt.FirstOrDefault();
           // }
           // else
           // {
            //    NguoiDungs = null;
           // }
        }

        //dang xuat
        private void DangXuat()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["DangXuat"]))
            {
                NguoiDung.DelCookie();
                string scriptText = "alert('Đăng xuất thành công !'); window.location='" + Request.ApplicationPath + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
            }
        }

        //Load danh sach Phim da dang 
        private void LoadPhimDaDang()
        {
            PhimDaDang = null;
            string tenPhim = "";

            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page_number = Convert.ToInt32(Request.QueryString["page"]);
            }
            else
            {
                page_number = 0;
            }
            int take = 9; // lay n phan tu
            int skip = page_number * take; // bo qua trang thu n
            if (!string.IsNullOrEmpty(Request.Form["timPhim"]))
            {
                tenPhim = Request.Form["timPhim"].ToString();
            }
            SumPage = (from q in dl.DB_PHIMs where q.id_user == NguoiDungs.id_user select q).Where(q => q.ten_phim.Contains(tenPhim)).Count() / take;

            var dt = (from q in dl.DB_PHIMs where q.id_user == NguoiDungs.id_user select q).OrderByDescending(q => q.updated_at).Skip(skip).Where(q => q.ten_phim.Contains(tenPhim)).Take(take);

            if (dt != null)
            {
                PhimDaDang = dt.ToList();
            }

        }

        // lay ten cua Phim
        public string tenPhim(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_phim.ToString();
            }
            else
            {
                return "";
            }

        }

        // lay link raw cua Phim
        public string LinkRaw(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.link_raw.ToString();
            }
            else
            {
                return "";
            }

        }
        // load ten nguoi dung
        public string GetTenTaiKhoan(int id_user)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id_user select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_dangnhap.ToString();
            }
            else
            {
                return "";
            }

        }

        // load coin Phim
        public string GetCoinPhim(int id_phim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id_phim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.coin_phim.ToString();
            }
            else
            {
                return "";
            }

        }

        // load binh luan cua nguoi dung
        private void LoadBinhLuanNguoiDung()
        {
            BinhLuanNguoiDung = null;
            var dt = (from q in dl.DB_COMMENTs where q.id_user == NguoiDungs.id_user select q).OrderByDescending(q => q.created_at).Take(20);

            if (dt != null)
            {
                BinhLuanNguoiDung = dt.ToList();
            }
        }

        // load log doanh thu
        private void LoadDoanhThu()
        {
            LogPhim = null;
            var dt = (from q in dl.DB_LOG_COINs where q.id_user_nhan == NguoiDungs.id_user || q.id_user_chuyen == NguoiDungs.id_user select q).OrderByDescending(q => q.created_at);

            if (dt != null)
            {
                LogPhim = dt.ToList();
            }
        }

        // thu
        public int Thu()
        {
            var dt = (from q in dl.DB_LOG_COINs where q.id_user_nhan == NguoiDungs.id_user select q).ToList();
            var sum = dt.Select(c => Convert.ToInt32(c.coin)).Sum();
            if (dt != null)
            {
                return sum;
            }
            else
            {
                return 0;
            }
        }

        // thu
        public int Chi()
        {
            var dt = (from q in dl.DB_LOG_COINs where q.id_user_chuyen == NguoiDungs.id_user select q).ToList();
            var sum = dt.Select(c => Convert.ToInt32(c.coin)).Sum();
            if (dt != null)
            {
                return sum;
            }
            else
            {
                return 0;
            }
        }

        private void XoaPhim_Click()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["xoa-Phim"]))
            {

                int ID = Convert.ToInt32(Request.QueryString["xoa-Phim"]);

                var Phim = (from q in dl.DB_PHIMs where q.id_phim == ID && q.id_user == NguoiDungs.id_user select q).FirstOrDefault();
                var vote = (from q in dl.DB_VOTEs where q.id_phim == ID select q);
                var luotxem = (from q in dl.DB_LUOTXEMs where q.id_phim == ID select q);
                var thuvien = (from q in dl.DB_THUVIENs where q.id_phim == ID select q);
                var comment = (from q in dl.DB_COMMENTs where q.id_phim == ID select q);
                var Tap_Phim = (from q in dl.DB_TAP_PHIMs where q.id_phim == ID select q);

                if (thuvien != null) dl.DB_THUVIENs.DeleteAllOnSubmit(thuvien);
                if (luotxem != null) dl.DB_LUOTXEMs.DeleteAllOnSubmit(luotxem);
                if (vote != null) dl.DB_VOTEs.DeleteAllOnSubmit(vote);
                if (comment != null) dl.DB_COMMENTs.DeleteAllOnSubmit(comment);
                if (Tap_Phim != null) dl.DB_TAP_PHIMs.DeleteAllOnSubmit(Tap_Phim);
                //
                if (Phim != null)
                {
                    dl.DB_PHIMs.DeleteOnSubmit(Phim);
                    dl.SubmitChanges();
                }
                string scriptText = "alert('Xoá phim thành công !'); window.location='" + Request.ApplicationPath + "taikhoan/info?page=" + page_number + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "xoaPhim", scriptText, true);
            }
        }

        private void XoaBinhLuan()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["XoaBinhLuan"]))
            {
                int ID = Convert.ToInt32(Request.QueryString["XoaBinhLuan"]);
                var dt = (from q in dl.DB_COMMENTs where q.id_cmt == ID && q.id_user == NguoiDungs.id_user select q).FirstOrDefault();

                if (dt != null)
                {
                    dl.DB_COMMENTs.DeleteOnSubmit(dt);
                    var dts = (from q in dl.DB_COMMENTs where q.id_phanhoi == ID select q);
                    dl.DB_COMMENTs.DeleteAllOnSubmit(dts);
                    dl.SubmitChanges();
                    string scriptText = "alert('Xóa bình luận thành công'); window.location='" + Request.ApplicationPath + "taikhoan/info/" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
                else
                {

                    string scriptText = "alert('Có lỗi xảy ra '); window.location='" + Request.ApplicationPath + "taikhoan/info/" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
            }
        }

    } //
}