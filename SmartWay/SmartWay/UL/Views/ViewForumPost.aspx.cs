using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

/*	
	FileName	=	ViewForumPost.aspx.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created October 2018
	Purpose of the File-
		To Handle communications between the UL and BL regarding a User Viewing a Forum Post. 
		Will show PrivateMessages related to a PMChain and a form to be completed by the logged in User to add a reply.
*/
namespace SmartWay.UL.Views
{
	public partial class ViewForumPost : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string tempForumId = ""; 
			if (Request.QueryString["forumID"] != "" && Request.QueryString["forumID"] != null)
			{
				tempForumId = Request.QueryString["forumID"];
			}
			forumId.Value = tempForumId;
			//ForumControls FC = new ForumControls();
			//int id = Convert.ToInt32(forumId);
			//txtViewCount.Value = Convert.ToString(FC.getViewCount(id));
			if (Session["currentUser"] != null)
			{
				if (Session[tempForumId] == null)
				{
					//id = Convert.ToInt32(tempForumId);
					//int count = Convert.ToInt32(txtViewCount.Value);
					//AC.updateViewCount(id, (count + 1));
					//Session[tempForumId] = tempForumId;
				}
			}
		}

		/// <summary>
		/// Redirect User to a Form to be completed if they wish to report an Ad's content.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		public void ReportAd(object sender, EventArgs e)
		{
			int ad = Convert.ToInt32(forumId.Value);
			Person currentUser = (Person)Session["currentUser"];
			int userID = currentUser.userID;
			Response.Redirect("NewAddReviewRequest.aspx?userID=" + userID + "&adID=" + ad);
		}

		/// <summary>
		/// Get Forum Post Details via forum post id
		/// </summary>
		/// <param name="forumId"></param>
		/// <returns></returns>
		public List<ForumThread> getForumPost([Control]string forumId)
		{
			int currentID =Convert.ToInt32(forumId);
			ForumControls FC = new ForumControls();
			List<ForumThread> forumPost = new List<ForumThread>();
			forumPost = FC.getForumPost(currentID);
			return forumPost;
		}

		/// <summary>
		/// Get Forum Images related to a forum post ID
		/// </summary>
		/// <param name="forumID"></param>
		/// <returns></returns>
		public List<string> getForumImages(int forumID)
		{
			ForumControls FC = new ForumControls();
			List<string> forumImages = FC.getForumImages(forumID);
			return forumImages;
		}

		/// <summary>
		/// Get the username of a User
		/// </summary>
		/// <param name="userID"></param>
		/// <returns></returns>
		public string getPostersUsername(int userID)
		{
			UserControls UC = new UserControls();
			string email = UC.getUserEmail(userID);
			Person user = UC.getUserAccount(email);
			string username = user.userName;
			return username;
		}

		/// <summary>
		/// Get the Registration Date of a User
		/// </summary>
		/// <param name="userID"></param>
		/// <returns></returns>
		public string getPostersRegoDate(int userID)
		{
			UserControls UC = new UserControls();
			string date = (UC.getVerificationDate(userID)).ToString("dd/MM/yyyy");
			return date;
		}

		/// <summary>
		/// Get Image of the User that posted the forum post
		/// </summary>
		/// <param name="userID"></param>
		/// <returns></returns>
		public string getPostersAvatar(int userID)
		{
			UserControls UC = new UserControls();
			string filepath = UC.getProfileImage(userID);
			return filepath;
		}

		/// <summary>
		/// Redirects to PrivateMessage Screen
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void ContactSeller(object sender, EventArgs e)
		{
			Response.Redirect("PrivateMessage.aspx");
		}

		/// <summary>
		/// Gets the forum tags related to a forum post ID
		/// </summary>
		/// <returns></returns>
		public List<ForumTag> getForumTagsByForumID()
		{
			int forumID = Convert.ToInt32(forumId.Value);
			ForumControls FC = new ForumControls();
			List<ForumTag> currentForumTags = FC.getForumTagsbyForumID(forumID);
			return currentForumTags;
		}

		/// <summary>
		/// Gets the forum replies related to a forum post ID
		/// </summary>
		/// <returns></returns>
		public List<ForumReply> getForumRepliedListbyID()
		{
			int forumID = Convert.ToInt32(forumId.Value);
			ForumControls FC = new ForumControls();
			List<ForumReply> currentForumReplies = FC.getForumRepliedListbyID(forumID);
			return currentForumReplies;
		}

		/// <summary>
		/// Logged in User Adds a comment about a forum post
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void PostReplyComment(object sender, EventArgs e)
		{
			ForumControls FC = new ForumControls();
			int forumID = Convert.ToInt32(forumId.Value);
			Person currentUser = (Person)Session["currentUser"];
			int currentUserID = currentUser.userID;
			string currentComment = txtReplyMessage.Text;
			FC.addForumReply(forumID, currentComment, currentUserID);
			Response.Redirect("ViewForumPost.aspx?forumID=" + forumID);
		}
	}
}