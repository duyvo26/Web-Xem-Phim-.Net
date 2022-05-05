using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.Part
{
    public partial class GoiYDoc : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public static string a ;

        public static List<LayPhimRandResult> listGoiyDoc = new List<LayPhimRandResult>();

        protected void RutGon_TieuDe(string a, int b)
        {
            Response.Write(Phim.RutGon(a, b));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadlistGoiyDoc(); // goi goi goi y goi y doc len treang chu
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
    }
}