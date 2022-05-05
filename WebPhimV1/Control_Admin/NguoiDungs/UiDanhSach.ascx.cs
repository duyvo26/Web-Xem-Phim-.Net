using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.NguoiDungs
{
    public partial class UiDanhSach : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static List<DB_USER> DanhSachND = new List<DB_USER>();
        protected void Page_Load(object sender, EventArgs e)
        {


                LoadThongTinNguoiDung();
                NguoiDung.CheckAdmin(Convert.ToInt32(NguoiDungs.quyen_han));
                try
                {
                    ThongBao();
                    LoadNguoiDung();
                    XoaNguoiDung();
                }
                catch (Exception err)
                {
                    string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                    Response.Redirect(url);
                }
            

        }

        public void ThongBao()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["noti"]))
            {
                string Thongbao = Request.QueryString["noti"].ToString();
                noti.Text = Thongbao;
            }
        }

        public void LoadNguoiDung()
        {
            DanhSachND = null;
            var dt = (from q in dl.DB_USERs select q);
            if (dt.Count() > 0)
            {
                DanhSachND = dt.ToList();
            }
        }
        public string HienQHan(int qh)
        {
            if (qh == 2)
            {
                return "Admin";
            }
            else if (qh == 1)
            {
                return "Mod";
            }
            else
            {
                return "User";
            }
        }

        //load thong tin nguoi dung
        public void LoadThongTinNguoiDung()
        {
            NguoiDungs = null;
            String MaKhoa = Request.Cookies["log"].Value;

            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q).OrderByDescending(q => q.created_at);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }

        public void XoaNguoiDung()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Xoa"]))
            {

                int ID = Convert.ToInt32(Request.QueryString["Xoa"]);
                int QH = Convert.ToInt32(NguoiDungs.quyen_han);
                //  dl.DelUser(ID, QH);
                var dt = (from q in dl.DB_USERs where q.id_user == ID && Convert.ToInt32(q.quyen_han) < QH select q).FirstOrDefault();

                var Phim = (from q in dl.DB_PHIMs where q.id_user == ID select q).FirstOrDefault();
                var vote = (from q in dl.DB_VOTEs where q.id_user == ID select q).FirstOrDefault();
                var luotxem = (from q in dl.DB_LUOTXEMs where q.id_user == ID select q).FirstOrDefault();
                var thuvien = (from q in dl.DB_THUVIENs where q.id_user == ID select q).FirstOrDefault();
                var comment = (from q in dl.DB_COMMENTs where q.id_user == ID select q).FirstOrDefault();

                if (thuvien != null) dl.DB_THUVIENs.DeleteOnSubmit(thuvien);
                if (luotxem != null) dl.DB_LUOTXEMs.DeleteOnSubmit(luotxem);
                if (vote != null) dl.DB_VOTEs.DeleteOnSubmit(vote);
                if (comment != null) dl.DB_COMMENTs.DeleteOnSubmit(comment);
                if (Phim != null) dl.DB_PHIMs.DeleteOnSubmit(Phim);

                if (dt != null)
                {

                    dl.DB_USERs.DeleteOnSubmit(dt);
                    dl.SubmitChanges();
                    string scriptText = "alert('Xoá người dùng thành công !'); window.location='" + Request.ApplicationPath + "cp-admin/nguoidung/danhsach" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "xoatc", scriptText, true);
                }
                else
                {
                    string scriptText = "alert('Không thể xoá người dùng này !'); window.location='" + Request.ApplicationPath + "cp-admin/nguoidung/danhsach" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "khongthe", scriptText, true);
                }
            }
        }

    }
}