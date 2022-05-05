using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Security.Cryptography; // thu vien ma hoa
using System.Text;
using System.Text.RegularExpressions;

namespace WebPhimV1.Code
{
    public class HeThong
    {

        public HeThong()
        {
            
        }

        public static string url()
        {
            string URL = "";

            try
            {

                string Port = HttpContext.Current.Request.ServerVariables["SERVER_PORT"];

                if ((Port == null) || Port == "80" || Port == "443" || Port == "8081")
                {
                    Port = "";
                }

                else
                {
                    Port = ":" + Port;
                }

                string Protocol = HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];


                if ((Protocol == null) || Protocol == "0")
                {
                    Protocol = "http://";
                }

                else
                {
                    Protocol = "https://";
                }

                URL = Protocol + HttpContext.Current.Request.ServerVariables["SERVER_NAME"] + Port + "";
            }

            catch (Exception ex)
            {
            }

            return URL;

            //string domainName = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
            //return domainName;
        }


        public static string TinhThoiGian(DateTime dates)
        {
            string H_now = DateTime.Now.ToString("HH");
            string Y_now = DateTime.Now.ToString("yyyy");
            string D_now = DateTime.Now.ToString("dd");
            string M_now = DateTime.Now.ToString("MM");
            string mm_now = DateTime.Now.ToString("mm");

            string H_in = dates.ToString("HH");
            string Y_in = dates.ToString("yyyy");
            string D_in = dates.ToString("dd");
            string M_in = dates.ToString("MM");
            string mm_in = dates.ToString("mm");



            if (M_in != M_now && Y_now == Y_in) // tinh ngya
            {
                return Convert.ToInt32(M_now) - Convert.ToInt32(M_in) + " tháng trước";
            }

            else if (M_in == M_now && D_now != D_in && Y_now == Y_in) // tinh ngya
            {
                return Convert.ToInt32(D_now) - Convert.ToInt32(D_in) + " ngày trước";
            }

            else if (M_in == M_now && D_now == D_in && H_in != H_now && Y_now == Y_in) // tinh gio
            {
                return Convert.ToInt32(H_now) - Convert.ToInt32(H_in) + " giờ trước";
            }

            else if (M_in == M_now && D_now == D_in && H_in == H_now && Y_now == Y_in) // tinh phut
            {
                return Convert.ToInt32(mm_now) - Convert.ToInt32(mm_in) + " phút trước";
            }
            else
            {
                return  Convert.ToInt32(Y_now) - Convert.ToInt32(Y_in) + " năm trước";
            }


        }

