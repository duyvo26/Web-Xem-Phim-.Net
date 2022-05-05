using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin.NguoiDungs
{
    public partial class UiThemNguoiDung : System.Web.UI.UserControl
    {
        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public static DB_USER NguoiDungs = new DB_USER();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                {
                    LoadThongTinNguoiDung();
                    NguoiDung.CheckAdmin(Convert.ToInt32(NguoiDungs.quyen_han));
                    try
                    {
                        ThongBao();
                    }
                    catch (Exception err)
                    {
                        string url = "/404?err=true&&vitri=" + this.GetType().Name + "&&tenloi=" + err.Message;
                        Response.Redirect(url);
                    }
                  
                }

        }

        //load thong tin nguoi dung
        public void LoadThongTinNguoiDung()
        {
            String MaKhoa = Request.Cookies["log"].Value;

            var dt = (from q in dl.DB_USERs where q.ma_khoa == MaKhoa select q);

            if (dt != null)
            {
                NguoiDungs = dt.First();
            }
        }

        public void ThongBao()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["noti"]))
            {
                string Thongbao = Request.QueryString["noti"].ToString();
                noti.Text = Thongbao;
            }
        }

        protected void Them_Click(object sender, EventArgs e)
        {
            var dt = (from q in dl.DB_USERs where q.ten_dangnhap == taikhoan.Text || q.mail == email.Text select q);

            if (dt != null && dt.Count() > 0)
            {
                noti.Text = "Tài khoản hoặc địa chỉ mail này đã tồn tài !";
            }
            else
            {
                DB_USER dts = new DB_USER();
                dts.fullname = fullname.Text;
                dts.ten_dangnhap = HeThong.LocKyTuDatBiet(HeThong.LocDauTiengViet(taikhoan.Text));
                dts.ma_khoa = HeThong.MH_MD5(taikhoan.Text + matkhau.Text);
                dts.mail = email.Text;
                dts.coin = Convert.ToInt32(coin.Text);
                dts.matkhau_user = HeThong.MH_MD5(HeThong.LocKyTuDatBiet(HeThong.LocDauTiengViet(matkhau.Text)));
                dts.quyen_han = quyenhan.SelectedItem.Value;
                dts.status_ = 1;
                dts.created_at = DateTime.Now;
                dts.updated_at = DateTime.Now;

                dl.DB_USERs.InsertOnSubmit(dts);
                dl.SubmitChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm người dùng thành công')", true);
            }

        }

    } //
}