using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code.ashx
{
    /// <summary>
    /// Summary description for LoadTheLoaiClick
    /// </summary>
    public class LoadTheLoaiClick : IHttpHandler
    {


        public static List<DB_THELOAI> TheLoai = new List<DB_THELOAI>();


        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            String str_theloai = "";

            using (DataWebPhimDataContext dl = new DataWebPhimDataContext())
            {
                var dt = (from q in dl.DB_THELOAIs select q);
                TheLoai = dt.ToList();
                foreach(var theloai in TheLoai){
                    str_theloai += "<p><a style='line-height: 40px;' href='" + WebPhimV1.Code.HeThong.url() + "/timkiemPhim?TheLoai=" + theloai.id_theloai + "&page=0&TheLoais=false'>"+theloai.ten_theloai+"</a></p>";
                }

            }




            //Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(
                new
                {
                    str_theloai = str_theloai,

                });

            context.Response.StatusCode = (int)HttpStatusCode.OK;
            context.Response.ContentType = "text/json";
            context.Response.Write(json);
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }



    }
}