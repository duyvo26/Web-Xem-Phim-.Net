using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.TheLoais
{
    public partial class UiDanhSach : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_USER NguoiDungs = new DB_USER();
        public  List<DB_THELOAI> DanhSachTL = new List<DB_THELOAI>();
        public static int CnID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadThongTinNguoiDung();
                NguoiDung.CheckMod(Convert.ToInt32(NguoiDungs.quyen_han));
                ThongBao(); 
                LoadTheLoai();
                XoatheLoai();
                LoadCapNhatTL();     
            }
            catch (Exception err)
            {
                string url = "~/404?err=true&&vitri=" + this.GetType().Name +
                             "&&tenloi=" + HttpUtility.UrlEncode(err.Message);
                Response.Redirect(url);
            }
        }

        public void ThongBao()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["noti"]))
            {
                string Thongbao = Request
                                      .QueryString["noti"]
                                      .ToString();
                noti.Text = Thongbao;
            }
        }

        public void LoadTheLoai()
        {
            DanhSachTL = null;
            var dt = (from q in dl.DB_THELOAIs select q);
            if (dt.Count() > 0)
            {
                DanhSachTL = dt.ToList();
            }
        }

        // load thong tin nguoi dung
        public void LoadThongTinNguoiDung()
        {
            NguoiDungs = Admin.Theme.NguoiDungs;

            // String MaKhoa = Request.Cookies["log"].Value;

            // var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            // if (dt != null)
            // {
            //    NguoiDungs = dt.First();
            // }
        }

        public void XoatheLoai()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Xoa"]))
            {
                try
                {
                    int ID = Convert.ToInt32(Request.QueryString["Xoa"]);
                    var dt = (from q in dl.DB_THELOAIs where q.id_theloai == ID select q)
                                 .FirstOrDefault();
                    dl.DB_THELOAIs.DeleteOnSubmit(dt);
                    dl.SubmitChanges();
                    string scriptText =
                        "alert('Xoá thể loại thành công !'); window.location='" +
                        Request.ApplicationPath + "cp-admin/theloai/danhsach" + "'";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                        "alertMessage", scriptText, true);

                }
                catch
                {
                }
            }
        }

        protected void btntheloai_Click(object sender, EventArgs e)
        {
            if (tentheloai.Text == "" || motatheloai.Text == "")
            {
                string scriptText =
                    "alert('Tên hoặc Mô tả không được để trống !'); window.location='" +
                    Request.ApplicationPath + "cp-admin/theloai/danhsach" + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                    "alertMessage", scriptText, true);
            }
            else
            {
                DB_THELOAI saTL = new DB_THELOAI();
                saTL.ten_theloai = tentheloai.Text;
                saTL.mota_theloai = motatheloai.Text;
                saTL.created_at = DateTime.Now;
                saTL.updated_at = DateTime.Now;
                dl.DB_THELOAIs.InsertOnSubmit(saTL);
                dl.SubmitChanges();
                string scriptText =
                    "alert('Thêm thể loại thành công'); window.location='" +
                    Request.ApplicationPath + "cp-admin/theloai/danhsach" + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                                    "alertMessage", scriptText, true);
            }
        }

        public void LoadCapNhatTL()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["thongtin"]) && !IsPostBack)
            {
                int ID = Convert.ToInt32(Request.QueryString["thongtin"]);
                var dt = (from q in dl.DB_THELOAIs where q.id_theloai == ID select q)
                             .First();
                cnTenTheLoai.Text = dt.ten_theloai;
                cnMoTaTheLoai.Text = dt.mota_theloai;
                CnID = dt.id_theloai;
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            var dt = (from q in dl.DB_THELOAIs where q.id_theloai == CnID select q)
                         .FirstOrDefault();
            dt.ten_theloai = cnTenTheLoai.Text;
            dt.mota_theloai = cnMoTaTheLoai.Text;
            dl.SubmitChanges();
            string scriptText =
                "alert('Cập nhật loại thành công'); window.location='" +
                Request.ApplicationPath + "cp-admin/theloai/danhsach" + "'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage",
                                                scriptText, true);
        }

    }  //
}