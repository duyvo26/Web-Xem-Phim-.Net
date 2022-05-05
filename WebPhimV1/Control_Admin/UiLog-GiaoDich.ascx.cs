using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin
{
    public partial class UiLog_GiaoDich : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static List<DB_LOG_COIN> logCoin = new List<DB_LOG_COIN>();

        protected void Page_Load(object sender, EventArgs e)
        {

                    LoadThongTinNguoiDung();
                    NguoiDung.CheckAdmin(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        LoadGiaoDich();
                    }
                    catch (Exception err)
                    {
                        string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                        Response.Redirect(url);
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

        public void LoadGiaoDich()
        {
            logCoin = null;
            var dt = (from q in dl.DB_LOG_COINs select q);
            if (dt.Count() > 0 && dt != null)
            {
                logCoin = dt.ToList();
            }
        }
        //load thong tin nguoi dung
        public string LoadName(int id_user)
        {
            var dt = (from q in dl.DB_USERs
                      where q.id_user == id_user
                      select q).FirstOrDefault();

            if (dt != null)
            {
                return dt.ten_dangnhap.ToString();
            }
            else
            {
                return "";
            }
        }

    }//
}