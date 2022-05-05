using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebPhimV1.Code
{
    public class ConnectDatabase
    {

        SqlConnection conn;
        public static string strcon = ConfigurationManager.ConnectionStrings["WEB_PHIMConnectionString"].ConnectionString; // chuoi ket noi


        // mở kết nối
        public void connect()
        {
            if (conn == null)
            {
                conn = new SqlConnection(strcon);
            }
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }


        // đóng kết nối
        public void disconnect()
        {
            if ((conn != null) && (conn.State == ConnectionState.Open))
            {
                conn.Close();
            }
        }


        // trả về một DataTable .
        public DataTable getDataTable(string sql)
        {
            connect();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            disconnect();
            return dt;
        }

        // thực thi câu lệnh truy vấn insert,delete,update
        public void ExecuteNonQuery(string sql)
        {
            connect();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            disconnect();
        }

        // trả về DataReader
        public SqlDataReader getDataReader(string sql)
        {
            connect();
            SqlCommand com = new SqlCommand(sql, conn);
            SqlDataReader dr = com.ExecuteReader();
            //disconnect();
            return dr;
        }

        // kiem tra gia trị ton tại
        public bool CheckTonTai(string sql)
        {
            connect();
            SqlCommand com = new SqlCommand(sql, conn);
            try
            {
                int val = (int)com.ExecuteScalar();
                disconnect();
                if (val > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch
            {
                return true;
            }

        }

        // trả về DataReader
        public DataSet getDataSet(string sql)
        {
            connect();
            SqlCommand com = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet dt = new DataSet();
            da.Fill(dt);
            disconnect();
            return dt;
        }


    }
}