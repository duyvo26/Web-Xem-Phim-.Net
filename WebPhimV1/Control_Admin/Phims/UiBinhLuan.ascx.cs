using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Phims
{
    public partial class UiBinhLuan : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_USER NguoiDungs = new DB_USER();
        public  List<DB_COMMENT> DSBinhLuan = new List<DB_COMMENT>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadThongTinNguoiDung();
                NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                LoadDsBL();
                XoaBL();
                capNhatBL();
            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        public static string StripHTML(string input)
        {
            return Regex.Replace(input, "<.*?>", String.Empty);
        }

        // load thong tin nguoi dung
        public void LoadThongTinNguoiDung()
        {
            NguoiDungs = Admin.Theme.NguoiDungs;

            // String MaKhoa = Request.Cookies["log"].Value;

            // var dt = (from q in dl.DB_USERs
            //          where q.ma_khoa == MaKhoa
            //          select q);

            // if (dt != null)
            //{
            //    NguoiDungs = dt.First();
            //}
        }

        // load thong tin nguoi dung
        public void LoadDsBL()
        {
            var dt = (from q in dl.DB_COMMENTs select q)
                         .OrderByDescending(q => q.updated_at);

            if (dt != null)
            {
                DSBinhLuan = dt.ToList();
            }
        }

        // load thong tin nguoi dung
        public string LoadName(int id_user)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id_user select q)
                         .FirstOrDefault();

            if (dt != null)
            {
                return dt.ten_dangnhap.ToString();
            }
            else
            {
                return "";
            }
        }
        public string LoadNamePhim(int id_phim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id_phim select q)
                         .FirstOrDefault();

            if (dt != null)
            {
                return dt.ten_phim.ToString();
            }
            else
            {
                return "";
            }
        }

        public void XoaBL()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Xoa"]))
            {
                try
                {
                    int ID = Convert.ToInt32(Request.QueryString["Xoa"]);

                    var dt = (from q in dl.DB_COMMENTs where q.id_cmt == ID select q)
                                 .FirstOrDefault();
                    dl.DB_COMMENTs.DeleteOnSubmit(dt);
                    var dts =
                        (from q in dl.DB_COMMENTs where q.id_phanhoi == ID select q);
                    dl.DB_COMMENTs.DeleteAllOnSubmit(dts);
                    dl.SubmitChanges();

                    string scriptText =
                        "alert('Xoá bình luận thành công !'); window.location='" +
                        Request.ApplicationPath + "cp-admin/Phim/binhluan" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                        "alertMessage", scriptText, true);

                }
                catch
                {
                }
            }
        }

        private void capNhatBL()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["status"]))
            {
                int ID = int.Parse(Request.QueryString["status"]);
                // cap nhat Phim
                var dt = from q in dl.DB_COMMENTs where q.id_cmt == ID select q;
                int st;
                if (dt.First().status_ == 1)
                {
                    st = 0;
                }
                else
                {
                    st = 1;
                }

                DB_COMMENT dbcm = dt.First();
                dbcm.status_ = st;
                dl.SubmitChanges();
            }
        }

    }  //
}