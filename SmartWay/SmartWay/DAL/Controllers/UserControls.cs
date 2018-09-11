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
    public class UserControls
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addUser(string fName, string lName, string emailAddress, int phoneID, int addressID, int paypalID, string password, string regoDate)
        {
            // Add user to database
            // INSERT INTO tblCustomer VALUES()
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "INSERT into Person VALUES (@fName, @lName, @emailAddress, @phoneID, @addressID, @paypalID, @password, @regoDate)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@fName", SqlDbType.VarChar, 60).Value = fName;
            cmd.Parameters.Add("@lName", SqlDbType.VarChar, 60).Value = lName;
            cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 100).Value = emailAddress;
            cmd.Parameters.Add("@phoneID", SqlDbType.Int).Value = phoneID;
            cmd.Parameters.Add("@addressID", SqlDbType.Int).Value = addressID;
            cmd.Parameters.Add("@paypalID", SqlDbType.Int).Value = paypalID;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 60).Value = password;
            cmd.Parameters.Add("@regoDate", SqlDbType.Date).Value = regoDate;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public int addPhoneNumber(int phoneNumber)
        {
            // Add phone number to database
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "INSERT into PhoneNumber VALUES (@phoneNumber)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@phoneNumber", SqlDbType.SmallInt).Value = phoneNumber;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            int phoneID = getPhoneID(phoneNumber);
            return phoneID;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public int getPhoneID(int phoneNumber)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            SqlCommand cmd = new SqlCommand();
            string query = "SELECT ID FROM PhoneNumber WHERE phoneNumber = @phoneNumber";
            cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@phoneNumber", SqlDbType.SmallInt).Value = phoneNumber;
            connection.Open();
            int phoneID = (int)cmd.ExecuteScalar();
            connection.Close();
            return phoneID;
        }

        public string getconnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
        }
    }
}