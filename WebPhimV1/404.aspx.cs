using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1
{
    public partial class _404 : System.Web.UI.Page
    {

        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_CAUHINH HeThongs = new DB_CAUHINH();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadHeThong();
                ghi_loi();
            }
            catch
            {
                
            }
        }




        private void LoadHeThong()
        {

            var dt = (from q in dl.DB_CAUHINHs select q);

            if (dt != null)
            {
                HeThongs = dt.First();
            }

        }

        private void ghi_loi()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["err"]))
            {
                string path = Server.MapPath("log-404.html");
                StreamReader SR = new StreamReader(path);
                string err_old = SR.ReadLine();
                SR.Close();

                string err = Request.QueryString["err"].ToString();
                string vitri = Request.QueryString["vitri"].ToString();
                string tenloi = Request.QueryString["tenloi"].ToString();


                if (tenloi == "Object reference not set to an instance of an object.")
                {
                    NguoiDung.DelCookie();
                }

                StreamWriter SW = new StreamWriter(path);
                SW.Flush();
                string str = "<p>" + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + "| Vi tri: " + vitri + "| Ten loi: " + tenloi + "<br>" + err_old + "</p>";
                SW.WriteLineAsync(str);
                SW.Close();


            }


        }



    }//
}