using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code.ashx
{
    /// <summary>
    /// Summary description for GuiBaoCaoLoi
    /// </summary>
    public class GuiBaoCaoLoi : IHttpHandler
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_THONGBAO thongBao = new DB_THONGBAO();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            String mail_user = "";
            String send_noidung = "";
            string urls = "";
            string data_ = "";
            string id_Phim = "";
            string id_Tap = "";

            if (context.Request.QueryString["mail_user"] != null &&
                context.Request.QueryString["noidung_user"] != null)
            {
                mail_user =
                    context.Request.QueryString["mail_user"];  // id user bao cao loi
                send_noidung = "ERROR: " + context.Request.QueryString["noidung_user"];
                id_Phim = context.Request.QueryString["id_Phim"];
                id_Tap = context.Request.QueryString["id_Tap"];

                urls = "/cp-admin/tap-phim/capnhat-" + id_Tap;
                var dt = (from q in dl.DB_USERs
                          where Convert.ToInt32(q.quyen_han) !=
                              0
                          select q)
                             .ToList();
                foreach (var txt in dt)
                {
                    NguoiDung.ThemThongBao(txt.id_user, Convert.ToInt32(mail_user),
                                           send_noidung, urls);
                }
            }
            // Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(new
            {
                dulieu = data_,
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