using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.NguoiDungs
{
    public partial class UiCapNhat : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static DB_USER ThongTin = new DB_USER();
        public  string IMG = "";
        public  string MaKhoa = "";
        public  string matkhau_old = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    LoadThongTinNguoiDung();
                    NguoiDung.CheckAdmin(Convert.ToInt32(NguoiDungs.quyen_han));
                    LoadThongTin();
                }
                catch (Exception err)
                {
                    string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                                 "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                    Response.Redirect(url);
                }
            }
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
        // load thong tin nguoi dung can cap nhat
        public void LoadThongTin()
        {
            int id_user = Convert.ToInt32(Page.RouteData.Values["id_user"]);

            var dt = (from q in dl.DB_USERs where q.id_user == id_user select q);

            if (dt != null)
            {
                ThongTin = dt.First();

                fullname.Text = ThongTin.fullname;
                email.Text = ThongTin.mail;
                coin.Text = ThongTin.coin.ToString();
                QuyenHan.SelectedIndex = Convert.ToInt32(ThongTin.quyen_han);
                taikhoan.Text = ThongTin.ten_dangnhap;
                matkhau.Text = ThongTin.matkhau_user;
                matkhau_old = ThongTin.matkhau_user;
                MaKhoa = ThongTin.ma_khoa;
                IMG = ThongTin.img_user;
                trangthai.SelectedIndex = Convert.ToInt32(ThongTin.status_);
            }
        }

        protected void capnhat_Click(object sender, EventArgs e)
        {
            var dt =
                from q in dl.DB_USERs where q.id_user == ThongTin.id_user select q;
            if (dt != null)
            {
                // DB_USER db = dl.DB_USERs.Single(q => q.id_user == ThongTin.id_user);
                var dtUser = (from q in dl.DB_USERs
                              where q.id_user ==
                                  ThongTin.id_user
                              select q);
                DB_USER db = dtUser.First();
                db.fullname = fullname.Text;
                db.mail = email.Text;
                // db.coin = Convert.ToInt32(coin.Text);
                db.quyen_han = QuyenHan.SelectedItem.Value;
                db.status_ = Convert.ToInt32(trangthai.SelectedItem.Value);
                if (matkhau.Text != matkhau_old)
                {
                    string ma_khoa = HeThong.MH_MD5(taikhoan.Text +
                                                    matkhau.Text);  // tao ra key ma khó
                    db.ma_khoa = ma_khoa;
                    db.matkhau_user = HeThong.MH_MD5(matkhau.Text);
                }
                if (UpAvatar.HasFile)
                {
                    db.img_user = HeThong.LaySoNgauNhien().ToString() + UpAvatar.FileName;
                    UpAvatar.SaveAs(Server.MapPath("~\\public\\img\\www\\avatar\\") +
                                    db.img_user);
                }
                dl.SubmitChanges();
                string scriptText =
                    "alert('Cập nhật thành công !');  window.location='" +
                    Request.ApplicationPath + "cp-admin/nguoidung/capnhat-" +
                    ThongTin.id_user + "'";
                ScriptManager.RegisterStartupScript(
                    this, this.GetType(), "CapNhatThanhCong", scriptText, true);
            }
        }

    }  //
}