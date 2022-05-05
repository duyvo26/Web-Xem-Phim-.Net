using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Tap_Phims
{
    public partial class UiThemTap_Phim : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_PHIM infoPhim = new DB_PHIM(); // thong tin Phim
        public static DB_USER NguoiDungs = new DB_USER();

        protected void Page_Load(object sender, EventArgs e)
        {
                    LoadThongTinNguoiDung(); // lay thong tin nguoi dung ra theo cookie
                    NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        LoadThongTinPhim(); // load thong tin Phim len
                        LoadThemTap_Phim();
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
            int id_phim = Convert.ToInt32(Page.RouteData.Values["IdPhim"]);
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id_phim select q);

            if (dt != null)
            {
                infoPhim = dt.First();
                //LoadTap_Phim(infoPhim.id_phim); // goi danh sach Tap_Phim theo id
            }
        } //

        public void LoadThemTap_Phim()
        {
            if (!string.IsNullOrEmpty(Request.Form["btn"]))
            {

                // lap lay danh sach the loai

                string tenTap_Phim = Request.Form["ten_tap_phim"].ToString();

                string Tap_Phim = Request.Form["input_tap_phim"].ToString().Replace("||", "|");
                Tap_Phim = HttpUtility.HtmlEncode(Tap_Phim); // ma hoa html

                //check du lieu bi trong
                if (tenTap_Phim.Length < 4|| Tap_Phim.Length < 4)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng kiểm tra lại nội dung nhập vào'); history.back()", true);
                    return;
                }
                else
                {
                    dl.ThemTapPhim(infoPhim.id_phim, NguoiDungs.id_user, tenTap_Phim, Tap_Phim);

                   
                    //thong bao cap nhat Tap_Phim
                    string noidung = NguoiDungs.fullname + " đã cập nhật " + infoPhim.ten_phim + " tập phim " + tenTap_Phim;
                    var Tap_Phimss = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim && q.ten_tap_phim == tenTap_Phim && q.noidung_tap_phim == Tap_Phim select q.id_tap_phim).First();
                    string urls = "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + Tap_Phimss;
                    var thuvien = (from q in dl.DB_THUVIENs where q.id_phim == infoPhim.id_phim select q);
                    foreach (var a in thuvien)
                    {
                         if(a.id_user != infoPhim.id_user){
                             NguoiDung.ThemThongBao(Convert.ToInt32(a.id_user), NguoiDungs.id_user, noidung, urls);
                         }
                        
                    }

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm tập " + tenTap_Phim + " Thành Công'); window.location = window.location.href ", true);
                }

            }
        } //
        public void LoadThongTinNguoiDung()
        {

            String MaKhoa = Request.Cookies["Log"].Value;

            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }

    } //
}