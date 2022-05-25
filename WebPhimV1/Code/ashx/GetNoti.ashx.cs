using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code
{
    /// <summary>
    /// Summary description for GetNoti
    /// </summary>
    public class GetNoti : IHttpHandler
    {
        public static List<DB_THONGBAO> ThongBaos = new List<DB_THONGBAO>();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            String data_ = "";
            String data_id = "";
            String noti_txt = "";

            if (context.Request.QueryString["id_user"] != null)
            {
                data_ = context.Request.QueryString["id_user"];
                data_id = context.Request.QueryString["id_user"];
                data_ = NguoiDung.DemThongBao(int.Parse(data_)).ToString();
                using (DataWebPhimDataContext dl = new DataWebPhimDataContext())
                {
                    try
                    {
                        var dt = (from q in dl.DB_THONGBAOs
                                  where q.id_user ==
                                      int.Parse(data_id) &&
                                      q.truy_cap == null
                                  select q)
                                     .OrderByDescending(q => q.created_at)
                                     .First();
                        noti_txt = dt.noi_dung.ToString();
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }

            // Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(new
            {
                sum_noti = data_,
                noti = noti_txt,
            });

            context.Response.StatusCode = (int)HttpStatusCode.OK;
            context.Response.ContentType = "text/json";
            context.Response.Write(json);
            context.Response.End();
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}