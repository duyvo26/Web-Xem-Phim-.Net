using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.NguoiDungs
{
    public partial class UiNapCoin : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static DB_USER Thongtinnapcoin = new DB_USER();
        public static List<DB_USER> DanhSachND = new List<DB_USER>();
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                    LoadThongTinNguoiDung();
                    NguoiDung.CheckAdmin(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        LoadNguoiDung();
                        LaythongtinUser();
                    }
                    catch (Exception err)
                    {
                        string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                        Response.Redirect(url);
                    }
                }
            

        }

        public void LoadNguoiDung()
        {
            var dt = (from q in dl.DB_USERs select q);
            if (dt.Count() > 0)
            {
                DanhSachND = dt.ToList();
            }
        }
        public void LoadThongTinNguoiDung()
        {
            String MaKhoa = Request.Cookies["log"].Value;

            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }
        public void LaythongtinUser()
        {
            int id_user = Convert.ToInt32(Page.RouteData.Values["id_user"]);

            var dt = (from q in dl.DB_USERs where q.id_user == id_user select q);

            if (dt != null)
            {
                Thongtinnapcoin = dt.First();
                lblIdUser.Text = Thongtinnapcoin.ten_dangnhap;
                LblCoinHT.Text = Thongtinnapcoin.coin.ToString();
            }
        }

        protected void Themcoin_Click(object sender, EventArgs e)
        {
            var dt = from q in dl.DB_USERs where q.id_user == Thongtinnapcoin.id_user select q;
            if (dt != null)
            {
                DB_USER x = dt.First();
                int naptien = Convert.ToInt32(coin.Text);
                x.coin = Convert.ToInt32(LblCoinHT.Text) + naptien;
 
                //cap nhat vao log
                DB_LOG_COIN log = new DB_LOG_COIN();
                log.ghichu = NguoiDungs.fullname + "_Nap_Coin_" + Thongtinnapcoin.fullname;
                log.id_user_chuyen = NguoiDungs.id_user;
                log.id_user_nhan = Thongtinnapcoin.id_user;
                log.coin = naptien.ToString();
                log.created_at = DateTime.Now;
                log.updated_at = DateTime.Now;
                dl.DB_LOG_COINs.InsertOnSubmit(log);
                dl.SubmitChanges();

                //thong bao cap nhat Tap_Phim
                string noidung =  " Bạn nhận được " + naptien.ToString() +" coin từ "+ NguoiDungs.fullname;
                string urls = "taikhoan/info#giaodich";
                NguoiDung.ThemThongBao(Thongtinnapcoin.id_user, NguoiDungs.id_user, noidung, urls);

                string scriptText = "alert('Giao dịch thành công !'); window.location='" + Request.ApplicationPath + "cp-admin/nguoidung/Napcoin-" + Thongtinnapcoin.id_user + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "xoaPhim", scriptText, true);
                //Response.Redirect("~/cp-admin/nguoidung/Napcoin-" + Thongtinnapcoin.id_user);
            }
        }

        protected void Giamcoin_Click(object sender, EventArgs e)
        {
            var dt = from q in dl.DB_USERs where q.id_user == Thongtinnapcoin.id_user select q;
            if (dt != null)
            {
                DB_USER x = dt.First();
                int naptien = Convert.ToInt32(coin.Text);
                x.coin = Convert.ToInt32(LblCoinHT.Text) - naptien;
                //cap nhat vao log
                DB_LOG_COIN log = new DB_LOG_COIN();
                log.ghichu = NguoiDungs.fullname + "_Giam_Coin_" + Thongtinnapcoin.fullname;
                log.id_user_chuyen = NguoiDungs.id_user;
                log.id_user_nhan = Thongtinnapcoin.id_user;
                log.coin = naptien.ToString();
                log.created_at = DateTime.Now;
                log.updated_at = DateTime.Now;
                dl.DB_LOG_COINs.InsertOnSubmit(log);
                dl.SubmitChanges();
                //thong bao cap nhat Tap_Phim
                string noidung = NguoiDungs.fullname + " Giảm " + naptien.ToString() +" coin của bạn";
                string urls = "taikhoan/info#giaodich";
                NguoiDung.ThemThongBao(Thongtinnapcoin.id_user, NguoiDungs.id_user, noidung, urls);

                string scriptText = "alert('Giao dịch thành công !'); window.location='" + Request.ApplicationPath + "cp-admin/nguoidung/Napcoin-" + Thongtinnapcoin.id_user + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "xoaPhim", scriptText, true);

                // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Hiến máu thành công')", true);
                //Response.Redirect("~/cp-admin/nguoidung/Napcoin-" + Thongtinnapcoin.id_user);
            }
        }
    }
}