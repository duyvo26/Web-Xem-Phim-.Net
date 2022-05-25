using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Admin
{
    public partial class Theme : System.Web.UI.MasterPage
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static DB_CAUHINH listCauHinh = new DB_CAUHINH();
        public  int quyen_han = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (NguoiDung.CheckLogin() != true)  // kiem tra dang nhap cua nguoi dung
            {
                Response.Redirect("~/dangnhap");
                NguoiDung.DelCookie();
            }
            LoadThongTinNguoiDung();
            NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
            LoadCauHinh();
        }
        
        private void LoadCauHinh()
        {
            listCauHinh = null;

            var dt = from q in dl.DB_CAUHINHs select q;
            if (dt.Count() > 0)
            {
                listCauHinh = dt.First();
            }
        }
        // load thong tin người dùng
        private void LoadThongTinNguoiDung()
        {
            
            String MaKhoa = "";
            if (Request.Cookies["Log"] != null)
            {
                MaKhoa = Request.Cookies["Log"].Value;
                var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

                if (dt != null)
                {
                    NguoiDungs = dt.FirstOrDefault();
                    quyen_han = Int32.Parse(NguoiDungs.quyen_han);
                    if (NguoiDungs.status_ == 0)
                    {
                        string scriptText =
                            "alert('Tài khoản tạm khoá !');  window.location='" +
                            Request.ApplicationPath + "taikhoan/info?DangXuat=true'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "khoa",
                                                            scriptText, true);
                    }
                }
            }
        }


    }
}