using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq.SqlClient;

using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung
{
    public partial class UiTimKiemPhim : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static List<DB_PHIM> timKiem = new List<DB_PHIM>();

        public string timKiemTheoTen = null;
        public string timKiemTheLoai = null;
        public string timKiemTheLoais = null;
        public string timKiemCoin = null;

        public  List<DB_THELOAI> TheLoai = new List<DB_THELOAI>();
        public  int page_number = 0;  // trang thu n
        public static  int SumPage = 0;
        public  int min = 0;
        public  int max = 0;
        public  string namePhim = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Xemthem();
                LoadSearch();
                LoadTheLoai();

            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        private void Xemthem()
        {
            timKiem = null;
            if (!string.IsNullOrEmpty(Request.QueryString["xemthem"]))
            {
                if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                {
                    page_number = Convert.ToInt32(Request.QueryString["page"]);
                }
                else
                {
                    page_number = 0;
                }
                    int take = 15;                  // lay n phan tu
                    int skip = page_number * take;  // bo qua trang thu n
                    SumPage = (from q in dl.DB_PHIMs select q).Count() / take;

                    var dt = (from q in dl.DB_PHIMs select q)
                                 .OrderByDescending(q => q.updated_at)
                                 .Skip(skip)
                                 .Take(take);

                    if (dt.Count() > 0)
                    {
                        timKiem = dt.ToList();
                    }
                }
            
        }
        private void LoadTheLoai()
        {
            TheLoai = null;
            var dt = (from q in dl.DB_THELOAIs select q).OrderBy(q => q.ten_theloai);
            if (dt.Count() > 0)
            {
                TheLoai = dt.ToList();
            }
        }

        private void LoadSearch()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["TenPhim"]))
            {
                if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                {
                    page_number = Convert.ToInt32(Request.QueryString["page"]);
                }
                else
                {
                    page_number = 0;
                }
                    string data = Request
                                      .QueryString["TenPhim"]
                                      .ToString();
                    namePhim = data;
                    int take = 15;                  // lay n phan tu
                    int skip = page_number * take;  // bo qua trang thu n
                    SumPage = (from q in dl.TimKiemTheoTen(data) select q).Count() / take;

                    var dt = (from q in dl.TimKiemTheoTen(data) select q)
                                 .OrderByDescending(q => q.updated_at)
                                 .Skip(skip)
                                 .Take(take);
                    if (dt != null)
                    {
                        timKiemTheoTen = "true";
                        timKiem =
                            dt.Select(x => new DB_PHIM()
                            {
                                id_phim = x.id_phim,
                                img_phim = x.img_phim,
                                ten_phim = x.ten_phim,
                                link_raw = x.link_raw
                            })
                                .ToList();
                    }
                
            }

            if (!string.IsNullOrEmpty(Request.QueryString["TheLoai"]))
            {
                if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                {
                    page_number = Convert.ToInt32(Request.QueryString["page"]);
                }
                else
                {
                    page_number = 0;
                }
                    // DeleData(); // xóa dât cua bang
                    string data = Request
                                      .QueryString["TheLoai"]
                                      .ToString();
                    string datas = Request
                                       .QueryString["TheLoais"]
                                       .ToString();
                    

                    int take = 15;                  // lay n phan tu
                    int skip = page_number * take;  // bo qua trang thu n

                    // Response.Write(data);
                    if (datas == "false")
                    {
                        SumPage =
                            (from q in dl.TimKiemTheoTheLoai(data.ToString()) select q)
                                .Count() /
                            take;
                        var dt = (from q in dl.TimKiemTheoTheLoai(data.ToString()) select q)
                                     .OrderByDescending(q => q.updated_at)
                                     .Skip(skip)
                                     .Take(take);

                        if (dt != null)
                        {
                            timKiemTheLoai = "true";
                            timKiem =
                                dt.Select(x => new DB_PHIM()
                                {
                                    id_phim = x.id_phim,
                                    img_phim = x.img_phim,
                                    ten_phim = x.ten_phim,
                                    link_raw = x.link_raw
                                })
                                    .ToList();
                        }
                    }
                    else
                    {
                        SumPage =
                            (from q in dl.TimKiemTheoTheLoais(data.ToString()) select q)
                                .Count() /
                            take;
                        var dt =
                            (from q in dl.TimKiemTheoTheLoais(data.ToString()) select q)
                                .OrderByDescending(q => q.updated_at)
                                .Skip(skip)
                                .Take(take);

                        if (dt != null)
                        {
                            timKiemTheLoais = "true";
                            timKiem =
                                dt.Select(x => new DB_PHIM()
                                {
                                    id_phim = x.id_phim,
                                    img_phim = x.img_phim,
                                    ten_phim = x.ten_phim,
                                    link_raw = x.link_raw
                                })
                                    .ToList();
                        }
                    }
                
            }

            if (!string.IsNullOrEmpty(Request.QueryString["coin"]))
            {
                if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                {
                    page_number = Convert.ToInt32(Request.QueryString["page"]);
                }
                else
                {
                    page_number = 0;
                }
                    max = Convert.ToInt32(Request.QueryString["max"]);
                    min = Convert.ToInt32(Request.QueryString["min"]);
                    

                    int take = 15;                  // lay n phan tu
                    int skip = page_number * take;  // bo qua trang thu n
                    SumPage = (from q in dl.DB_PHIMs
                               where Convert.ToInt64(q.coin_phim) >=
                                   min &&
                                   Convert.ToInt64(q.coin_phim) <= max
                               select q)
                                  .Count() /
                              take;

                    var dt = (from q in dl.DB_PHIMs
                              where Convert.ToInt64(q.coin_phim) >=
                                  min &&
                                  Convert.ToInt64(q.coin_phim) <= max
                              select q)
                                 .OrderByDescending(q => q.updated_at)
                                 .Skip(skip)
                                 .Take(take);
                    if (dt != null)
                    {
                        timKiemCoin = "true";
                        timKiem = dt.ToList();
                    }
                
            }

            // set title
            string scriptText =
                "document.title =  'Tìm kiếm - Page " + page_number + "'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage",
                                                scriptText, true);
        }

        public string GetNameTL(int idTL)
        {
            var dt = (from q in dl.DB_THELOAIs
                      where q.id_theloai ==
                          idTL
                      select q.ten_theloai)
                         .First();
            if (dt != null)
            {
                return dt.ToString();
            }
            else
            {
                return "";
            }
        }
        public string GetMotaTL(int idTL)
        {
            var dt = (from q in dl.DB_THELOAIs
                      where q.id_theloai ==
                          idTL
                      select q.mota_theloai)
                         .First();
            if (dt != null)
            {
                return dt.ToString();
            }
            else
            {
                return "";
            }
        }

    }  //
}