using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using WebPhimV1.Code;
using System.IO;
using System.Text.RegularExpressions;

namespace WebPhimV1.Control_NguoiDung.TrangPhim
{
    public partial class UiThongTinPhim : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();

        public  DB_PHIM infoPhim = new DB_PHIM(); // thong tin Phim
        public  List<DB_TAP_PHIM> ListTap_Phim = new List<DB_TAP_PHIM>(); // danh sach Tap_Phim cua Phim
        public  DB_TAP_PHIM Tap_PhimDau = new DB_TAP_PHIM(); // danh sach Tap_Phim cua Phim
        public  List<string> DSTheLoai = new List<string>(); // danh sach luu the loai
        public  List<int> DsIdTheLoai = new List<int>();
        public  List<LayThongTinBinhLuanResult> DSComment = new List<LayThongTinBinhLuanResult>();
        public  List<LayPhimTheLoaiResult> PhimTL = new List<LayPhimTheLoaiResult>();
        public  DB_USER NguoiDungs = new DB_USER();
        public  DB_THUVIEN CheckThuVien = new DB_THUVIEN();
        public  double DanhGia;
        public  string checktontai;
        public  string checkthuvien;
        public  int LuotXem;
        public  int NguoiDanhGia;
        public  int SumTap_Phim;
        public  int page_number = 0; // trang thu n
        public static  int SumPage = 0;

  

        public static string StripHTML(string input)
        {
            return Regex.Replace(input, "<.*?>", String.Empty);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
         try{


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



        private void LoadNotLogin()
        {

            LoadThongTinPhim(); // load thong tin Phim len
            LoadLuotXem(); // load luot xem
            LoadThongTinTheLoai(); // load danh sach Phim
            LoadSumTap_Phim(); // load tong so Tap_Phim cua Phim
            LoadTap_Phim(); // goi danh sach Tap_Phim theo id
            LoadBinhLuanNguoiDung(); // load binh luan
        }

        private void LoadLogin()
        {
            LoadThongTinNguoiDung();
            LoadThongTinPhim(); // load thong tin Phim len
            CheckDoc(); // kiem tra nguoi dung da mua
            LoadLuotXem(); // load luot xem
            LoadThongTinTheLoai(); // load danh sach Phim
            LayTap_PhimDau(); // lay Tap_Phim dau tien cua Phim
            LoadSumTap_Phim(); // load tong so Tap_Phim cua Phim
            LoadTap_Phim(); // goi danh sach Tap_Phim theo id
            DanhGiaPhim(); // danh gia Phim
            LoadBinhLuanNguoiDung(); // load binh luan
            MuaPhim(); // mua Phim
        }

        //load thong tin nguoi dung
        private void LoadThongTinNguoiDung()
        {
            NguoiDungs = Theme.NguoiDung.NguoiDungs;

            //String MaKhoa = Request.Cookies["log"].Value;

            //var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            //if (dt != null)
            //{
             //   NguoiDungs = dt.First();
            //}
        }

        // kiem tra da mua Phim hay chua
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
            }
            catch
            {
                checkthuvien = null;
            }

        }
        private void LoadLuotXem()
        {
            var dt = (from q in dl.DB_LUOTXEMs where q.id_phim == infoPhim.id_phim select q).Count();
            LuotXem = dt;
        }

