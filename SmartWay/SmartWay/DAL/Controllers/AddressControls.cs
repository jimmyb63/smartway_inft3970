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
        public int addAddress(string uNum, string sNum, string sName, string city, string state, int pCode, string country, bool active)
        {
            // Add address to database
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "INSERT into PostalAddress VALUES (@uNum, @sNum, @sName, @city, @state, @pCode, @country, @active)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@uNum", SqlDbType.VarChar, 4).Value = uNum;
            cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
            cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 35).Value = city;
            cmd.Parameters.Add("@state", SqlDbType.VarChar, 30).Value = state;
            cmd.Parameters.Add("@pCode", SqlDbType.SmallInt).Value = pCode;
            cmd.Parameters.Add("@country", SqlDbType.VarChar, 30).Value = country;
            cmd.Parameters.Add("@active", SqlDbType.Bit).Value = active;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            int addressID = getAddressID(uNum, sNum, sName, pCode);
            return addressID;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public int getAddressID(string uNum, string sNum, string sName, int pCode)
        {
            SqlConnection connection = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand();
            if (uNum != null)
            {
                String query = "SELECT ID FROM PostalAddress WHERE unitNumber = @uNum AND streetAddress = @sNum AND streetName = @sNum AND postCode = @pCode";
                cmd = new SqlCommand(query, connection);
                cmd.Parameters.Add("@uNum", SqlDbType.VarChar, 4).Value = uNum;
                cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
                cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
                cmd.Parameters.Add("@uNum", SqlDbType.Int).Value = pCode;
            }
            else
            {
                String query = "SELECT ID FROM PostalAddress WHERE streetAddress = @sNum AND streetName = @sNum AND postCode = @pCode";
                cmd = new SqlCommand(query, connection);
                cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
                cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
                cmd.Parameters.Add("@uNum", SqlDbType.Int).Value = pCode;
            }
            connection.Open();
            int addressID = (int)cmd.ExecuteScalar();
            connection.Close();
            return addressID;
        }

        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
        }
    }
}