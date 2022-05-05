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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (NguoiDung.CheckLogin() != true) // kiem tra dang nhap cua nguoi dung
            {
                
                Response.Redirect("/dangnhap");NguoiDung.DelCookie();
            }
            LoadThongTinNguoiDung();
            NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
            

        }


        //load thong tin nguoi dung
        public void LoadThongTinNguoiDung()
        {
            String MaKhoa = Request.Cookies["log"].Value;

            var dt = (from q in dl.DB_USERs
                      where q.ma_khoa == MaKhoa
                      select q);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }






    }
}