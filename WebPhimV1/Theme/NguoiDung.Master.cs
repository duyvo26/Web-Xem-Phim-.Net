using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Theme
{
    public partial class NguoiDung : System.Web.UI.MasterPage
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static DB_CAUHINH listCauHinh = new DB_CAUHINH();
        public static int quyen_han = 0;
        public  string TaiKhoan = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                LoadCauHinh();
                LoadThongTinNguoiDung();
            }
            catch
            {
                string scriptText =
                    "alert('Vui Lòng Cấu Hình Thông Tin Cho Website !');  window.location='" +
                    Request.ApplicationPath + "404'";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                    "alertMessage", scriptText, true);
            }
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
            quyen_han = 0;
            NguoiDungs = null;
            String MaKhoa = "";
            if (Request.Cookies["Log"] != null)
            {
                MaKhoa = Request.Cookies["Log"].Value;
                var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

                if (dt != null)
                {
                    NguoiDungs = dt.FirstOrDefault();
                    TaiKhoan = NguoiDungs.fullname;
                    quyen_han = Convert.ToInt32(NguoiDungs.quyen_han);
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

    }  //
}