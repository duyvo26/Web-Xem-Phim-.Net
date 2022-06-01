using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace WebPhimV1.Code.ashx
{
    /// <summary>
    /// Summary description for GiftCoin
    /// </summary>
    public class GiftCoin : IHttpHandler
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        private static DB_THONGBAO thongBao = new DB_THONGBAO();
        private static DB_USER NguoiDungs = new DB_USER();
        private string TrangThai;

        public void ProcessRequest(HttpContext context)
        {
         

            if (context.Request.Cookies["Log"] != null)
            {
                context.Response.ContentType = "text/plain";
                //load nguoi dung
                NguoiDungs = null;
                String MaKhoa = "";

                //
                Random r = new Random();
                int coin = r.Next(1, 10);
                if (coin > 0)
                {

                    MaKhoa = context.Request.Cookies["Log"].Value;
                    var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

                    if (dt != null)
                    {
                        NguoiDungs = dt.FirstOrDefault();
                        var CheckMax = (from q in dl.DB_LOG_COINs where q.id_user_nhan == NguoiDungs.id_user
                                      && q.ghichu == "_Nhan_Coin_Xem_Phim_" + NguoiDungs.fullname 
                                      select q);
                        int SumCheck = 0;
                        foreach (var pa in CheckMax)
                        {
                            if (pa.created_at.ToString("dd-MM-yyyy") == DateTime.Now.ToString("dd-MM-yyyy"))
                            {
                                SumCheck += 1;
                            }
                        }

                        if (SumCheck < 10)
                        {

                            string send_noidung = "SYS: Bạn may mắn nhận được " + coin + " Coin khi xem phim";
                            string urls = "/taikhoan/info";
                            // var dt = (from q in dl.DB_USERs where q.id_user == WebPhimV1.Theme.NguoiDung.NguoiDungs.id_user select q)
                            // .First();

                            NguoiDung.ThemThongBao(NguoiDungs.id_user, 0, send_noidung, urls);


                            DB_USER x = dt.First();
                            int naptien = Convert.ToInt32(coin);
                            x.coin = Convert.ToInt32(NguoiDungs.coin) + naptien;

                            // cap nhat vao log
                            DB_LOG_COIN log = new DB_LOG_COIN();
                            log.ghichu =
                                 "_Nhan_Coin_Xem_Phim_" + NguoiDungs.fullname;
                            log.id_user_chuyen = 0;
                            log.id_user_nhan = NguoiDungs.id_user;
                            log.coin = naptien.ToString();
                            log.created_at = DateTime.Now;
                            log.updated_at = DateTime.Now;
                            dl.DB_LOG_COINs.InsertOnSubmit(log);

                            dl.SubmitChanges();
                            TrangThai = "DaNap";
                        }
                        else
                        {
                            TrangThai = "MAX";
                        }
                      
                    }
                }
            }
                
            
            // Send File details in a JSON Response.
            string json = new JavaScriptSerializer().Serialize(new
            {
                dulieu = TrangThai,
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