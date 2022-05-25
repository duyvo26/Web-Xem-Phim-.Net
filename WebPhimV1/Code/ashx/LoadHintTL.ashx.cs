using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code.ashx
{
    /// <summary>
    /// Summary description for LoadHintTL
    /// </summary>
    public class LoadHintTL : IHttpHandler
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        private List<DB_THELOAI> TheLoai = new List<DB_THELOAI>();

        private List<LayLuotXemResult> LuotXem = new List<LayLuotXemResult>();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            String html = "";

            if (HttpContext.Current.Request.Cookies["HintTheLoai"] != null)
            {
                string theloai =
                    HttpContext.Current.Request.Cookies["HintTheLoai"].Value;

                List<string> arrlist = theloai.Split(',').ToList();

                List<string> arrlist_new = new List<string>();

                Random rnd = new Random();

                for (int a = 0; a < arrlist.Count(); a++)
                {
                    int i = rnd.Next(0, arrlist.Count);
                    if (arrlist[i] == "")
                    {
                        continue;
                    }
                    arrlist.RemoveAt(i);
                    arrlist_new.Add(arrlist[i]);
                }

                foreach (string a in arrlist_new.Take(2))
                {
                    if (a == "")
                    {
                        continue;
                    }

                    html +=
                        "<div class=\"container-fluid\">" +
                        "          <div class=\"iq-main-header d-flex align-items-center justify-content-between\">" +
                        "               <h4 class=\"main-title\">Top thể loại " +
                        TenRawTheLoai(a) + "</h4>" + "           </div>" +
                        "        <div class=\"owl-carousel owl-theme\">";

                    LoadLuotXem();
                    if (LuotXem != null)
                    {
                        int xephang = 0;
                        for (int p = 0; p < LuotXem.Count; p++)
                        {
                            if (TenTheLoai(Convert.ToInt32(LuotXem[p].id_phim), a) ==
                                "null")
                            {
                                continue;
                            }
                            else
                            {
                                xephang += 1;
                            }

                            html +=
                                "<!-- item -->" +
                                "                     <div class=\"epi-box\">" +
                                "                        <div class=\"epi-img position-relative\">" +
                                "                           <img onError=\"this.onerror=null;this.src='" +
                                HeThong.url() +
                                "/public/img/www/err-img.png';\" style=\"height: 201px;max-height: 200px;width: 100%;\"  src=\"" +
                                HeThong.url() + "/public/img/Phim/" +
                                ImgPhim(Convert.ToInt32(LuotXem[p].id_phim)) +
                                "\" class=\"img-fluid img-zoom\" alt=\"\">" +
                                "                           <div class=\"episode-number\">Top " +
                                xephang + "</div>" +
                                "                           <div class=\"episode-play-info\">" +
                                "                              <div class=\"episode-play\">" +
                                "                     <a href=\" " + HeThong.url() +
                                "/Phim/" + LinkRaw(Convert.ToInt32(LuotXem[p].id_phim)) +
                                "-" + LuotXem[p].id_phim + "\">" +
                                "                                 <i class=\"ri-play-fill\"></i>" +
                                "                                 </a>" +
                                "                              </div>" +
                                "                           </div>" +
                                "                        </div>" +
                                "                        <div class=\"epi-desc p-3\">" +
                                "                     <a href=\" " + HeThong.url() +
                                "/Phim/" + LinkRaw(Convert.ToInt32(LuotXem[p].id_phim)) +
                                "-" + LuotXem[p].id_phim + "\">" +
                                "                              <h6 class=\"epi-name text-white mb-0\">" +
                                tenPhim(Convert.ToInt32(LuotXem[p].id_phim)) + "" +
                                "                              </h6>" +
                                "                           </a>" +
                                "                        </div>" +
                                "                     </div>" + "                  " +
                                "                  <!-- item end -->";
                        }
                    }

                    html += "</div>" + "</div>";
                }
            }

            string json = new JavaScriptSerializer().Serialize(new
            {
                str_html = html,

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

        private void LoadLuotXem()
        {
            LuotXem = null;
            var dt = (from q in dl.LayLuotXem() select q).Take(10);
            if (dt != null)
            {
                LuotXem = dt.ToList();
            }
        }

        // lay ten cua Phim
        public string tenPhim(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q)
                         .FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_phim.ToString();
            }
            else
            {
                return "";
            }
        }

        // lay link raw cua Phim
        public string LinkRaw(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q)
                         .FirstOrDefault();
            if (dt != null)
            {
                return dt.link_raw.ToString();
            }
            else
            {
                return "";
            }
        }
        protected void RutGon_TieuDe(string a, int b)
        {
            HttpContext.Current.Response.Write(Phim.RutGon(a, b));
        }

        // lay anh cua Phim
        public string ImgPhim(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q)
                         .FirstOrDefault();
            if (dt != null)
            {
                return dt.img_phim.ToString();
            }
            else
            {
                return "";
            }
        }

        public string TenRawTheLoai(string tenTL)
        {
            var dt = (from q in dl.DB_THELOAIs select q);
            string tenTl = "";
            foreach (var i in dt)
            {
                if (HeThong.LocDauTiengViet(i.ten_theloai).ToLower() ==
                    HeThong.LocDauTiengViet(tenTL.ToLower()).ToLower())
                {
                    tenTl = i.ten_theloai;
                }
            }
            return tenTl;
        }

        public string TenTheLoai(int IDPhim, string tenTL)
        {
            var dt = (from q in dl.DB_THELOAIs select q);
            int id_HanhDong = 0;
            foreach (var i in dt)
            {
                if (HeThong.LocDauTiengViet(i.ten_theloai).ToLower() ==
                    HeThong.LocDauTiengViet(tenTL.ToLower()).ToLower())
                {
                    id_HanhDong = i.id_theloai;
                }
            }
            var dts = (from q in dl.DB_PHIM_THELOAIs
                       where q.id_phim == IDPhim &&
                           q.id_theloai == id_HanhDong
                       select q)
                          .Take(1)
                          .FirstOrDefault();
            if (dts != null)
            {
                return dts.id_phim.ToString();
            }
            else
            {
                return "null";
            }
        }

    }  //
}