        public static string MH_MD5(string str)
        {
            MD5 mh = MD5.Create();
            //Chuyển kiểu chuổi thành kiểu byte
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(str);
            //mã hóa chuỗi đã chuyển
            byte[] hash = mh.ComputeHash(inputBytes);
            //tạo đối tượng StringBuilder (làm việc với kiểu dữ liệu lớn)
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("x"));
            }

            return sb.ToString();
        }

        public static string LocDauTiengViet(string text) //loc dau, khoang trang, ky tu dat biet
        {
            string[] arr1 = new string[] {
                "á",
                "à",
                "ả",
                "ã",
                "ạ",
                "â",
                "ấ",
                "ầ",
                "ẩ",
                "ẫ",
                "ậ",
                "ă",
                "ắ",
                "ằ",
                "ẳ",
                "ẵ",
                "ặ",
                "đ",
                "é",
                "è",
                "ẻ",
                "ẽ",
                "ẹ",
                "ê",
                "ế",
                "ề",
                "ể",
                "ễ",
                "ệ",
                "í",
                "ì",
                "ỉ",
                "ĩ",
                "ị",
                "ó",
                "ò",
                "ỏ",
                "õ",
                "ọ",
                "ô",
                "ố",
                "ồ",
                "ổ",
                "ỗ",
                "ộ",
                "ơ",
                "ớ",
                "ờ",
                "ở",
                "ỡ",
                "ợ",
                "ú",
                "ù",
                "ủ",
                "ũ",
                "ụ",
                "ư",
                "ứ",
                "ừ",
                "ử",
                "ữ",
                "ự",
                "ý",
                "ỳ",
                "ỷ",
                "ỹ",
                "ỵ",
            };
            string[] arr2 = new string[] {
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "a",
                "d",
                "e",
                "e",
                "e",
                "e",
                "e",
                "e",
                "e",
                "e",
                "e",
                "e",
                "e",
                "i",
                "i",
                "i",
                "i",
                "i",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "o",
                "u",
                "u",
                "u",
                "u",
                "u",
                "u",
                "u",
                "u",
                "u",
                "u",
                "u",
                "y",
                "y",
                "y",
                "y",
                "y",
            };
            for (int i = 0; i < arr1.Length; i++)
            {
                text = text.Replace(arr1[i], arr2[i]);
                text = text.Replace(arr1[i].ToUpper(), arr2[i].ToUpper());
            }
            text = text.Replace(" ", String.Empty); // loai bo khoan trong
            text = LocKyTuDatBiet(text);
            return text;
        }
        // loc ky tu dat biet
        public static string LocKyTuDatBiet(string str)
        {
            string removableChars = Regex.Escape(@"@&'()<>#");
            string pattern = "[" + removableChars + "]";
            str = Regex.Replace(str, pattern, "");
            return str;
        }
        public static int LaySoNgauNhien()
        {
            Random dl = new Random();
            return dl.Next(0, 9999); //Trả về giá trị kiểu int

        }
        // loc link raw
        public static string LinkRaw(string str)
        {

            string text = str;
            text = LocKyTuDatBiet(text);
            text = text.Replace(" ", "-");
            text = text.Replace(".", "-");
            text = text.Replace(",", "-");
            text = text.Replace(":", "k");
            text = text.Replace("?", "k");
            text = text.Replace("/", "k");
            text = text.Replace("|", "k");
            text = LocDauTiengViet(text);
            text = text + "-" + LaySoNgauNhien().ToString();
            return text.ToLower();
        }

        // loc từ nhạy cảm
        public static string TuNhayCam(string text)
        {
           
            // chuoi thanh mảng
            var str = "má m, má nó, địt mẹ, chich, lon, lol, cak, cailon, memai,quần què, wần wè, cức, cứt, cờ hó, loèn, lôn, lìn, lỳn,mất dạy, mấc dại, mất dại, mấc dạy,bóng,bống, gay, less,bê đê, buê đuê, hiếp, bắc kùy, bắc kỳ, nam kỳ, nam kùy, bucky,thiểu năng, VNCH, Việt Tân, Việt Nam Cộng Hòa, Bò đỏ, Cộng Sản, KongSan";
            str += ",Fuck, fuck you, son of bitch, asshole, kiss my ass, ass, dick, pussy, boob, niple, suck my dick, bitch, bitch, fucking , suck, motherfucker, nigga, nigger, shit";
            str += ", mẹ, má, má m, dit me, du ma, dit, http, https, Hentai, sex,";
            var tho_tuc = str.Split(',');

            bool LocThoTuc = false;

            var nd = StripHTML(text.ToLower()).Split(' ');

            foreach (string txt in tho_tuc)
            {
                foreach (string txt_in in nd)
                {
                    string noi_dung_vao = txt_in.ToLower().Replace(" ", "");
                    string noi_dung_check = txt.Replace(" ", "").ToLower();
                    if (noi_dung_vao.Equals(noi_dung_check) )
                    {
                        LocThoTuc = true;
                    }
                }

            }

            if (LocThoTuc == true)
            {
                return "Nội dung bị ẩn do chứa từ ngữ thô tục !";
            }
            else
            {
                return text;
            }

        }
        public static string StripHTML(string input)
        {
            return Regex.Replace(input, "<.*?>", String.Empty);
        }

        static readonly string[] suffixes =  { "Bytes", "KB", "MB", "GB", "TB", "PB" };  

public static string FormatSize(Int64 bytes)  
{  
int counter = 0;  
decimal number = (decimal)bytes;  
while (Math.Round(number / 1024) >= 1)  
{  
number = number / 1024;  
counter++;  
}  
return string.Format("{0:n1}{1}", number, suffixes[counter]);  
}  
 

    }
}