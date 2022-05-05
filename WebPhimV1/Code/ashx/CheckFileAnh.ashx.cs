using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code.ashx
{
    /// <summary>
    /// Summary description for CheckFileAnh
    /// </summary>
    public class CheckFileAnh : IHttpHandler
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static List<DB_PHIM> danhsachimg = new List<DB_PHIM>(); //DS Tap_Phim

        public void ProcessRequest(HttpContext context)
        {
            
            context.Response.ContentType = "text/plain";
            String noidungimg = "";
            double sizeFile = 0;
            var dt = (from q in dl.DB_PHIMs select q);
            if (dt != null)
            {
                danhsachimg = dt.ToList();
            }

            List<string> nameIMG_TonTai = new List<string>();
            List<string> ListImg = new List<string>();
            List<string> nameIMG_KhongTonTai = new List<string>();


            for (int i = 0; i < danhsachimg.Count(); i++)
            {
               ListImg.Add(danhsachimg[i].img_phim);
              // noidungimg += danhsachimg[i].img_phim.ToString() + "</br>";
            }


            string[] NameTap = noidungimg.Split(',');
            string path = HttpContext.Current.Server.MapPath("~/Public/img/phim/");
            if (Directory.Exists(path))
            {
                DirectoryInfo di = new DirectoryInfo(path);
                foreach (FileInfo fi in di.GetFiles())
                {

                    Boolean CheckFile = false;
                    foreach (string nameFile in ListImg)
                    {
                        if (nameFile.Equals(fi.Name))
                        {
                            nameIMG_TonTai.Add(fi.Name);
                          //  noidungimg += "</br>File Name: " + fi.Name + "| Size: " + (Double.Parse(fi.Length.ToString()) * 0.000001) + " MB";
                            CheckFile = true;
                        }
                    }

                    if (CheckFile == true)
                    {
                        CheckFile = false;
                        continue;
                    }
                    else
                    {
                        sizeFile += Double.Parse(fi.Length.ToString()) * 0.000001;
                        nameIMG_KhongTonTai.Add(fi.Name);
                    }
                    
                }

                foreach(String XoaFile in nameIMG_KhongTonTai){
                    
                    noidungimg += "</br> Xoá File: " + XoaFile ;
                    DeleteFile(path + XoaFile);
                }
            }

            //Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(
                new
                {
                    noidungIMG = noidungimg,
                    sizefile = sizeFile,
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

        //xoa file
        protected void DeleteFile(string filePath)
        {
            File.Delete(filePath);
        }

    }
}