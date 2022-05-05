using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Phims
{
    public partial class UiDanhGia : System.Web.UI.UserControl
    {


        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static List<DB_VOTE> DsDanhGia = new List<DB_VOTE>();
        protected void Page_Load(object sender, EventArgs e)
        {
   
         

                    LoadThongTinNguoiDung();
                    NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        LoadDanhgia();
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
            String MaKhoa = Request.Cookies["log"].Value;

            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }

        //load thong tin nguoi dung
        public void LoadDanhgia()
        {
            var dt = (from q in dl.DB_VOTEs select q).OrderByDescending(q => q.updated_at);

            if (dt != null)
            {
                DsDanhGia = dt.ToList();
            }
        }

        //load thong tin nguoi dung
        public string LoadName(int id_user)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id_user select q);

            if (dt.Count() > 0)
            {
                var ten = dt.First();
                return ten.ten_dangnhap.ToString();
            }
            else
            {
                return "";
            }
        }

        //load ten Phim
        public string LoadNamePhim(int id_phim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id_phim select q);

            if (dt.Count() > 0)
            {
                var ten = dt.First();
                return ten.ten_phim.ToString();
            }
            else
            {
                return "";
            }
        }




    }//
}