using System;
using SmartWay.BL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.DAL.Controllers;
using System.Web.ModelBinding;


/*	
	FileName	=	ViewForumPostList.aspx.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created October 2018
	Purpose of the File-
		To Handle communications between the UL and BL regarding a User Viewing a Forum Post. 
		Will show summary of PrivateMessages related to the logged in user and grouped by the private message chain.
*/
namespace SmartWay.UL.Views
{
	public partial class ViewForumPostList : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			BindListView();
		}

		protected void onPageChange(object sender, PagePropertiesChangingEventArgs e)
		{
			//set current page startindex, max rows and rebind to false
			DataPagerForum.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

			//rebind List View
			BindListView();
		}
        /// <summary>
        /// Bind a list of Forum Posts
        /// </summary>
		void BindListView()
		{
			forumList.DataSource = getForumPosts();
			forumList.DataBind();
		}

        /// <summary>
        /// Get a list of Forum posts that are active.
        /// </summary>
        /// <returns></returns>
		public List<ForumThread> getForumPosts()
		{
			ForumControls FC = new ForumControls();
			List<ForumThread> forumPosts = new List<ForumThread>();
			string query = "";
			if (Request.QueryString["search"] != "" && Request.QueryString["search"] != null)
			{
				query = Request.QueryString["search"];
				string[] searchWordsArr = query.Split(null);
			}
			else
			{
				forumPosts = FC.getForumPosts();
			}
			List<ForumThread> tempForumPosts = new List<ForumThread>();
			for (int i = 0; i < forumPosts.Count; i++)
			{
				if (forumPosts[i].forumActive == true)
				{
					tempForumPosts.Add(forumPosts[i]);
				}
			}
			return tempForumPosts;
		}
        /// <summary>
        /// Get an Image of the ForumPost
        /// </summary>
        /// <param name="forumID"></param>
        /// <returns></returns>
		public string getForumThumbnail(int forumID)
		{
			ForumControls FC = new ForumControls();
			string filePath = FC.getForumThumbnail(forumID);
			return filePath;
		}



	}
}