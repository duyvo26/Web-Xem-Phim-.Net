using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Phims
{
    public partial class UiCapNhat : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();
        public static DB_PHIM infoPhim = new DB_PHIM();
        public static List<DB_THELOAI> DanhSachTheLoai = new List<DB_THELOAI>();
        public static List<LayPhimTheLoaiResult> PhimTL = new List<LayPhimTheLoaiResult>();
        public static int id_phim = 0;
        public static string img_phim = "";
        protected void Page_Load(object sender, EventArgs e)
        {
               
                    LoadThongTinNguoiDung();
                    NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        LoadPhim();
                        LoadTheLoai();
                        LoadThongTinTheLoai();
                        id_phim = infoPhim.id_phim;
                        img_phim = infoPhim.img_phim;
                        CapNhatPhim();
                    }
                    catch (Exception err)
                    {
                        string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                        Response.Redirect(url);
                    }
                

                 
            

        }

        public void LoadThongTinTheLoai()
        {

            var TheLoai = dl.LayPhimTheLoai(infoPhim.id_phim);
            var dt = (from q in TheLoai where q.id_phim == infoPhim.id_phim select q);
            PhimTL = dt.ToList();
        } //
        public void LoadTheLoai()
        {
            var dt = (from q in dl.DB_THELOAIs select q).OrderBy(q => q.ten_theloai);
            if (dt != null && dt.Count() > 0)
            {
                DanhSachTheLoai = dt.ToList();
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

        public void LoadPhim()
        {
            int idPhim = Convert.ToInt32(Page.RouteData.Values["IdPhim"]);
            var dt = from q in dl.DB_PHIMs where q.id_phim == idPhim select q;
            try
            {
                infoPhim = dt.First();
                
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Có lỗi xảy ra !'); history.back()", true);
            }
        }

        public void CapNhatPhim()
        {
            if (!string.IsNullOrEmpty(Request.Form["btn-capnhat"]))
            {
                // lap lay danh sach the loai

                string tenPhim = Request.Form["tenPhim"].ToString();
                string tacgia = Request.Form["tacgia"].ToString();
                string quocgia = Request.Form["quocgia"].ToString();
                string namsx = Request.Form["namsx"].ToString();
                string tomtacPhim = Request.Form["input_tomtat"].ToString();
                tomtacPhim = HttpUtility.HtmlEncode(tomtacPhim); // ma hoa html
                string coin = Request.Form["coin"].ToString();
                int trangthai = Convert.ToInt32(Request.Form["trangthai"]);
                //check du lieu bi trong
                if (tenPhim == "" || tacgia == "" || tomtacPhim == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập đầy đủ thông tin!'); history.back()", true);
                    return;
                }

                    if (!string.IsNullOrEmpty(Request.Form["the-loai"]))
                    {
                        string theLoai = Request.Form["the-loai"];
                        dl.XoaPhimTL(infoPhim.id_phim);
                        // cap nhat the loai Phim
                        string[] arrtheLoai = theLoai.Split(',');
                        foreach (string a in arrtheLoai)
                        {
                            dl.ThemPhimTheLoai(infoPhim.id_phim, Convert.ToInt32(a));
                        }
                        //
                    }

                    // upload anh
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
                        Img_Url = img_phim;
                    }
                    try
                    {
                        // cap nhat Phim
                        var dt = from q in dl.DB_PHIMs where q.id_phim == id_phim select q;
                        DB_PHIM dbPhim = dt.First();
                        dbPhim.ten_phim = tenPhim;
                        dbPhim.tac_gia = tacgia;
                        dbPhim.quoc_gia = quocgia;
                        dbPhim.nam_sx = namsx;
                        dbPhim.tomtat_phim = tomtacPhim;
                        dbPhim.img_phim = Img_Url;
                        dbPhim.coin_phim = coin;
                        dbPhim.status_ = trangthai;

                        dl.SubmitChanges();

                        string scriptText = "alert('Cập nhật phim " + tenPhim.ToString() + " thành công '); window.location='/cp-admin/Phim/capnhat-" + id_phim + "'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "capnhatthanhcong", scriptText, true);
                    }
                    catch
                    {
                        string scriptText = "alert('Có lỗi xảy ra !'); window.location='/cp-admin/Phim/capnhat-" + id_phim + "'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "baoloi", scriptText, true);
                    }


                
            }

        }

    } //
}