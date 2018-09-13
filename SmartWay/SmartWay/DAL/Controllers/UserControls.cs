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
        public void addUser(string fName, string lName, string emailAddress, string password, string regoDate)
        {
            // Add user to database
            // INSERT INTO tblCustomer VALUES()
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "EXEC sp_NewPerson @fName, @lName, @emailAddress, @password, @regoDate";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@fName", SqlDbType.VarChar, 60).Value = fName;
            cmd.Parameters.Add("@lName", SqlDbType.VarChar, 60).Value = lName;
            cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 100).Value = emailAddress;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 60).Value = password;
            cmd.Parameters.Add("@regoDate", SqlDbType.Date).Value = regoDate;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public int newRegistration(string fName, string lName, string emailAddress, string password, int phoneNumber, string uNum, string sNum, string sName, string city, int pCode, int stateID, string country)
        {
            // Add user to database
            // INSERT INTO tblCustomer VALUES()
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "EXEC sp_NewRegistration @fName, @lName, @emailAddress, @password, @phoneNumber, @uNum, @sNum, @sName, @city, @pCode, @state, @country";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@returnPersonID", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add("@fName", SqlDbType.VarChar, 60).Value = fName;
            cmd.Parameters.Add("@lName", SqlDbType.VarChar, 60).Value = lName;
            cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 100).Value = emailAddress;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 60).Value = password;
            cmd.Parameters.Add("@phoneNumber", SqlDbType.Int).Value = phoneNumber;
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
            int personID = (int)cmd.Parameters["@returnPersonID"].Value;
            return personID;
        }

        public void newVerficationCode(string verificationCode, int personID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "EXEC sp_newVerificationCode @verificationCode, @personID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@verificationCode", SqlDbType.VarChar, 8).Value = verificationCode;
            cmd.Parameters.Add("@personID", SqlDbType.Int).Value = personID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public string getVerificationCode(int personID)
        {
            string verificationCode;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT code FROM VerificationCode WHERE personID = @personID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@personID", SqlDbType.Int).Value = personID;
            connection.Open();
            verificationCode = Convert.ToString(cmd.ExecuteScalar());
            return verificationCode;
        }

        public void verifyUser(int personID, string verificationDate)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE Person SET verificationDate = @verificationDate  WHERE ID = @personID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@personID", SqlDbType.Int).Value = personID;
            cmd.Parameters.Add("@verificationDate", SqlDbType.Date).Value = verificationDate;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addPhoneNumber(int phoneNumber)
        {
            // Add phone number to database
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "EXEC sp_newPhone @phoneNumber";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@phoneNumber", SqlDbType.Int).Value = phoneNumber;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            //int phoneID = getPhoneID(phoneNumber);
            //return phoneID;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public int getPhoneID(int phoneNumber)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            SqlCommand cmd = new SqlCommand();
            string query = "SELECT ID FROM PhoneNumber WHERE phoneNumber = @phoneNumber";
            cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@phoneNumber", SqlDbType.Int).Value = phoneNumber;
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