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
        public void addAddress(string uNum, string sNum, string sName, string city, int pCode, int stateID, string country)
        {
            // Add address to database
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "EXEC sp_NewAddress @uNum, @sNum, @sName, @city, @pCode, @state, @country";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@uNum", SqlDbType.VarChar, 4).Value = uNum;
            cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
            cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
            cmd.Parameters.Add("@city", SqlDbType.VarChar, 50).Value = city;
            cmd.Parameters.Add("@state", SqlDbType.Int).Value = stateID;
            cmd.Parameters.Add("@pCode", SqlDbType.SmallInt).Value = pCode;
            cmd.Parameters.Add("@country", SqlDbType.VarChar, 30).Value = country;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            //int addressID = getAddressID(uNum, sNum, sName, pCode);
            //return addressID;
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public int getStateID(string state)
        {
            SqlConnection connection = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand();
            String query = "SELECT ID FROM StateName WHERE stateName = @state";
            cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@state", SqlDbType.VarChar, 20).Value = state;
            connection.Open();
            int stateID = (int)cmd.ExecuteScalar();
            connection.Close();
            return stateID;
        }

        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
        }
    }
}