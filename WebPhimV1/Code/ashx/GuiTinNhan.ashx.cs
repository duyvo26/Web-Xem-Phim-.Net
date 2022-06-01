using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code.ashx
{
    /// <summary>
    /// Summary description for GuiTinNhan
    /// </summary>
    public class GuiTinNhan : IHttpHandler
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_THONGBAO thongBao = new DB_THONGBAO();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            String mail_user = "";
            String send_noidung = "";
            string urls = "/taikhoan/info";
            string data_ = "";

            if (context.Request.QueryString["mail_user"] != null &&
                context.Request.QueryString["noidung_user"] != null)
            {
                mail_user = context.Request.QueryString["mail_user"];
                send_noidung = "SYS: " + context.Request.QueryString["noidung_user"];

                if (mail_user.Equals("@all"))
                {
                    var dt = (from q in dl.DB_USERs select q).ToList();
                    foreach (var txt in dt)
                    {
                        NguoiDung.ThemThongBao(txt.id_user, 0, send_noidung, urls);
                    }
                }
                else
                {
                    var dt = (from q in dl.DB_USERs where q.mail == mail_user select q)
                                 .First();
                    NguoiDung.ThemThongBao(dt.id_user, 0, send_noidung, urls);
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