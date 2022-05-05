using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TaiKhoan
{
    public partial class UiDangKy : System.Web.UI.UserControl
    {

        DataWebPhimDataContext dl = new DataWebPhimDataContext();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.Form["taikhoan"]))
                {
                    LoadDangKy();
                }
            }
            catch (Exception err)
            {
                string url = "/404?err=true&&vitri="+ this.GetType().Name + "&&tenloi=" + err.Message;
                Response.Redirect(url);
            }

        }

        private void LoadDangKy()
        {
            try
            {
                string taikhoan = Request.Form["taikhoan"].ToString().ToLower();
                string email = Request.Form["email"].ToString();
                string fullname = Request.Form["fullname"].ToString();
                string password = Request.Form["Password1"].ToString();
                string ma_khoa = HeThong.MH_MD5(taikhoan + password); // tao ra key ma khó

                var dt = (from q in dl.DB_USERs
                          where q.ten_dangnhap == taikhoan || q.mail == email
                          select q);

                if (dt != null && dt.Count() > 0)
                {
                    noti.Text = "Tài khoản hoặc địa chỉ mail này đã tồn tài !";
                }
                else
                {
                    taikhoan = HeThong.LocKyTuDatBiet(HeThong.LocDauTiengViet(taikhoan));
                    password = HeThong.LocKyTuDatBiet(HeThong.LocDauTiengViet(password));

                    password = HeThong.MH_MD5(password); // ma hoa mat khau
      

                    try
                    {
                        dl.DangKyNguoiDung(fullname, taikhoan, email, password, ma_khoa);
                       // noti.Text = "Đăng ký thành công";
                        string scriptText = "alert('Đăng ký thành công !'); window.location='" + Request.ApplicationPath + "dangnhap'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                    }
                    catch
                    {
                        noti.Text = "Có lỗi xảy ra vui lòng kiểm tra lại";
                    }
                }
            }
            catch
            {
                noti.Text = "Có lỗi sải ra vui lòng thử lại";
            }


        }




        //
    }
}