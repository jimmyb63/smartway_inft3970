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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public int newRegistration(string fName, string lName, string uName, string DOB, string emailAddress, string password, int phoneNumber, string uNum, string sNum, string sName, string city, int pCode, int stateID, string country, string verificationCode)
        {
            // Add user to database
            // INSERT INTO tblCustomer VALUES()
            SqlConnection connection = new SqlConnection(getconnectionString());
            string procedure = "sp_NewRegistration";
            SqlCommand cmd = new SqlCommand(procedure, connection);
            //string query = "EXEC sp_NewRegistration @fName, @lName, @emailAddress, @password, @phoneNumber, @uNum, @sNum, @sName, @city, @pCode, @state, @country, @verificationCode";
            //SqlCommand cmd = new SqlCommand(query, connection);
            //cmd.Parameters.Add("@returnPersonID", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param;
            param = cmd.Parameters.Add("@tempFirstName", SqlDbType.VarChar, 20);
            param.Value = fName;
            param = cmd.Parameters.Add("@tempLastName", SqlDbType.VarChar, 20);
            param.Value = lName;
            param = cmd.Parameters.Add("@tempUsername", SqlDbType.VarChar, 30);
            param.Value = uName;
            param = cmd.Parameters.Add("@tempDOB", SqlDbType.Date);
            param.Value = DOB;
            param = cmd.Parameters.Add("@tempEmail", SqlDbType.VarChar, 320);
            param.Value = emailAddress;
            param = cmd.Parameters.Add("@tempPassword", SqlDbType.VarChar, 30);
            param.Value = password;
            param = cmd.Parameters.Add("@tempPhone", SqlDbType.Int);
            param.Value = phoneNumber;
            param = cmd.Parameters.Add("@tempUnitNumber", SqlDbType.VarChar, 4);
            param.Value = uNum;
            param = cmd.Parameters.Add("@tempStreetAddress", SqlDbType.VarChar, 20);
            param.Value = sNum;
            param = cmd.Parameters.Add("@tempStreetName", SqlDbType.VarChar, 35);
            param.Value = sName;
            param = cmd.Parameters.Add("@tempCity", SqlDbType.VarChar, 50);
            param.Value = city;
            param = cmd.Parameters.Add("@tempPostCode", SqlDbType.Int);
            param.Value = pCode;
            param = cmd.Parameters.Add("@tempStateName", SqlDbType.Int);
            param.Value = stateID;
            param = cmd.Parameters.Add("@tempCountry", SqlDbType.VarChar, 30);
            param.Value = country;
            param = cmd.Parameters.Add("@tempVerificationCode", SqlDbType.VarChar, 8);
            param.Value = verificationCode;
            param = cmd.Parameters.Add("@returnPersonID", SqlDbType.Int);
            param.Direction = ParameterDirection.Output;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            int personID = (int)param.Value;
            return personID;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
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
        public void addProfileImage(string filePath, int userID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "INSERT INTO SavedImage (filePath, userID) VALUES(@filePath, @userID)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@filePath", SqlDbType.VarChar, 260).Value = filePath;
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public string getProfileImage(int userID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT filePath FROM SavedImage WHERE userID = @userID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            connection.Open();
            string filePath = cmd.ExecuteScalar().ToString();
            connection.Close();
            return filePath;
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public BL.Models.User getUserAccount(string email)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            SqlCommand cmd = new SqlCommand();
            string query = "SELECT ID, firstName, lastName, email, phoneNumberId, addressId, SWPassword FROM Person WHERE email = @email";
            cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 320).Value = email;
            connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            BL.Models.User tempUser = new BL.Models.User();
            while (dr.Read())
            {
                tempUser.userID = Convert.ToInt32(dr["ID"]);
                tempUser.userfName = dr["firstName"].ToString();
                tempUser.userlName = dr["lastName"].ToString();
                tempUser.userEmail = dr["email"].ToString();
                tempUser.userPhoneID = Convert.ToInt32(dr["phoneNumberId"]);
                tempUser.userAddressID = Convert.ToInt32(dr["addressId"]);
                tempUser.userPassword = dr["SWPassword"].ToString();
            }
            return tempUser;
        }

        public string getconnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
        }
    }
}