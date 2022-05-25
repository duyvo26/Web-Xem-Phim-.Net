using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_NguoiDung.TrangPhim
{
    public partial class UiTapPhim : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public  DB_TAP_PHIM infoTap_Phim = new DB_TAP_PHIM(); // thong tin Tap_Phim
        public  DB_PHIM infoPhim = new DB_PHIM(); // thong tin Phim
        public  DB_USER NguoiDungs = new DB_USER();
        public  List<DB_COMMENT> BinhLuan = new List<DB_COMMENT>();
        public  DB_THUVIEN CheckThuVien = new DB_THUVIEN();
        public  List<DB_COMMENT> LoadPhanHoi = new List<DB_COMMENT>();
        public  DB_CAUHINH cauhinh = new DB_CAUHINH();
        public  DB_TAP_PHIM Next = new DB_TAP_PHIM();
        public  DB_TAP_PHIM Back = new DB_TAP_PHIM();
        public  DB_TAP_PHIM Tap_PhimDau = new DB_TAP_PHIM(); // danh sach Tap_Phim cua Phim
        public  List<DB_TAP_PHIM> DsTap_Phim = new List<DB_TAP_PHIM>();
        public  int page_number = 0; // trang thu n
        public static  int SumPage = 0;
        public  string checkthuvien = null;




        protected void Page_Load(object sender, EventArgs e)
        {

         try{

                LoadCauHinh();
                if (NguoiDung.CheckLogin() != true) // kiem tra dang nhap cua nguoi dung
                {
                     LoadNotLogin();
                }
                else
                {
                    LoadLogin();
                }
             }catch (Exception err)
             {
                   string url = "~/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                   Response.Redirect(url);
              }

         
        }


        private void LoadNotLogin(){
            LoadThongTinPhim(); // load thong tin Phim len
            if (infoPhim.status_ == 0)
            {
                string scriptText = "alert('Bộ phim này tạm khoá vui lòng liên hệ admin để biết thêm chi tiết !'); window.location='" + Request.ApplicationPath + "'";
                ScriptManager.RegisterStartupScript(this, typeof(string), "Phimkhoa", scriptText, true);
            }
            LoadThongTinTap_Phim(); // laod thong tin Tap_Phim len
            ThemLuotXem(); // them luot xem
            LoadDanhSachTap_Phim();
            LayTap_PhimDau();
            LoadDSBinhLuan();
            NextPage(); // Tap_Phim tiep theo
            BackPage();
            //
        }

        private void LoadLogin() {
            LoadThongTinNguoiDung();
            LoadThongTinPhim(); // load thong tin Phim len
            if (infoPhim.status_ == 0)
            {
                string scriptText = "alert('Bộ phim này tạm khoá vui lòng liên hệ admin để biết thêm chi tiết !'); window.location='" + Request.ApplicationPath + "'";
                ScriptManager.RegisterStartupScript(this, typeof(string), "Phimkhoa", scriptText, true);
            }
            LoadThongTinTap_Phim(); // laod thong tin Tap_Phim len
            CheckDoc();
            AddPhimCoinFree();
            ThemLuotXem(); // them luot xem
            LuuLichSu();

            LayTap_PhimDau();
            LoadDanhSachTap_Phim();
            LoadDSBinhLuan();

            XoaBinhLuan();
            NextPage(); // Tap_Phim tiep theo
            BackPage();
            themBL(); // them binh luan
            NhapPhanHoi(); // them phan hoi
        }


        private void LoadCauHinh()
        {
            cauhinh = Theme.NguoiDung.listCauHinh;

            ///var dt = (from q in dl.DB_CAUHINHs select q);
            ///if (dt.Count() > 0)
            //{
            //    cauhinh = dt.First();
            //}

        }

        private void LayTap_PhimDau()
        {
            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q).OrderBy(q => q.created_at);
            if (dt != null)
            {
                Tap_PhimDau = dt.First();
            }

        }
        //load thong tin người dùng
        private void LoadThongTinNguoiDung()
        {
            NguoiDungs = Theme.NguoiDung.NguoiDungs;

           // String MaKhoa = "";
           // MaKhoa = Request.Cookies["Log"].Value;
           // NguoiDungs = null;
           // var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

          //  if (dt != null)
            //{
            //    NguoiDungs = dt.FirstOrDefault();
           // }
           // else
           // {
            //    NguoiDungs = null;
            //}
        }

        //ttu dong them phim vao thu vien neu phim  = 0

        private void AddPhimCoinFree()
        {
            if (checkthuvien == null && int.Parse(infoPhim.coin_phim) == 0 && NguoiDung.CheckLogin() == true)
            {
                // them Phim vao thu vien
                dl.ThemThuVien(NguoiDungs.id_user, infoPhim.id_phim, Tap_PhimDau.id_tap_phim); // them vao thu vien
                if (NguoiDungs.id_user != infoPhim.id_user && int.Parse(infoPhim.coin_phim) == 0)
                {
                    //thong bao cap nhat Tap_Phim
                    //id_user - id nhận
                    //id_phanhoi - id gui thong bao
                    string noidung = NguoiDungs.fullname + " đã thêm phim " + infoPhim.ten_phim + " của bạn vào thư viện";
                    string urls = "/taikhoan/info";
                    NguoiDung.ThemThongBao(Convert.ToInt32(infoPhim.id_user), NguoiDungs.id_user, noidung, urls);

                }
            }


        }

        //
        //load thong tin Phim
        private void LoadThongTinPhim()
        {
            string link_raw = Page.RouteData.Values["LinkRawPhim"].ToString();
            int id_phim = Convert.ToInt32(Page.RouteData.Values["IdPhim"]);

            infoPhim = null;
            var dt = (from q in dl.DB_PHIMs where q.link_raw == link_raw && q.id_phim == id_phim select q);

            if (dt != null)
            {
                infoPhim = dt.First();

            }
        } //

        private void LoadThongTinTap_Phim()
        {
            infoTap_Phim = null;
            int id_tap_phim = Convert.ToInt32(Page.RouteData.Values["IdTap_Phim"]);

            var dt = (from q in dl.DB_TAP_PHIMs where q.id_tap_phim == id_tap_phim select q);

            if (dt != null)
            {
                try { infoTap_Phim = dt.First(); }
                catch { }
            }
        } //

        public string getLuotXemTap(int IdTap)
        {
            var dt = (from q in dl.DB_LUOTXEMs where q.id_tap_phim == IdTap select q).Count();
            return dt.ToString();
        }

        private void ThemLuotXem()
        {
            if (WebPhimV1.Code.NguoiDung.CheckLogin() == true)
            {

                if (checkthuvien != null)
                {
                    var layluotxem = (from q in dl.DB_LUOTXEMs where q.id_tap_phim == infoTap_Phim.id_tap_phim && q.id_user == NguoiDungs.id_user select q).FirstOrDefault();
                    if (layluotxem == null)
                    {
                        DB_LUOTXEM themlx = new DB_LUOTXEM();
                        themlx.id_user = NguoiDungs.id_user;
                        themlx.id_phim = infoTap_Phim.id_phim;
                        themlx.id_tap_phim = infoTap_Phim.id_tap_phim;
                        themlx.created_at = DateTime.Now;
                        themlx.updated_at = DateTime.Now;
                        dl.DB_LUOTXEMs.InsertOnSubmit(themlx);
                        dl.SubmitChanges();
                    }
                }
            }
            else
            {
                string LuuIDTapPhim = "";
                if (HttpContext.Current.Request.Cookies["LuuIDTapPhim"] == null)
                {
                    //Luu the loai vao trinh duyet
                    HttpCookie TK = new HttpCookie("LuuIDTapPhim");
                    TK.Value = Convert.ToString(infoTap_Phim.id_tap_phim);
                    TK.Expires = DateTime.Now.AddDays(30);
                    HttpContext.Current.Response.Cookies.Add(TK);
                }
                else
                {
                    LuuIDTapPhim = HttpContext.Current.Request.Cookies["LuuIDTapPhim"].Value;
                }
                if (LuuIDTapPhim != Convert.ToString(infoTap_Phim.id_tap_phim))
                {
                    //Luu the loai vao trinh duyet
                    HttpCookie TK = new HttpCookie("LuuIDTapPhim");
                    TK.Value = Convert.ToString(infoTap_Phim.id_tap_phim);
                    TK.Expires = DateTime.Now.AddDays(30);
                    HttpContext.Current.Response.Cookies.Add(TK);

                    DB_LUOTXEM themlx = new DB_LUOTXEM();
                    themlx.id_phim = infoTap_Phim.id_phim;
                    themlx.id_tap_phim = infoTap_Phim.id_tap_phim;
                    themlx.created_at = DateTime.Now;
                    themlx.updated_at = DateTime.Now;
                    dl.DB_LUOTXEMs.InsertOnSubmit(themlx);
                    dl.SubmitChanges();
                }
            }

        }

        //
        private void LoadDSBinhLuan()
        {
            BinhLuan = null;

            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page_number = Convert.ToInt32(Request.QueryString["page"]);
            }
            else
            {
                page_number = 0;
            }

            int take = 10; // lay n phan tu
            int skip = page_number * take; // bo qua trang thu n
            SumPage = (from q in dl.DB_COMMENTs where q.id_tap_phim == infoTap_Phim.id_tap_phim && q.id_phanhoi == null select q).Count() / take;

            var dt = (from q in dl.DB_COMMENTs where q.id_tap_phim == infoTap_Phim.id_tap_phim && q.id_phanhoi == null select q).OrderByDescending(q => q.created_at).Skip(skip).Take(take);

            if (dt.Count() > 0)
            {
                BinhLuan = dt.ToList();
            }

        } //

        private void CheckDoc()
        {
            checkthuvien = null;
            try
            {
                var dt = (from q in dl.DB_THUVIENs where q.id_phim == infoPhim.id_phim && q.id_user == NguoiDungs.id_user select q).First();
                if (dt != null)
                {
                    checkthuvien = dt.id_user.ToString();
                }
                else
                {
                    checkthuvien = null;
                }
            }
            catch
            {
                checkthuvien = null;
            }
        }

        private void LuuLichSu()
        {
            dl.CapNhatThuVien(NguoiDungs.id_user, infoPhim.id_phim, infoTap_Phim.id_tap_phim);
        }

        private void themBL()
        {

            if (!string.IsNullOrEmpty(Request.Form["binhluan"]))
            {
                string txtBinhLuan = Request.Form["message"].ToString();

                if (txtBinhLuan == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string), "blthieuchu", "alert('Bình luận không được để trống');", true);
                }
                else
                {
                    string noidung_cmt = txtBinhLuan;
                    //dl.Them_cmt(NguoiDungs.id_user, infoPhim.id_phim, infoTap_Phim.id_tap_phim, noidung_cmt);
                    DB_COMMENT dbcom = new DB_COMMENT();
                    dbcom.id_user = NguoiDungs.id_user;
                    dbcom.id_phim = infoPhim.id_phim;
                    dbcom.id_tap_phim = infoTap_Phim.id_tap_phim;
                    dbcom.noidung_cmt = HeThong.XoaKhoanTrangThua(noidung_cmt);
                    dbcom.created_at = DateTime.Now;
                    dbcom.updated_at = DateTime.Now;
                    dl.DB_COMMENTs.InsertOnSubmit(dbcom);
                    dl.SubmitChanges();

                    if (NguoiDungs.id_user != infoPhim.id_user)
                    {
                        //thong bao cap nhat Tap_Phim
                        //id_user - id nhận
                        //id_phanhoi - id gui thong bao
                        string noidung = NguoiDungs.fullname + " vừa bình luận ở tập phim " + infoTap_Phim.ten_tap_phim + " của truyên " + infoPhim.ten_phim;
                        string urls = "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + infoTap_Phim.id_tap_phim + "?page=" + page_number + "#binhluan_trang";
                        NguoiDung.ThemThongBao(infoPhim.id_user, NguoiDungs.id_user, noidung, urls);
                    }
                    Random r = new Random();
                    string scriptText = "alert('Bình luận thành công'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + infoTap_Phim.id_tap_phim + "?page=" + page_number + "&p=" + r.Next(1, 100) + "#binhluan_trang';";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "binhluan", scriptText, true);

                }
            }

        }

        private void XoaBinhLuan()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["XoaBinhLuan"]))
            {
                int ID = Convert.ToInt32(Request.QueryString["XoaBinhLuan"]);
                var dt = (from q in dl.DB_COMMENTs where q.id_cmt == ID && q.id_user == NguoiDungs.id_user select q).FirstOrDefault();

                if (dt != null)
                {
                    dl.DB_COMMENTs.DeleteOnSubmit(dt);
                    var dts = (from q in dl.DB_COMMENTs where q.id_phanhoi == ID select q);
                    dl.DB_COMMENTs.DeleteAllOnSubmit(dts);
                    dl.SubmitChanges();
                    Random r = new Random();
                    //r.Next(1, 100)
                    string scriptText = "alert('Xóa bình luận thành công'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + infoTap_Phim.id_tap_phim + "?page=" + page_number + "&p=" + r.Next(1, 100) + "#binhluan_trang';";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "binhluan", scriptText, true);
                }
                else
                {
                    string scriptText = "alert('Có lỗi xảy ra '); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + infoTap_Phim.id_tap_phim + "?page=" + page_number + "#binhluan_trang'";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "err", scriptText, true);
                }
            }
        }

        //chuyen tap thanh so sap xep theo so tap
        private int Fotmat_Tap(string nameTap)
        {
            try
            {
                string NumberTap = Regex.Replace(nameTap, @"[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\-]", string.Empty);
                double tap = double.Parse(NumberTap, System.Globalization.CultureInfo.InvariantCulture);
                return Convert.ToInt32(tap * 10);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        private string GetNumberTap(string tentap)
        {
            string[] arr = tentap.Split(' ');
            return arr[0] + arr[1];
        }

        private void LoadDanhSachTap_Phim()
        {
            DsTap_Phim = null;

            // xap sep lai list theo ten tap phim
            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q);
            DsTap_Phim = dt.ToList();

            for (int i = 0; i < DsTap_Phim.Count(); i++)
            {
                for (int a = 0; a < DsTap_Phim.Count() - 1; a++)
                {
                    if (Fotmat_Tap(GetNumberTap(DsTap_Phim[a].ten_tap_phim)) > Fotmat_Tap(GetNumberTap(DsTap_Phim[a + 1].ten_tap_phim)))
                    {
                        var p = DsTap_Phim[a];
                        DsTap_Phim[a] = DsTap_Phim[a + 1];
                        DsTap_Phim[a + 1] = p;
                    }
                }
            }


        }

        private void NextPage()
        {

            int IdTap_Phim = Convert.ToInt32(Page.RouteData.Values["IdTap_Phim"]);
            for (int i = 0; i < DsTap_Phim.Count; i++)
            {
                if (DsTap_Phim[i].id_tap_phim == IdTap_Phim)
                {
                    try
                    {
                        Next = DsTap_Phim[i + 1];
                    }
                    catch (Exception ex)
                    {
                        Next = null;
                    }
                    break;
                }
            }
        }

        private void BackPage()
        {
            Back = null;
            int IdTap_Phim = Convert.ToInt32(Page.RouteData.Values["IdTap_Phim"]);

            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoTap_Phim.id_phim && q.id_tap_phim < IdTap_Phim select q).OrderByDescending(q => q.id_tap_phim).Take(1);
            if (dt.Count() > 0)
            {
                Back = dt.First();
            }
        }

        //lay ten tai tai khoan
        public string TenTaiKhoan(int id)
        {
            try
            {
                var dt = (from q in dl.DB_USERs where q.id_user == id select q);
                if (dt != null)
                {
                    return dt.First().fullname;
                }
                else
                {
                    return "";
                }
            }
            catch
            {
                return "";
            }
        }
        //img tai tai khoan
        public string ImgTaiKhoan(int id)
        {
            try
            {
                var dt = (from q in dl.DB_USERs where q.id_user == id select q);
                if (dt != null)
                {
                    return dt.First().img_user;
                }
                else
                {
                    return "";
                }
            }
            catch
            {
                return "";
            }

        }

        //nhap phan hoiu
        public void NhapPhanHoi()
        {
            if (!string.IsNullOrEmpty(Request.Form["phan_hoi"]))
            {
                int id_phanhoi = Convert.ToInt32(Request.Form["id-binhluan"]);
                int user_binhluan = Convert.ToInt32(Request.Form["user-binhluan"]);

                string noidung_bl = Request.Form["noidung-bl"].ToString();

                if (noidung_bl == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string), "blthieuchu", "alert('Nội dung phản hồi không được để trống');", true);
                    return;
                }
                else
                {
                    string noidung_cmt = noidung_bl;

                    DB_COMMENT dbcom = new DB_COMMENT();

                    dbcom.id_user = NguoiDungs.id_user;
                    dbcom.id_phim = infoPhim.id_phim;
                    dbcom.id_tap_phim = infoTap_Phim.id_tap_phim;
                    dbcom.noidung_cmt = HeThong.XoaKhoanTrangThua(noidung_cmt);
                    dbcom.id_phanhoi = id_phanhoi;
                    dbcom.created_at = DateTime.Now;
                    dbcom.updated_at = DateTime.Now;
                    dl.DB_COMMENTs.InsertOnSubmit(dbcom);
                    dl.SubmitChanges();

                    string noidung = NguoiDungs.fullname + " đã nhắc đến bạn ở tập phim " + infoTap_Phim.ten_tap_phim + " tại phim " + infoPhim.ten_phim;
                    string urls = "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + infoTap_Phim.id_tap_phim + "?page=" + page_number + "#binhluan";
                    NguoiDung.ThemThongBao(Convert.ToInt32(user_binhluan), NguoiDungs.id_user, noidung, urls);
                    Random r = new Random();
                    string scriptText = "alert('Phản hồi thành công'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "/" + infoTap_Phim.id_tap_phim + "?p=" + r.Next(1, 100) + "#binhluan_trang';";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "binhluans", scriptText, true);

                }
            }
        }

        //load phan hoi 
        public void GetPhanHoi(int id)
        {
            LoadPhanHoi = null;
            var dt = (from q in dl.DB_COMMENTs where q.id_phanhoi == id select q).OrderBy(q => q.created_at);
            if (dt != null)
            {
                LoadPhanHoi = dt.ToList();
            }
        }

        //get name nguoi dung
        public int GetQuyenHan(int id)
        {
            try
            {
                var dt = (from q in dl.DB_USERs where q.id_user == id select q);
                if (dt != null)
                {
                    return Convert.ToInt32(dt.First().quyen_han);
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }

        //
    }
}