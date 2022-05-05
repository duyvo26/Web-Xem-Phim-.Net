using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.Part
{
    public partial class TopLuotXem_PhimDienAnh : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static List<LayLuotXemResult> LuotXem = new List<LayLuotXemResult>();

        public static List<DB_PHIM_THELOAI> CheckTL = new List<DB_PHIM_THELOAI>();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadLuotXem();
        }

        private void LoadLuotXem()
        {
            LuotXem = null;
            var dt = (from q in dl.LayLuotXem() select q).Take(10);
            if (dt != null)
            {
                LuotXem = dt.ToList();
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
        protected void RutGon_TieuDe(string a, int b)
        {
            Response.Write(Phim.RutGon(a, b));
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

        public string TenTheLoai(int IDPhim)
        {
            var dt = (from q in dl.DB_THELOAIs  select q);
            int id_HanhDong = 0;
            foreach (var i in dt)
            {
                if (HeThong.LocDauTiengViet(i.ten_theloai).ToLower() == HeThong.LocDauTiengViet("phim điện ảnh").ToLower())
                {
                    id_HanhDong = i.id_theloai;
                }
            }
            var dts = (from q in dl.DB_PHIM_THELOAIs where q.id_phim == IDPhim && q.id_theloai == id_HanhDong select q).Take(1).FirstOrDefault();
            if (dts != null)
            {
                return dts.id_phim.ToString();
            }
            else
            {
                return "null";
            }
        }

    }
}