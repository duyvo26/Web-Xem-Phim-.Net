using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Phims
{
    public partial class UiThemPhim : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public static List<DB_THELOAI> DanhSachTheLoai = new List<DB_THELOAI>();
        public static DB_USER NguoiDungs = new DB_USER();

        public static DB_PHIM PhimVuaDang = new DB_PHIM(); // luu thong tin Phim moi dang luu lai
        protected void Page_Load(object sender, EventArgs e)
        {


                    LoadThongTinNguoiDung(); // lay thong tin nguoi dung ra theo cookie
                    NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        LoadTheLoai();
                        UpLoadPhim();
                    }
                    catch (Exception err)
                    {
                        string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                        Response.Redirect(url);
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

        public void LoadTheLoai()
        {
            var dt = (from q in dl.DB_THELOAIs select q).OrderBy(q => q.ten_theloai);
            if (dt != null && dt.Count() > 0)
            {
                DanhSachTheLoai = dt.ToList();
            }
        }
        public void UpLoadPhim()
        {
            if (!string.IsNullOrEmpty(Request.Form["btn-them"]))
            {
                // lap lay danh sach the loai
                string tenPhim = Request.Form["tenPhim"].ToString();
                string tacgia = Request.Form["tacgia"].ToString();
                string quocgia = Request.Form["quocgia"].ToString();
                string namsx = Request.Form["namsx"].ToString();
                string theLoai = "";
                try
                {
                    theLoai = Request.Form["the-loai"].ToString();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "thieuthongtin", "alert('Vui lòng nhập đầy đủ thông tin !'); history.back()", true);
                }

                string tomtacPhim = Request.Form["input_tomtat"].ToString();
                tomtacPhim = HttpUtility.HtmlEncode(tomtacPhim); // ma hoa html
                string coin = Request.Form["coin"].ToString();
                string link_raw = HeThong.LinkRaw(tenPhim) + HeThong.LaySoNgauNhien().ToString();

                //check du lieu bi trong
                if (tenPhim == "" || theLoai == "" || tomtacPhim == "" || link_raw == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "thieuthongtin", "alert('Vui lòng nhập đầy đủ thông tin !'); history.back()", true);
                    return;
                }

                    if (tacgia == "")
                    {
                        tacgia = "Cập Nhật.";
                    }
                    // check coin 
                    if (coin == "" || Convert.ToInt32(coin) < 0)
                    {
                        coin = "0";
                    }

                    string Img_Url = null;
                    if (FileUpload1.HasFile)
                    {
                        Img_Url = HeThong.LaySoNgauNhien().ToString() + FileUpload1.FileName;
                        Img_Url = HeThong.LocDauTiengViet(Img_Url);
                        string filePath = MapPath("/public/img/Phim/" + Img_Url);
                        FileUpload1.SaveAs(filePath);
                    }
                    else
                    {
                        Img_Url = "/public/img/www/err-img.png";
                    }

                    dl.ThemPhim(NguoiDungs.id_user, tenPhim, tacgia, quocgia, namsx, tomtacPhim, Img_Url, coin, link_raw);

                    var IdPhim = (from q in dl.DB_PHIMs where q.id_user == NguoiDungs.id_user && q.link_raw == link_raw select q.id_phim).First();
                    //int IdPhim = PhimVuaDang.id_phim; // khai bao id Phim
                    if (IdPhim == 0 || IdPhim.ToString() == "")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "coloi", "alert('Có lỗi xảy ra trong quá trình thêm thể loại vui lòng thử lại');  history.back()", true);
                    }
                    // the loai Phim
                    string[] arrtheLoai = theLoai.Split(',');
                    foreach (string a in arrtheLoai)
                    {
                        dl.ThemPhimTheLoai(IdPhim, Convert.ToInt32(a));
                    }

                    string scriptText = "alert('Đăng phim " + tenPhim.ToString() + " thành công '); window.location='" + Request.ApplicationPath + "cp-admin/Phim/danhsach" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "thanhcong", scriptText, true);


                

            }
        }

    } //
}