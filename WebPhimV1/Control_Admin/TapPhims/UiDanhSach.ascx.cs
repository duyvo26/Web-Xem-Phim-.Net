using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Tap_Phims
{
    public partial class UiDanhSach : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_PHIM infoPhim = new DB_PHIM();  // thong tin Phim
        public  List<DB_TAP_PHIM> DSC =
            new List<DB_TAP_PHIM>();  // DS Tap_Phim
        public  DB_USER NguoiDungs = new DB_USER();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadThongTinNguoiDung();  // lay thong tin nguoi dung ra theo cookie
                NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                LoadThongTinPhim();  // load thong tin Phim len
                LoadDSTap_Phim();
                LoadXoaTap_Phim();
            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        // load thong tin Phim
        public void LoadThongTinPhim()
        {
            int id_phim = Convert.ToInt32(Page.RouteData.Values["IdPhim"]);
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id_phim select q);

            if (dt != null)
            {
                infoPhim = dt.First();
                // LoadTap_Phim(infoPhim.id_phim); // goi danh sach Tap_Phim theo id
            }
        }  //

        // chuyen tap thanh so sap xep theo so tap
        public int Fotmat_Tap(string nameTap)
        {
            try
            {
                string NumberTap = Regex.Replace(
                    nameTap,
                    @"[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\-]",
                    string.Empty);
                double tap = double.Parse(
                    NumberTap, System.Globalization.CultureInfo.InvariantCulture);
                return Convert.ToInt32(tap * 10);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public void LoadDSTap_Phim()
        {
            // xap sep lai list theo ten tap phim
            var dt = (from q in dl.DB_TAP_PHIMs
                      where q.id_phim ==
                          infoPhim.id_phim
                      select q);
            DSC = dt.ToList();

            //  for (int i = 0; i < DSC.Count(); i++)
            //  {
            //     for (int a = 0; a < DSC.Count() - 1; a++)
            //     {
            //         if (Fotmat_Tap(DSC[a].ten_tap_phim) > Fotmat_Tap(DSC[a +
            //         1].ten_tap_phim))
            //         {
            //            var p = DSC[a];
            //            DSC[a] = DSC[a + 1];
            //           DSC[a + 1] = p;
            //       }
            //    }
            // }
        }

        public void LoadThongTinNguoiDung()
        {
            NguoiDungs = Admin.Theme.NguoiDungs;
            // String MaKhoa = Request.Cookies["Log"].Value;

            // var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            // if (dt != null)
            //{
            // NguoiDungs = dt.First();
            // }
        }

        public void LoadXoaTap_Phim()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["XoaTap_Phim"]))
            {
                int ID = Convert.ToInt32(Request.QueryString["XoaTap_Phim"]);
                var Tap_Phim =
                    (from q in dl.DB_TAP_PHIMs where q.id_tap_phim == ID select q)
                        .FirstOrDefault();

                var thuvien =
                    (from q in dl.DB_THUVIENs where q.id_tap_phim == ID select q)
                        .FirstOrDefault();

                var luotxem =
                    (from q in dl.DB_LUOTXEMs where q.id_tap_phim == ID select q);

                var comment =
                    (from q in dl.DB_COMMENTs where q.id_tap_phim == ID select q);

                dl.CapNhatThuVien(NguoiDungs.id_user, infoPhim.id_phim, null);

                if (luotxem != null) dl.DB_LUOTXEMs.DeleteAllOnSubmit(luotxem);

                if (comment != null) dl.DB_COMMENTs.DeleteAllOnSubmit(comment);

                if (Tap_Phim != null) dl.DB_TAP_PHIMs.DeleteOnSubmit(Tap_Phim);

                dl.SubmitChanges();

                // string scriptText = "alert('Đã xóa thành công tập phim: ');
                // window.location='" + Request.ApplicationPath +
                // "cp-admin/tap-phim/danhsach-" + infoPhim.id_phim + "'";
                // ScriptManager.RegisterStartupScript(this, this.GetType(),
                // "alertMessage", scriptText, true);

                string scriptText = "window.location='" + Request.ApplicationPath +
                                    "cp-admin/tap-phim/danhsach-" + infoPhim.id_phim +
                                    "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                    "alertMessage", scriptText, true);
            }
        }
        public int LuotXemTap_Phim(int id_tap_phim)
        {
            int kq = 0;
            var dt =
                (from q in dl.DB_LUOTXEMs where q.id_tap_phim == id_tap_phim select q)
                    .Count();
            if (dt == null)
            {
                return kq;
            }
            else
            {
                return dt;
            }
        }
    }  //
}