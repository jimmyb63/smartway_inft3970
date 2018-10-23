using SmartWay.BL.Models;
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
        /*[DataObjectMethod(DataObjectMethodType.Insert)]
        public int addForumPost(int tempPersonID, string tempTitle, string tempForumDescription, string tempFilePath)
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
            int addressID = getAddressID(uNum, sNum, sName, pCode);
            return addressID;
        }*/

        [DataObjectMethod(DataObjectMethodType.Select)]
        public int addForumPost(int tempPersonID, string tempTitle, string tempForumDescription, string tempFilePath)
        {
            SqlConnection connection = new SqlConnection(getConnectionString());
            string procedure = "sp_NewForumPost";
            SqlCommand cmd = new SqlCommand(procedure, connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param;
            param = cmd.Parameters.Add("@tempPersonID", SqlDbType.Int);
            param.Value = tempPersonID;
            param = cmd.Parameters.Add("@tempTitle", SqlDbType.VarChar, 50);
            param.Value = tempTitle;
            param = cmd.Parameters.Add("@tempForumDescription", SqlDbType.VarChar, 500);
            param.Value = tempForumDescription;
            param = cmd.Parameters.Add("@tempFilePath", SqlDbType.VarChar, 260);
            param.Value = tempFilePath;
            param = cmd.Parameters.Add("@returnForumPostID", SqlDbType.Int);
            param.Direction = ParameterDirection.Output;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            int forumID = (int)param.Value;
            return forumID;
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ForumTag> getForumTags()
        {
            
            List<ForumTag> tempFormTagList = new List<ForumTag>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
            string query = "SELECT * FROM ForumTag";  //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ForumTag tempForumTag = new ForumTag(
                                (int)reader["ID"],
                                reader["tagName"].ToString());
                tempFormTagList.Add(tempForumTag);
            }
            connection.Close();
            return tempFormTagList;
        }

        //getForumPosts
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ForumThread> getForumPosts()
        {

            List<ForumThread> tempForumList = new List<ForumThread>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
            string query = "SELECT * FROM ForumPost";  //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ForumThread tempForumPost = new ForumThread(
                                (int)reader["ID"],
                                (int)reader["personID"],
                                        reader["title"].ToString(),
                                        reader["forumDescription"].ToString(),
                                        //(int)reader["imageID"],
                                        (DateTime)reader["creationDate"],
                                        (bool)reader["active"]);
                tempForumList.Add(tempForumPost);
            }
            connection.Close();
            return tempForumList;
        }

        //getForumPost
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ForumThread> getForumPost(int tempForumID)
        {

            List<ForumThread> tempForumList = new List<ForumThread>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
            string query = "SELECT * FROM ForumPost WHERE ID= @tempForumID";  //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ForumThread tempForumPost = new ForumThread(
                                (int)reader["ID"],
                                (int)reader["personID"],
                                        reader["title"].ToString(),
                                        reader["forumDescription"].ToString(),
                                        //(int)reader["imageID"],
                                        (DateTime)reader["creationDate"],
                                        (bool)reader["active"]);
                tempForumList.Add(tempForumPost);
            }
            connection.Close();
            return tempForumList;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<string> getForumImages(int tempForumID)
        {
            List<string> forumImages = new List<string>();
            SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
            string query = "SELECT filePath FROM ForumImage WHERE forumPostID = @tempForumID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                string adImage = reader["filePath"].ToString();
                forumImages.Add(adImage);
            }
            connection.Close();
            if (forumImages.Count < 1)
            {
                List<string> defaultImages = new List<string>();
                defaultImages.Add("../Images/DefaultImg/GenericForumImage.png");
                forumImages = defaultImages;
            }

            return forumImages;
        }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public string getForumThumbnail(int tempForumID)
        {
            List<string> tempImageList = new List<string>();
            tempImageList = getForumImages(tempForumID);
            string filePath = tempImageList.ElementAt(0);
            return filePath;
        }

        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
        }


        /// <summary>
        /// checkIfTagExists willl be used to see if a tagname exists in database before adding another.
        /// </summary>
        /// <param name="tempTagName"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public int checkIfTagExists (string tempTagName)
        {
            int returnValue = 0;
            List<ForumTag> tempFormTagList = new List<ForumTag>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
            string query = "SELECT * FROM ForumTag WHERE tagName LIKE @tempTagName";  //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tempTagName", SqlDbType.VarChar, 30).Value = tempTagName;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ForumTag tempForumTag = new ForumTag(
                                (int)reader["ID"],
                                reader["tagName"].ToString());
                tempFormTagList.Add(tempForumTag);
            }
            connection.Close();
            if (tempFormTagList.Count() > 0) //As in there were matches
            {
                returnValue = 1;
            }
            return returnValue;
        }
    }


}