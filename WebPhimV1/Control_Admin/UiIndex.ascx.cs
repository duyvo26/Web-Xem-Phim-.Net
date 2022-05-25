using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using WebPhimV1.Code;

namespace WebPhimV1.Control_Admin
{
    public partial class UiIndex : System.Web.UI.UserControl
    {

        DataWebPhimDataContext dl = new DataWebPhimDataContext();
        public  DB_CAUHINH HeThongs = new DB_CAUHINH();
        public  List<DB_VOTE> DsDanhGia = new List<DB_VOTE>();
        public  List<DB_THUVIEN> DSThuVien = new List<DB_THUVIEN>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetTotalFreeSpace();
                LoadDsDanhGia();
                DanhSachTV();
            }
            catch (Exception err)
            {
                string url = "/404?err=true&&vitri="+ this.GetType().Name + "&&tenloi=" + err.Message;
                Response.Redirect(url);
            }

        }

        public string SumNguoiDung()
        {
            var dt = (from q in dl.DB_USERs select q).Count();
            return dt.ToString();
        }
        public string SumBinhLuan()
        {
            var dt = (from q in dl.DB_COMMENTs select q).Count();
            return dt.ToString();
        }
        public string SumPhim()
        {
            var dt = (from q in dl.DB_PHIMs select q).Count();
            return dt.ToString();
        }
        public string SumTap_Phim()
        {
            var dt = (from q in dl.DB_TAP_PHIMs select q).Count();
            return dt.ToString();
        }
        public void LoadDsDanhGia(){
            DsDanhGia = null;
            var dt = (from q in dl.DB_VOTEs select q).OrderByDescending(q => q.created_at).Take(5);
            if (dt.Count() > 0)
            {
                DsDanhGia = dt.ToList();
            }
        }
        public string LoadNamePhim(int id) {
            var dt = (from q in dl.DB_PHIMs where q.id_phim == id select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_phim; 
            }
            else
            {
                return "";
            }
            
        }
        public string LoadTaiKhoan(int id)
        {
            var dt = (from q in dl.DB_USERs where q.id_user == id select q).FirstOrDefault();
            if (dt != null)
            {
                return dt.ten_dangnhap;
            }
            else
            {
                return "";
            }
        }

        public void DanhSachTV() // danh sach thu vien
        {
            DSThuVien = null;
            var dt = (from q in dl.DB_THUVIENs select q).Take(5).OrderByDescending(q => q.created_at);
            if (dt.Count() > 0)
            {
                DSThuVien = dt.ToList();
            }
        }


        static public long freeSizeRaw, usingSizeRaw;
        static public String freeSizeString, projectDirectory;
        public void GetTotalFreeSpace()
        {

            string appPath = System.IO.Directory.GetCurrentDirectory();

            string[] words = appPath.Split('\\');
            projectDirectory = words[0] + "\\";
            foreach (DriveInfo drive in DriveInfo.GetDrives())
            {
                if (drive.IsReady && drive.Name == "D:\\")
                {
                    freeSizeRaw = drive.TotalFreeSpace;
                    usingSizeRaw = drive.TotalSize;
                    freeSizeString =  HeThong.FormatSize(Convert.ToInt64(drive.TotalFreeSpace));
                }
            }
        }

    }//
}