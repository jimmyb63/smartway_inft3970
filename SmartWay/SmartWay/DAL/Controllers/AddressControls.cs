using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SmartWay.DAL.Controllers
{
    [DataObject(true)]
    public class AddressControls
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addAddress(int sNum, String sName, String city, String state, int pCode, String country)
        {
            // Add address to database
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "INSERT into PostalAddress VALUES (@sNum, @sName, @city, @state, @pCode, @country)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@sNum", SqlDbType.SmallInt).Value = sNum;
            cmd.Parameters.Add("@sName", SqlDbType.VarChar, 255).Value = sName;
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 255).Value = city;
            cmd.Parameters.Add("@state", SqlDbType.VarChar, 30).Value = state;
            cmd.Parameters.Add("@pCode", SqlDbType.SmallInt).Value = pCode;
            cmd.Parameters.Add("@country", SqlDbType.VarChar, 30).Value = country;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
        }
    }
}