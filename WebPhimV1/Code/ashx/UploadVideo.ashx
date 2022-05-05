﻿<%@ WebHandler Language="C#" Class="UploadVideo" %>

using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

using WebPhimV1.Code;

public class UploadVideo : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //Check if Request is to Upload the File.
        if (context.Request.Files.Count > 0)
        {
            HttpPostedFile postedFile = context.Request.Files[0];
            string fileName = HeThong.LocDauTiengViet(Path.GetFileNameWithoutExtension(postedFile.FileName));
            string extension = Path.GetExtension(postedFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yyyymmssfff") + extension;

            string date_thumuc = HttpContext.Current.Request.Cookies["NamePhim"].Value;

            string imgPath = Path.Combine(context.Server.MapPath("~/Public/video/mp4/" + date_thumuc + "/"), fileName);

            //Save the File in Folder.
            try
            {
                 postedFile.SaveAs(imgPath); 
            }
            catch
            {

                new FileInfo(context.Server.MapPath("~/Public/video/mp4/" + date_thumuc + "/")).Directory.Create();
                postedFile.SaveAs(imgPath);
            }
            

            //Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(
                new
                {
                    name = "/" + date_thumuc + "/" + fileName
                });
            context.Response.StatusCode = (int)HttpStatusCode.OK;
            context.Response.ContentType = "text/json";
            context.Response.Write(json);
            context.Response.End();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}