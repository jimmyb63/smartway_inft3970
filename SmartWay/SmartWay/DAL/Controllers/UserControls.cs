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
        public void addUser(String fName, String lName, String emailAddress, String password, int phoneNumber)
        {
            // Add user to database
            // INSERT INTO tblCustomer VALUES()
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "INSERT into Person VALUES (@fName, @lName, @emailAddress, @password, @phoneNumber)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@fName", SqlDbType.VarChar, 60).Value = fName;
            cmd.Parameters.Add("@lName", SqlDbType.VarChar, 60).Value = lName;
            cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 100).Value = emailAddress;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 60).Value = password;
            cmd.Parameters.Add("@phoneNumber", SqlDbType.SmallInt).Value = phoneNumber;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["JapallumConnectionString"].ConnectionString;
        }
    }
}