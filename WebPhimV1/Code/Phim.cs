using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebPhimV1.Code
{
    public class Phim
    {

        public static string FileName_IMG = "";

        // rut gon string
        public static string RutGon(string rutgon_name, int rutgon_number)
        {
            int len_name = rutgon_name.Length;
            if (len_name >= rutgon_number)
            {
                return rutgon_name.Substring(0, rutgon_number) + "...";
            }
            else
            {
                return rutgon_name;
            }

        }
        // rut gon string




        
    }//

}