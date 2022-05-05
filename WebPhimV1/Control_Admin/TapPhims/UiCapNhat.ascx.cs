using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Tap_Phims
{
    public partial class UiCapNhat : System.Web.UI.UserControl
    {

        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static DB_TAP_PHIM Tap_Phims = new DB_TAP_PHIM();
        public static DB_PHIM infoPhim = new DB_PHIM(); // thong tin Phim


        protected void Page_Load(object sender, EventArgs e)
        {

            LoadThongTinNguoiDung(); // lay thong tin nguoi dung ra theo cookie
                    NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                       
                        LoadSuaTap_Phim(); // sua Tap_Phim 
                        LoadThongTinPhim(); // load thong tin Phim len
                    }
                    catch (Exception err)
                    {
                        string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                        Response.Redirect(url);
                    }

        }

        //load thong tin Phim
        public void LoadThongTinPhim()
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == Tap_Phims.id_phim select q);

            if (dt != null)
            {
                infoPhim = dt.First();
                //LoadTap_Phim(infoPhim.id_phim); // goi danh sach Tap_Phim theo id
            }
        } //


        public void ThongBao()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["noti"]))
            {
                string Thongbao = Request.QueryString["noti"].ToString();
                noti.Text = Thongbao;
            }
        }

        public void LoadThongTinNguoiDung()
        {

            String MaKhoa = Request.Cookies["Log"].Value;

            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }

        public void LoadSuaTap_Phim()
        {
            if (!string.IsNullOrEmpty(Page.RouteData.Values["IdTap_Phim"].ToString()))
            {

                int id_tap_phim = Convert.ToInt32(Page.RouteData.Values["IdTap_Phim"]);
                var dt = (from q in dl.DB_TAP_PHIMs where q.id_tap_phim == id_tap_phim select q);
                Tap_Phims = dt.First();

            }
            if (!string.IsNullOrEmpty(Request.Form["btn"]))
            {
                string ten_tap_phim = Request.Form["input_tenTap_Phim"].ToString();

                string ndTap_Phim = Request.Form["input_ndTap_Phim"].ToString();

                ndTap_Phim = HttpUtility.HtmlEncode(ndTap_Phim); // ma hoa html
                int id_tap_phim = Convert.ToInt32(Page.RouteData.Values["IdTap_Phim"]);

                //check du lieu bi trong
                if (ten_tap_phim.Length < 4 || ndTap_Phim == "" && ndTap_Phim.Length < 8)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng kiểm tra lại nội dung nhập vào'); history.back()", true);
                    return;
                }
                else
                {
                    try
                    {

                         var dt = from q in dl.DB_TAP_PHIMs where q.id_tap_phim ==  id_tap_phim select q;
                        DB_TAP_PHIM dbTap_Phim = dt.First();
                        dbTap_Phim.ten_tap_phim = ten_tap_phim;
                        dbTap_Phim.noidung_tap_phim = ndTap_Phim;
                        dbTap_Phim.updated_at = DateTime.Now;
                        dl.SubmitChanges();


                        string scriptText = "alert(' Chỉnh sửa " + ten_tap_phim + " Thành Công'); window.close();";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

                    }
                    catch
                    {
                        noti.Text = "Đã có lỗi xảy ra !!!!";
                    }

                }

            }
        }

    } //
}