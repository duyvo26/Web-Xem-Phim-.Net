using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung
{
    public partial class UiIndex : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public static List<DB_PHIM> PhimMoiCN = new List<DB_PHIM>();
        public static List<DB_PHIM> DanhSachPhim = new List<DB_PHIM>();
        // code comment
        public static List<LayThongTinBinhLuanResult> BinhLuan = new List<LayThongTinBinhLuanResult>();
        public static List<LayLuotXemResult> LuotXem = new List<LayLuotXemResult>();

        public static List<LayPhimRandResult> listGoiyDoc = new List<LayPhimRandResult>();

        public static DB_CAUHINH HeThongs = new DB_CAUHINH();

        protected void RutGon_TieuDe(string a, int b)
        {
            Response.Write(Phim.RutGon(a, b));
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                LoadHeThong();
                LoadlistGoiyDoc();
                LoadDanhSachPhim(); // goi danh sach truyuyen
                LoadDSBinhLuan(0); // load binh luan
                LoadLuotXem();

            }
            catch (Exception err)
            {
                string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                Response.Redirect(url);
            }
        }

        // load goi y doc
        private void LoadlistGoiyDoc()
        {
            listGoiyDoc = null;
            var dt = from q in dl.LayPhimRand() select q;
            if (dt != null)
            {
                listGoiyDoc = dt.ToList();
            }
        }
        //

        // load cau hinh
        public void LoadHeThong()
        {

            var dt = (from q in dl.DB_CAUHINHs select q);

            if (dt != null)
            {
                HeThongs = dt.First();
            }

        }

        // lay link raw cua Phim
        public string LinkRaw(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.link_raw.ToString();
            }
            else
            {
                return "";
            }

        }
        // lay ten cua Phim
        public string tenPhim(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_phim.ToString();
            }
            else
            {
                return "";
            }

        }

        // lay anh cua Phim
        public string ImgPhim(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.img_phim.ToString();
            }
            else
            {
                return "";
            }

        }

        // load Phim moi cap nhat
        private void LoadPhimMoiCN()
        {
            PhimMoiCN = null;
            var dt = (from q in dl.DB_PHIMs select q).Take(5).OrderByDescending(q => q.created_at);
            if (dt.Count() > 0)
            {
                PhimMoiCN = dt.ToList();
            }
        }
        //
        // load DanhSachPhim
        private void LoadDanhSachPhim()
        {
            DanhSachPhim = null;
            var dt = (from q in dl.DB_PHIMs select q).Take(12).OrderByDescending(q => q.updated_at);
            if (dt.Count() > 0)
            {
                DanhSachPhim = dt.ToList();
            }
        }

        //
        public void LoadDSBinhLuan(int id_phim)
        {
            BinhLuan = null;
            var dt = (from q in dl.LayThongTinBinhLuan(id_phim) select q);
            if (dt != null)
            {
                BinhLuan = dt.ToList();
            }

        } //
        private void LoadLuotXem()
        {
            LuotXem = null;
            var dt = (from q in dl.LayLuotXem() select q).Take(10);
            if (dt != null)
            {
                LuotXem = dt.ToList();
            }
        }

        //get name nguoi dung
        public int GetQuyenHan(int id)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id select q.quyen_han);
            if (dt != null)
            {
                return Convert.ToInt32(dt.First());
            }
            else
            {
                return 0;
            }
        }

    } //
}