        //load thong tin Phim
        private void LoadThongTinPhim()
        {
            infoPhim = null;
            string link_raw = Page.RouteData.Values["LinkRawPhim"].ToString();
            int id_phim = Convert.ToInt32(Page.RouteData.Values["IdPhim"]);

            var dt = (from q in dl.DB_PHIMs where q.link_raw == link_raw && q.id_phim == id_phim select q);

            if (dt != null)
            {
                infoPhim = dt.First();
                if (infoPhim.status_ == 0)
                {
                    string scriptText = "alert('Bộ phim này tạm khoá vui lòng trở lại sau !');window.location='" + Request.ApplicationPath + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "khoaphim", scriptText, true);
                }
            }
        } //

        private void LoadSumTap_Phim()
        {
            SumTap_Phim = 0;
            try
            {
                SumTap_Phim = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q).Count();
            }
            catch
            {
                SumTap_Phim = 0;
            }
            if (SumTap_Phim == 0)
            {
                string scriptText = "alert('Phim này chưa được cập nhật tập phim !'); ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
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

        private void LoadTap_Phim()
        {
            ListTap_Phim = null;

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
            SumPage = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q).Count() / take;

            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q);
            ListTap_Phim = dt.ToList();
            // xap sep lai list theo ten tap phim
            for (int i = 0; i < ListTap_Phim.Count(); i++)
            {
                for (int a = 0; a < ListTap_Phim.Count() - 1; a++)
                {
                    if (Fotmat_Tap(GetNumberTap(ListTap_Phim[a].ten_tap_phim)) > Fotmat_Tap(GetNumberTap(ListTap_Phim[a + 1].ten_tap_phim)))
                    {
                        var p = ListTap_Phim[a];
                        ListTap_Phim[a] = ListTap_Phim[a + 1];
                        ListTap_Phim[a + 1] = p;
                    }
                }
            }
            //phan trang tap
                if (dt != null && dt.Count() > 0)
                {
                    if (int.Parse(infoPhim.coin_phim) > 0)
                    {
                        if (checkthuvien != null)
                        {
                            ListTap_Phim = ListTap_Phim.Skip(skip).Take(take).ToList();
                        }
                    }
                    else
                    {
                        ListTap_Phim = ListTap_Phim.Skip(skip).Take(take).ToList();
                    }
                }
                //else
                //{
                //    try
                //    {
                 //       dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q).OrderBy(q => q.created_at).Skip(skip - 1).Take(take);
                 //       ListTap_Phim = dt.ToList();
                 //   }
                //    catch (Exception ex) { }
            //}

        } //

        //load thong tin Phim
        private void LoadThongTinTheLoai()
        {
            PhimTL = null;
            var TheLoai = dl.LayPhimTheLoai(infoPhim.id_phim);
            var dt = (from q in TheLoai where q.id_phim == infoPhim.id_phim select q);
            if (dt != null)
            {
                PhimTL = dt.ToList();
            }

            //lay 2 the loai
            string luutl = "";
            foreach(var a in PhimTL)
            {
                luutl += HeThong.LocDauTiengViet(a.ten_theloai) + ", ";
            }

            //Luu the loai vao trinh duyet
            HttpCookie TK = new HttpCookie("HintTheLoai");
            TK.Value = luutl;
            TK.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(TK);



            bool dotuuoi = false;
            foreach (var theloai in PhimTL)
            {
                if (theloai.ten_theloai == "18+") dotuuoi = true;
            }

            if (dotuuoi == true)
            {
                string scriptText = "modal.style.display = 'block'; noti.innerHTML = '<center><h1>Cảnh báo bộ phim này có nội dung 16 +</center></h1></br> Hãy chắc chắn rằng bạn đủ tuổi để xem bộ phim này !'; window.onclick = function(event) { modal.style.display = 'none' }";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
            }

        } //

        // lay Tap_Phim dang doc
        public string GetDangDoc()
        {
            var dt = (from q in dl.DB_THUVIENs where q.id_user == NguoiDungs.id_user && q.id_phim == infoPhim.id_phim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.id_tap_phim.ToString();
            }
            else
            {
                return "";
            }
        }

        private void LoadBinhLuanNguoiDung()
        {
            DSComment = null;
            var dt = (from q in dl.LayThongTinBinhLuan(infoPhim.id_phim) select q).Take(20);

            if (dt != null)
            {
                DSComment = dt.ToList();
            }
        }
        private void LayTap_PhimDau()
        {
            checktontai = null;
            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q).OrderBy(q => q.created_at);
            if (dt.Count() > 0)
            {
                Tap_PhimDau = dt.First();
                checktontai = Tap_PhimDau.id_tap_phim.ToString();
            }
        }

        public string getTap_PhimMax()
        {
            checktontai = null;
            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == infoPhim.id_phim select q).OrderByDescending(q => q.created_at);
            if (dt.Count() > 0)
            {
                return dt.First().id_tap_phim.ToString();

            }
            else
            {
                return "";
            }
        }

        // mua Phim
        private void MuaPhim()
        {
            Random r = new Random();

            if (!string.IsNullOrEmpty(Request.Form["MuaPhim"]))
            {
                if (!string.IsNullOrEmpty(Request.Form["Nguoidung"]))
                {
                    dl.ThemThuVien(NguoiDungs.id_user, infoPhim.id_phim, Tap_PhimDau.id_tap_phim); // them vao thu vien
                    string scriptText = "alert('Đã thêm phim vào thư viện của bạn !'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
                else
                {
                    if (Convert.ToInt64(NguoiDungs.coin) >= Convert.ToInt64(infoPhim.coin_phim))
                    {
                        var tacgia_coin = (from q in dl.DB_USERs where q.id_user == infoPhim.id_user select q.coin).First();

                        int coin = Convert.ToInt32(Convert.ToInt64(NguoiDungs.coin) - Convert.ToInt64(infoPhim.coin_phim));
                        int coin_tacgia = Convert.ToInt32(Convert.ToInt64(tacgia_coin) + Convert.ToInt64(infoPhim.coin_phim));
                        dl.CapNhatCoinUser(NguoiDungs.id_user, coin); // cap nhat lai so tien

                        // cap nhat coint tac gia
                        DB_USER cntacgia = dl.DB_USERs.Single(q => q.id_user == infoPhim.id_user);
                        cntacgia.coin = coin_tacgia;
                        dl.SubmitChanges();
                        //cap nhat vao log
                        DB_LOG_COIN log = new DB_LOG_COIN();
                        log.ghichu = "Mua_Phim_" + infoPhim.ten_phim;
                        log.id_user_chuyen = NguoiDungs.id_user;
                        log.id_user_nhan = infoPhim.id_user;
                        log.coin = infoPhim.coin_phim;
                        log.created_at = DateTime.Now;
                        log.updated_at = DateTime.Now;
                        dl.DB_LOG_COINs.InsertOnSubmit(log);
                        dl.SubmitChanges();
                        // them Phim vao thu vien
                        dl.ThemThuVien(NguoiDungs.id_user, infoPhim.id_phim, Tap_PhimDau.id_tap_phim); // them vao thu vien
                        // neu may man -> nhan con thuog
                        //if (Convert.ToInt32(infoPhim.coin_phim) != 0 && r.Next(1, 5) == 2 || Convert.ToInt64(NguoiDungs.quyen_han) == 2)
                        if (Convert.ToInt32(infoPhim.coin_phim) != 0 && r.Next(1, 20) % 2 == 0)
                        {
                            // lay ngau nghien phan tram
                            int phantram = r.Next(1, 11);
                            int hoantien = (Convert.ToInt32(infoPhim.coin_phim) * phantram) / 100;
                            coin = Convert.ToInt32(coin + hoantien);
                            dl.CapNhatCoinUser(NguoiDungs.id_user, coin); // cap nhat lai so tien
                            //cap nhat vao log                     
                            DB_LOG_COIN logs = new DB_LOG_COIN();
                            logs.ghichu = "Khuyen_Mai_Mua_Phim_" + infoPhim.ten_phim;
                            logs.id_user_chuyen = 0;
                            logs.id_user_nhan = NguoiDungs.id_user;
                            logs.coin = hoantien.ToString();
                            logs.created_at = DateTime.Now;
                            logs.updated_at = DateTime.Now;
                            dl.DB_LOG_COINs.InsertOnSubmit(logs);
                            dl.SubmitChanges();

                            //thong bao cap nhat Tap_Phim
                            //id_user - id nhận
                            //id_phanhoi - id gui thong bao
                            string noidung = "SYS: Bạn nhân được " + hoantien + " coin khi mua phim " + infoPhim.ten_phim;
                            string urls = "/taikhoan/info";
                            NguoiDung.ThemThongBao(NguoiDungs.id_user, 0, noidung, urls);


                        }

                        if (NguoiDungs.id_user != infoPhim.id_user && int.Parse(infoPhim.coin_phim) != 0)
                        {
                            //them thong bao cho tac gia
                            //id_user - id nhận
                            //id_phanhoi - id gui thong bao
                            string noidung = NguoiDungs.fullname + " đã mua phim " + infoPhim.ten_phim + " của bạn với " + infoPhim.coin_phim + " coin";
                            string urls = "/taikhoan/info";
                            NguoiDung.ThemThongBao(Convert.ToInt32(infoPhim.id_user), NguoiDungs.id_user, noidung, urls);

                        }
                        if (NguoiDungs.id_user != infoPhim.id_user && int.Parse(infoPhim.coin_phim) == 0)
                        {
                            //cap nhat cho tac gia
                            //id_user - id nhận
                            //id_phanhoi - id gui thong bao
                            string noidung = NguoiDungs.fullname + " đã thêm phim " + infoPhim.ten_phim + " của bạn vào thư viện";
                            string urls = "/taikhoan/info";
                            NguoiDung.ThemThongBao(Convert.ToInt32(infoPhim.id_user), NguoiDungs.id_user, noidung, urls);
                        }

                        string thongbao = "";
                        if (int.Parse(infoPhim.coin_phim) == 0)
                        {
                            thongbao = "Lưu phim thành công";
                        }
                        else
                        {
                            thongbao = "Mua phim thành công";
                        }

                        string scriptText = "alert(' " + thongbao + " '); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

                    }
                    else
                    {
                        string scriptText = "alter('Bạn không đủ coin để mua phim này !'); ";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                    }
                }
            }
        }

        private void DanhGiaPhim()
        {
            int sum = 0;
            int count = 0;
            DanhGia = 0;
            var dt = (from q in dl.DB_VOTEs where q.id_phim == infoPhim.id_phim select q);
            if (dt.Count() > 0)
            {
                sum = dt.Sum(q => q.giatri);
            }
            if (sum == 0) sum = 0;
            var dts = (from q in dl.DB_VOTEs where q.id_phim == infoPhim.id_phim select q);
            if (dts.Count() > 0)
            {
                count = dts.Count();
            }
            if (count == 0) count = 0;
            NguoiDanhGia = count;
            DanhGia = Convert.ToDouble((double)sum / count);
            DanhGia = Math.Round(DanhGia, 2);
            if (DanhGia.ToString() == "NaN") DanhGia = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["danhgia"]))
            {

                if (checkthuvien != null)
                {

                    int GiaTri = Convert.ToInt32(Request.QueryString["danhgia"]);
                    if (GiaTri > 5) GiaTri = 5;
                    var dtss = (from q in dl.DB_VOTEs where q.id_phim == infoPhim.id_phim && q.id_user == NguoiDungs.id_user select q).FirstOrDefault();
                    if (dtss != null)
                    {
                        var upvote = dl.DB_VOTEs.Single(q => q.id_phim == infoPhim.id_phim && q.id_user == NguoiDungs.id_user);
                        upvote.giatri = GiaTri;
                        upvote.updated_at = DateTime.Now;
                        dl.SubmitChanges();

                        string scriptText = "alert('Cập nhật thành công !'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

                    }
                    if (dtss == null)
                    {
                        try
                        {
                            DB_VOTE userDG = new DB_VOTE();
                            userDG.giatri = GiaTri;
                            userDG.id_phim = infoPhim.id_phim;
                            userDG.id_user = NguoiDungs.id_user;
                            userDG.created_at = DateTime.Now;
                            userDG.updated_at = DateTime.Now;

                            dl.DB_VOTEs.InsertOnSubmit(userDG);
                            dl.SubmitChanges();

                            if (NguoiDungs.id_user != infoPhim.id_user)
                            {
                                //thong bao cap nhat Tap_Phim
                                //id_user - id nhận
                                //id_phanhoi - id gui thong bao
                                string noidung = NguoiDungs.fullname + " đã vote phim " + infoPhim.ten_phim + " được " + GiaTri + " sao ";
                                string urls = "/Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim;
                                NguoiDung.ThemThongBao(Convert.ToInt32(infoPhim.id_user), NguoiDungs.id_user, noidung, urls);
                            }
                            string scriptText = "alert('Vote thành công !'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "'";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                        }
                        catch
                        {
                            string scriptText = "alert('Có lỗi xảy ra !'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "'";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                        }
                    }
                }
                else
                {
                    string scriptText = "alert('Chỉ có thể đánh giá những phim được lưu trong thư viện !'); window.location='" + Request.ApplicationPath + "Phim/" + infoPhim.link_raw + "-" + infoPhim.id_phim + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
            }

        }

        public int LuotXemTap_Phim(int id_tap_phim)
        {
            int kq = 0;
            var dt = (from q in dl.DB_LUOTXEMs where q.id_tap_phim == id_tap_phim select q).Count();
            if (dt == null)
            {
                return kq;
            }
            else
            {
                return dt;
            }

        }



        //get name nguoi dung
        public string GetName(int id)
        {
            try
            {
                var dt = (from q in dl.DB_USERs where q.id_user == id select q.fullname);
                if (dt != null)
                {
                    return dt.First();
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

        //get name nguoi dung
        public int GetQuyenHan(int id)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id select q.quyen_han);
            if (dt != null)
            {
                return Convert.ToInt32(dt.First());
            }
            else
            {
                return 0;
            }
        }
        // lay link raw cua Phim
        public string LinkRaw(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.link_raw.ToString();
            }
            else
            {
                return "";
            }

        }

        // lay anh cua Phim
        public string ImgPhim(int idPhim)
        {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == idPhim select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.img_phim.ToString();
            }
            else
            {
                return "";
            }

        }
        //
    }
}