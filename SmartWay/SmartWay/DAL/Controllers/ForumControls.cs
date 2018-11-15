using SmartWay.BL.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/*	
	FileName	=	ForumControls.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis and Brock Buttsworth
	Created September 2018
	Purpose of the File-
		To Handle communications between the BL and Database regarding Forum Post Actions
*/

namespace SmartWay.DAL.Controllers
{
	[DataObject(true)]
	public class ForumControls
	{
		//sp_NewForumTag
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addForumTag(string tempTagName)
		{
			// Add ForumTag to database
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


		//Link ForumTag to Forum Post
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addForumTagsToForumPost(List<ForumTag> tempTagsSelected, int forumID)
		{
			//Using the List we will Loop Through and Add each Tag in the DB to the new Forum Post 
			for (int i = 0; i < tempTagsSelected.Count; i++)
			{
				string tempTagName = tempTagsSelected[i].forumTagName;
				SqlConnection connection = new SqlConnection(getConnectionString());
				String query = "EXEC sp_LinkForumTag @tempTagName, @tempForumPostID, 2222";
				SqlCommand cmd = new SqlCommand(query, connection);
				cmd.Parameters.Add("@tempTagName", SqlDbType.VarChar, 30).Value = tempTagName;
				cmd.Parameters.Add("@tempForumPostID", SqlDbType.Int).Value = forumID;
				connection.Open();
				cmd.ExecuteNonQuery();
				connection.Close();
			}
		}

		/// <summary>
		/// Add New Forum Post Details to the Database
		/// </summary>
		/// <param name="tempPersonID"></param>
		/// <param name="tempTitle"></param>
		/// <param name="tempForumDescription"></param>
		/// <param name="tempFilePath"></param>
		/// <returns></returns>
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

		/// <summary>
		/// Save Forum Post Image to the Database
		/// </summary>
		/// <param name="tempFilePath"></param>
		/// <param name="tempUserID"></param>
		/// <param name="tempForumID"></param>
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addForumImage(string tempFilePath, int tempUserID, int tempForumID)
		{
			SqlConnection connection = new SqlConnection(getConnectionString());
			string query = "INSERT INTO ForumImage (filePath, userID, forumPostID) VALUES(@tempFilePath, @tempUserID, @tempForumID)";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempFilePath", SqlDbType.VarChar, 260).Value = tempFilePath;
			cmd.Parameters.Add("@tempUserID", SqlDbType.Int).Value = tempUserID;
			cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
		}

		/// <summary>
		/// Link a Forum Tag to a Database, If forum tag doesn't exists creates that also.
		/// </summary>
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void linkForumPostToTag(string tempTagName, int tempForumPostID)
		{
			// Add Forum Tag to database
			SqlConnection connection = new SqlConnection(getConnectionString());
			String query = "EXEC sp_LinkForumTag @tempTagName, @tempForumPostID, 2222";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempTagName", SqlDbType.VarChar, 30).Value = tempTagName;
			cmd.Parameters.Add("@tempForumPostID", SqlDbType.Int).Value = tempForumPostID;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
		}

		/// <summary>
		/// Get a list of all forum tags from a database.
		/// </summary>
		/// <returns></returns>
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

		/// <summary>
		/// Get Forum Tags that are related to a Forum Post by ID
		/// </summary>
		/// <param name="tempForumID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<ForumTag> getForumTagsbyForumID(int tempForumID)
		{
			List<ForumTag> tempFormTagList = new List<ForumTag>();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
			string query = "EXEC sp_GetLinkedForumTag @tempForumID";  //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
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

		/// <summary>
		/// Get all ForumPost Adds that are Active
		/// </summary>
		/// <returns></returns>
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

		/// <summary>
		/// Get Forum Post Details of a Forum Post by ID
		/// </summary>
		/// <param name="tempForumID"></param>
		/// <returns></returns>
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

		/// <summary>
		/// Get Forum Post image associated with a forum post by ID
		/// </summary>
		/// <param name="tempForumID"></param>
		/// <returns></returns>
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
			//If no Images are found references the defaultImage
			if (forumImages.Count < 1)
			{
				List<string> defaultImages = new List<string>();
				defaultImages.Add("../Images/DefaultImg/GenericForumImage.png");
				forumImages = defaultImages;
			}

			return forumImages;
		}

		/// <summary>
		/// Get Forum Post Thumbnail
		/// </summary>
		/// <param name="tempForumID"></param>
		/// <returns></returns>
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
		/// checkIfTagExists will be used to see if a tagname exists in database before adding another.
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

		/// <summary>
		/// Adds a Forum Reply to the Database linked to a Forum Post ID and User ID
		/// </summary>
		/// <param name="tempForumID"></param>
		/// <param name="tempReplyComment"></param>
		/// <param name="tempRepliersID"></param>
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addForumReply(int tempForumID, string tempReplyComment,  int tempRepliersID)
		{
			SqlConnection connection = new SqlConnection(getConnectionString());
			string query = "EXEC sp_NewForumReply  @tempForumPostID, @tempComment, @tempRepliersID";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempForumPostID", SqlDbType.Int).Value = tempForumID;
			cmd.Parameters.Add("@tempComment", SqlDbType.VarChar, 150).Value = tempReplyComment;
			cmd.Parameters.Add("@tempRepliersID", SqlDbType.Int).Value = tempRepliersID;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
		}

		/// <summary>
		/// Get a list of forum post Replies associated with a forum post by forum post ID
		/// </summary>
		/// <param name="tempForumID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<ForumReply> getForumRepliedListbyID(int tempForumID)
		{
			List<ForumReply> tempForumReplyList = new List<ForumReply>();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getConnectionString()); //getting connection string
			string query = "EXEC sp_GetForumRepliesByForumID @tempForumID";  //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				ForumReply tempForumReply = new ForumReply(
								(int)reader["ForumCommentID"],
								(int)reader["forumPostID"],
								reader["comment"].ToString(),
								(int)reader["repliersID"],
								reader["SWUsername"].ToString(),
								reader["filePath"].ToString()
								);
				tempForumReplyList.Add(tempForumReply);
			}
			connection.Close();
			return tempForumReplyList;
		}
	}


}