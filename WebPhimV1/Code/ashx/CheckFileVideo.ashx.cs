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
    /// Summary description for CheckFileVideo
    /// </summary>
    public class CheckFileVideo : IHttpHandler
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static List<DB_TAP_PHIM> danhsachtap =
            new List<DB_TAP_PHIM>();  // DS Tap_Phim

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            String noidungtapphim = "";
            double sizeFile = 0;
            var dt = (from q in dl.DB_TAP_PHIMs select q);
            if (dt != null)
            {
                danhsachtap = dt.ToList();
            }
            List<string> ListVideo = new List<string>();
            List<string> namVideo_TonTai = new List<string>();
            List<string> nameVideo_KhongTonTai = new List<string>();

            for (int i = 0; i < danhsachtap.Count(); i++)
            {
                var server = danhsachtap[i].noidung_tap_phim.Split('|');
                foreach (String namePhim in server)
                {
                    ListVideo.Add(namePhim);
                    //  noidungtapphim += namePhim + "</br>";
                }
            }

            string path = HttpContext.Current.Server.MapPath(@"~/Public/video/mp4");

            string[] folders = System.IO.Directory.GetDirectories(
                path, "*", System.IO.SearchOption.AllDirectories);
            foreach (String file in folders)
            {
                // noidungtapphim += file;
                string[] NameTap = noidungtapphim.Split(',');
                path = file;
                if (Directory.Exists(path))
                {
                    DirectoryInfo di = new DirectoryInfo(path);
                    foreach (FileInfo fi in di.GetFiles())
                    {
                        Boolean CheckFile = false;
                        foreach (string nameFile in ListVideo)
                        {
                            string[] nameF = nameFile.Split('/');
                            string namef = "";

                            foreach (String p in nameF)
                            {
                                namef = p;
                            }

                            if (namef.Equals(fi.Name))
                            {
                                namVideo_TonTai.Add(fi.Name);

                                // noidungtapphim += "</br> File Name " + fi.Name;
                                CheckFile = true;
                            }
                        }

                        if (CheckFile == true)
                        {
                            continue;
                        }
                        else
                        {
                            sizeFile += Double.Parse(fi.Length.ToString()) * 0.000001;
                            CheckFile = false;
                            nameVideo_KhongTonTai.Add(fi.Name);
                        }
                    }

                    foreach (String XoaFile in nameVideo_KhongTonTai)
                    {
                        noidungtapphim += "</br> Xoá File: " + XoaFile;
                        DeleteFile(path + "//" + XoaFile);
                    }
                }
            }
            // DirectoryInfo d = new DirectoryInfo(path);
            // FileInfo[] Files = d.GetFiles();
            // foreach (FileInfo file in Files)
            // {
            //     noidungtapphim += file.Name;
            // }

            // Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(new
            {
                noidungTapPhim = noidungtapphim,
                sizefile = sizeFile,
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
        // xoa file
        protected void DeleteFile(string filePath) { File.Delete(filePath); }
    }
}