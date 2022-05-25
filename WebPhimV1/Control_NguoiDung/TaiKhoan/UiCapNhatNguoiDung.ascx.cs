using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TaiKhoan
{
    public partial class UiCapNhatNguoiDung : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_USER NguoiDungs = new DB_USER();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (NguoiDung.CheckLogin() != true) // kiem tra dang nhap cua nguoi dung
                {
                    Response.Redirect("/dangnhap");
                    NguoiDung.DelCookie();
                }
                else
                {
                    LoadThongTinNguoiDung();
                    CapNhatNguoiDung();

                } //

            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }

        }

        //load thong tin người dùng
        private void LoadThongTinNguoiDung()
        {
            NguoiDungs = Theme.NguoiDung.NguoiDungs;

           // String MaKhoa = "";
           // MaKhoa = Request.Cookies["Log"].Value;
            //NguoiDungs = null;
           // var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

           // if (dt != null)
           // {
            //    NguoiDungs = dt.FirstOrDefault();
           // }
           // else
           // {
           //     NguoiDungs = null;
           // }
        }
        private void CapNhatNguoiDung()
        {
            if (!string.IsNullOrEmpty(Request.Form["capnhat"]))
            {
                string fullname = Request.Form["fullname"];
                string email = Request.Form["email"];

                if (fullname == "" || email == "")
                {
                    string scriptText = "alert('Vui lòng nhập đầy đủ thông tin !');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
                else
                {

                    string Img_Url = null;
                    if (FileUpload1.HasFile)
                    {
                        Img_Url = HeThong.LaySoNgauNhien().ToString() + FileUpload1.FileName;
                        string filePath = MapPath("/public/img/www/avatar/" + Img_Url);
                        FileUpload1.SaveAs(filePath);
                        // up vao csdl
                        //dl.Capnhatnguoidung(NguoiDungs.id_user, fullname, email, Img_Url);

                    }
                    else
                    {
                        // up vao csdl
                        Img_Url = NguoiDungs.img_user;
                        //dl.Capnhatnguoidung(NguoiDungs.id_user, fullname, email, IMG);
                    }
                    // cap nhat nguoi dung vao csdl
                    var dtUser = (from q in dl.DB_USERs where q.id_user == NguoiDungs.id_user select q);
                    DB_USER db = dtUser.First();
                    db.fullname = fullname;
                    db.mail = email;
                    db.img_user = Img_Url;
                    dl.SubmitChanges();

                    string scriptText = "alert('Cập nhật thông tin thành công !'); window.location='" + Request.ApplicationPath + "taikhoan/capnhat'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
            }
            // doi mat khau
            if (!string.IsNullOrEmpty(Request.Form["doimatkhau"]))
            {
                string pass_old = Request.Form["pass_old"];
                string pass_new = Request.Form["pass_new"];
                // ma hoa lay pass goc
                string pass_goc = HeThong.MH_MD5(HeThong.LocDauTiengViet(pass_old));
                // truy cap sql
                var dt = (from q in dl.DB_USERs where q.ten_dangnhap == NguoiDungs.ten_dangnhap && q.matkhau_user == pass_goc select q).FirstOrDefault();
                if (dt == null)
                {
                    string scriptText = "alert('Mật khẩu cũ không đúng !'); ";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
                else
                {
                    DB_USER DTK = dl.DB_USERs.Single(q => q.ten_dangnhap == NguoiDungs.ten_dangnhap && q.matkhau_user == pass_goc);
                    DTK.matkhau_user = HeThong.MH_MD5(HeThong.LocDauTiengViet(pass_new));
                    string ma_khoa = HeThong.MH_MD5(HeThong.LocDauTiengViet(NguoiDungs.ten_dangnhap + pass_new));
                    DTK.ma_khoa = ma_khoa;
                    dl.SubmitChanges();
                    NguoiDung.SetCookie(ma_khoa);
                    string scriptText = "alert('Cập nhật tài khoản thành công !'); window.location='" + Request.ApplicationPath + "taikhoan/info'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }

            }

        }

    } //
}