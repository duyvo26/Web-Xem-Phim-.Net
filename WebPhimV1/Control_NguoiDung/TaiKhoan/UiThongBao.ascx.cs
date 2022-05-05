using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TaiKhoan
{
    public partial class UiThongBao : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public static DB_USER NguoiDungs = new DB_USER();
        public static List<DB_THONGBAO> ThongBaos = new List<DB_THONGBAO>();
        public static int page_number = 0; // trang thu n
        public static int SumPage = 0;

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
                    LoadThongBao();
                    DocAll();
                    TruyCap();

                }
                catch (Exception err)
                {
                    string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                    Response.Redirect(url);
                }

            }
        }

        //load thong tin nguoi dung
        private void LoadThongTinNguoiDung()
        {
            String MaKhoa = "";
            MaKhoa = Request.Cookies["Log"].Value;
            NguoiDungs = null;
            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            if (dt != null)
            {
                NguoiDungs = dt.FirstOrDefault();
            }
            else
            {
                NguoiDungs = null;
            }
        }

        //Load danh sach Phim da dang 
        private void LoadThongBao()
        {
            ThongBaos = null;

            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page_number = Convert.ToInt32(Request.QueryString["page"]);
            }
            else
            {
                page_number = 0;
            }
            int take = 51; // lay n phan tu
            int skip = page_number * take; // bo qua trang thu n

            SumPage = (from q in dl.DB_THONGBAOs where q.id_user == NguoiDungs.id_user select q).Count() / take;

            var dt = (from q in dl.DB_THONGBAOs where q.id_user == NguoiDungs.id_user select q).OrderByDescending(q => q.updated_at).Skip(skip).Take(take);

            if (dt != null)
            {
                ThongBaos = dt.ToList();
            }
        }

        private void DocAll()
        {

            if (!string.IsNullOrEmpty(Request.QueryString["all"]))
            {
                //cap nhat lai link
                var dt = (from q in dl.DB_THONGBAOs where q.id_user == NguoiDungs.id_user select q.id);
                foreach (var a in dt)
                {
                    DB_THONGBAO db = dl.DB_THONGBAOs.Single(q => q.id == a);
                    db.truy_cap = "true";
                    dl.SubmitChanges();
                }

            }
        }

        private void DeleteAll()
        {

            if (!string.IsNullOrEmpty(Request.QueryString["delete"]))
            {
                var dt = (from q in dl.DB_THONGBAOs where q.id_user == NguoiDungs.id_user select q);
                dl.DB_THONGBAOs.DeleteAllOnSubmit(dt);
                dl.SubmitChanges();
            }
        }

        //load thong tin nguoi dung
        public string getIMG(int id)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id select q);

            if (dt != null && dt.Count() > 0)
            {
                return dt.First().img_user;
            }
            else
            {
                return "";
            }
        }

        //truy cap update thong bao
        private void TruyCap()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                var dt = (from q in dl.DB_THONGBAOs where q.id == id select q).First();
                if (dt.truy_cap == null)
                {
                    //cap nhat lai link
                    DB_THONGBAO db = dl.DB_THONGBAOs.Single(q => q.id == id);
                    db.truy_cap = "true";
                    dl.SubmitChanges();
                }

                string scriptText = "window.stop();window.location='" + Request.Url.GetLeftPart(UriPartial.Authority) + "/" + dt.url + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
            }
        }

    } //
}