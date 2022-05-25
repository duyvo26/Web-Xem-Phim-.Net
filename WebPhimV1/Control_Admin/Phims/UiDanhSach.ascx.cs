using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.Phims
{
    public partial class UiDanhSach : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_USER NguoiDungs = new DB_USER();
        public  List<DB_PHIM> dsPhim = new List<DB_PHIM>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadThongTinNguoiDung();
                NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                LoadDsPhim();
                XoaPhim();
            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        // load thong tin nguoi dung
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

        // load thong tin nguoi dung
        public void LoadDsPhim()
        {
            var dt =
                (from q in dl.DB_PHIMs select q).OrderByDescending(q => q.updated_at);

            if (dt != null)
            {
                dsPhim = dt.ToList();
            }
        }

        // load thong tin nguoi dung
        public string LoadName(int id_user)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id_user select q);

            if (dt.Count() > 0)
            {
                var ten = dt.First();
                return ten.ten_dangnhap.ToString();
            }
            else
            {
                return "";
            }
        }

        public void XoaPhim()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Xoa"]))
            {
                int ID = Convert.ToInt32(Request.QueryString["Xoa"]);

                // dl.XoaPhim(ID);

                var Phim = (from q in dl.DB_PHIMs where q.id_phim == ID select q)
                               .FirstOrDefault();
                var vote = (from q in dl.DB_VOTEs where q.id_phim == ID select q);
                var luotxem = (from q in dl.DB_LUOTXEMs where q.id_phim == ID select q);
                var thuvien = (from q in dl.DB_THUVIENs where q.id_phim == ID select q);
                var comment = (from q in dl.DB_COMMENTs where q.id_phim == ID select q);
                var Tap_Phim =
                    (from q in dl.DB_TAP_PHIMs where q.id_phim == ID select q);

                if (thuvien != null) dl.DB_THUVIENs.DeleteAllOnSubmit(thuvien);
                if (luotxem != null) dl.DB_LUOTXEMs.DeleteAllOnSubmit(luotxem);
                if (vote != null) dl.DB_VOTEs.DeleteAllOnSubmit(vote);
                if (comment != null) dl.DB_COMMENTs.DeleteAllOnSubmit(comment);
                if (Tap_Phim != null) dl.DB_TAP_PHIMs.DeleteAllOnSubmit(Tap_Phim);
                //
                if (Phim != null)
                {
                    dl.DB_PHIMs.DeleteOnSubmit(Phim);
                    dl.SubmitChanges();
                }

                string scriptText =
                    "alert('Xoá phim thành công !'); window.location='" +
                    Request.ApplicationPath + "cp-admin/Phim/danhsach" + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                    "alertMessage", scriptText, true);
            }
        }

        public int LuotXemPhim(int id_phim)
        {
            int kq = 0;
            var dt = (from q in dl.DB_LUOTXEMs where q.id_phim == id_phim select q)
                         .Count();
            if (dt.ToString() != "" )
            {
                return kq;
            }
            else
            {
                return dt;
            }
        }
        public int TongTap_Phim(int id_phim)
        {
            var dt = (from q in dl.DB_TAP_PHIMs where q.id_phim == id_phim select q)
                         .Count();
            if (dt != null)
            {
                return dt;
            }
            else
            {
                return 0;
            }
        }

    }  //
}