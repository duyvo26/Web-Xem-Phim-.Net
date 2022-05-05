using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TaiKhoan
{
    public partial class UiDangNhap : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.Form["taikhoan"]))
                {
                    LoadDangNhap();
                }
            }
            catch (Exception err)
            {
                string url = "/404?err=true&&vitri="+ this.GetType().Name + "&&tenloi=" + err.Message;
                Response.Redirect(url);
            }

        }

        private void LoadDangNhap()
        {
            string taikhoan = Request.Form["taikhoan"].ToString().ToLower();
            string matkhau = Request.Form["password"].ToString();
            string ma_khoa = HeThong.MH_MD5(taikhoan + matkhau); // tao ra key ma khó

            taikhoan = HeThong.LocKyTuDatBiet(HeThong.LocDauTiengViet(taikhoan));
            matkhau = HeThong.LocKyTuDatBiet(HeThong.LocDauTiengViet(matkhau));

            matkhau = HeThong.MH_MD5(matkhau); // ma hoa mat khau

            var dt = (from q in dl.DB_USERs
                      where q.ten_dangnhap == taikhoan && q.matkhau_user == matkhau 
                      select q).FirstOrDefault();

            if (dt != null)
            {
                if (dt.status_ != 1)
                {
                    string scriptText = "alert('Tài khoản đã bị khoá !'); window.location='" + Request.ApplicationPath + "dangnhap'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
                else
                {
                    // set cookie nguoi dun
                    NguoiDung.SetCookie(ma_khoa);

                    HttpCookie TK = new HttpCookie("TaiKhoan");
                    TK.Value = taikhoan;
                    TK.Expires = DateTime.Now.AddDays(30);
                    HttpContext.Current.Response.Cookies.Add(TK);

                    string scriptText = "alert('Đăng nhập thành công !'); window.location='" + Request.ApplicationPath + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
            }
            else
            {
                noti.Text = "Lỗi tài khoản hoặc mật khẩu không đúng";
            }

        }

        //
    }
}