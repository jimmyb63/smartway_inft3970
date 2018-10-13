﻿using SmartWay.BL.Models;
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
                                        (int)reader["imageID"],
                                        (DateTime)reader["creationDate"],
                                        (bool)reader["active"]);
                tempForumList.Add(tempForumPost);
            }
            connection.Close();
            return tempForumList;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public string getForumThumbnail(int forumID)
        {
            SqlConnection connection = new SqlConnection(getConnectionString());
            string query = "SELECT imageID FROM ForumPost WHERE ID = @forumID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@forumID", SqlDbType.Int).Value = forumID;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            int tempImgID = 0;
            while (reader.Read())
            {
                int tempImgID2 = (int)reader["imageID"];
                tempImgID= tempImgID2;
            }
            connection.Close();
            
            query = "SELECT filePath FROM ForumImage WHERE ID = @tempImgID";
            cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tempImgID", SqlDbType.Int).Value = tempImgID;
            connection.Open();
            string filePath = cmd.ExecuteScalar().ToString();
            connection.Close();
            return filePath;
        }

        public string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
        }
    }


}