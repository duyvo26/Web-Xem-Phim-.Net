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

        public  List<DB_THELOAI> DanhSachTheLoai = new List<DB_THELOAI>();
        public  DB_USER NguoiDungs = new DB_USER();

        public  DB_PHIM PhimVuaDang =
            new DB_PHIM();  // luu thong tin Phim moi dang luu lai
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadThongTinNguoiDung();  // lay thong tin nguoi dung ra theo cookie
                NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                LoadTheLoai();
                UpLoadPhim();
            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        public void LoadThongTinNguoiDung()
        {
            NguoiDungs = Admin.Theme.NguoiDungs;

            // String MaKhoa = Request.Cookies["log"].Value;

            // var dt = (from q in dl.DB_USERs
            //          where q.ma_khoa == MaKhoa
            //          select q);

            // if (dt != null)
            //{
            //    NguoiDungs = dt.First();
            //}
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
                string tenPhim = Request
                                     .Form["tenPhim"]
                                     .ToString();
                string tacgia = Request
                                    .Form["tacgia"]
                                    .ToString();
                string quocgia = Request
                                     .Form["quocgia"]
                                     .ToString();
                string namsx = Request
                                   .Form["namsx"]
                                   .ToString();
                string theLoai = "";
                try
                {
                    theLoai = Request
                                  .Form["the-loai"]
                                  .ToString();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(
                        this, this.GetType(), "thieuthongtin",
                        "alert('Vui lòng nhập đầy đủ thông tin !'); history.back()",
                        true);
                }

                string tomtacPhim = Request
                                        .Form["input_tomtat"]
                                        .ToString();
                tomtacPhim = HttpUtility.HtmlEncode(tomtacPhim);  // ma hoa html
                string coin = Request
                                  .Form["coin"]
                                  .ToString();
                string link_raw =
                    HeThong.LinkRaw(tenPhim) + HeThong.LaySoNgauNhien().ToString();

                // check du lieu bi trong
                if (tenPhim == "" || theLoai == "" || tomtacPhim == "" ||
                    link_raw == "")
                {
                    ScriptManager.RegisterClientScriptBlock(
                        this, this.GetType(), "thieuthongtin",
                        "alert('Vui lòng nhập đầy đủ thông tin !'); history.back()",
                        true);
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

                // dl.ThemPhim(NguoiDungs.id_user, tenPhim, tacgia, quocgia, namsx,
                // tomtacPhim, Img_Url, coin, link_raw);

                // Data maping object to our database
                DB_PHIM phim = new DB_PHIM();
                phim.id_user = NguoiDungs.id_user;
                phim.ten_phim = tenPhim;
                phim.tac_gia = tacgia;
                phim.quoc_gia = quocgia;
                phim.nam_sx = namsx;
                phim.status_ = 1;
                phim.tomtat_phim = tomtacPhim;
                phim.img_phim = Img_Url;
                phim.coin_phim = coin;
                phim.link_raw = link_raw;
                phim.created_at = DateTime.Now;
                phim.updated_at = DateTime.Now;

                dl.DB_PHIMs.InsertOnSubmit(phim);
                dl.SubmitChanges();

                var IdPhim =
                    (from q in dl.DB_PHIMs
                     where q.id_user == NguoiDungs.id_user &&
                         q.link_raw == link_raw
                     select q.id_phim)
                        .First();
                // int IdPhim = PhimVuaDang.id_phim; // khai bao id Phim
                if (IdPhim == 0 || IdPhim.ToString() == "")
                {
                    ScriptManager.RegisterClientScriptBlock(
                        this, this.GetType(), "coloi",
                        "alert('Có lỗi xảy ra trong quá trình thêm thể loại vui lòng thử lại');  history.back()",
                        true);
                }
                // the loai Phim
                string[] arrtheLoai = theLoai.Split(',');
                foreach (string a in arrtheLoai)
                {
                    DB_PHIM_THELOAI phimTL = new DB_PHIM_THELOAI();
                    phimTL.id_phim = IdPhim;
                    phimTL.id_theloai = Convert.ToInt32(a);
                    phimTL.created_at = DateTime.Now;
                    phimTL.updated_at = DateTime.Now;
                    dl.DB_PHIM_THELOAIs.InsertOnSubmit(phimTL);
                    dl.SubmitChanges();

                    // dl.ThemPhimTheLoai(IdPhim, Convert.ToInt32(a));
                }

                string scriptText = "alert('Đăng phim " + tenPhim.ToString() +
                                    " thành công '); window.location='" +
                                    Request.ApplicationPath + "cp-admin/Phim/danhsach" +
                                    "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "thanhcong",
                                                    scriptText, true);
            }
        }

    }  //
}