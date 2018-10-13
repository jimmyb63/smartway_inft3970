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
    public class ForumControls
    {
        //sp_NewForumTag
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addForumTag(string tempTagName)
        {
            // Add address to database
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "EXEC sp_NewForumTag @tagName, 2222";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tagName", SqlDbType.VarChar, 30).Value = tempTagName;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            //int addressID = getAddressID(uNum, sNum, sName, pCode);
            //return addressID;
        }


        //sp_NewForumPost
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addForumPost(int tempPersonID, string tempTitle, string tempForumDescription, string tempFilePath)
        {
            // Add address to database
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "EXEC sp_NewForumPost @tempPersonID, @tempTitle, @tempForumDescription, @tempFilePath, 2222";
            SqlCommand cmd = new SqlCommand(query, connection);

            cmd.Parameters.Add("@tempPersonID", SqlDbType.Int).Value = tempPersonID;
            cmd.Parameters.Add("@tempTitle", SqlDbType.VarChar, 30).Value = tempTitle;
            cmd.Parameters.Add("@tempForumDescription", SqlDbType.VarChar, 500).Value = tempForumDescription;
            cmd.Parameters.Add("@tempFilePath", SqlDbType.VarChar, 260).Value = tempFilePath;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            //int addressID = getAddressID(uNum, sNum, sName, pCode);
            //return addressID;
        }

        //sp_LinkForumTag
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void linkForumPostToTag(string tempTagName, int tempForumPostID)
        {
            // Add address to database
            SqlConnection connection = new SqlConnection(getConnectionString());
            String query = "EXEC sp_LinkForumTag @tempTagName, @tempForumPostID, 2222";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tempTagName", SqlDbType.VarChar, 30).Value = tempTagName;
            cmd.Parameters.Add("@tempForumPostID", SqlDbType.Int).Value = tempForumPostID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            //int addressID = getAddressID(uNum, sNum, sName, pCode);
            //return addressID;
        }


        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
        }
    }


}