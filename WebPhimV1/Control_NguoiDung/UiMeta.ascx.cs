using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPhimV1.Control_NguoiDung
{
    public partial class UiMeta : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_CAUHINH listCauHinh = new DB_CAUHINH();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCauHinh();
        }

        private void LoadCauHinh()
        {
            listCauHinh = null;

            var dt = from q in dl.DB_CAUHINHs
                     select q;
            if (dt.Count() > 0)
            {
                listCauHinh = dt.First();
            }
        }
    }
}