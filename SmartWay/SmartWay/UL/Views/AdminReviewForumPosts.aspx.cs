using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class AdminReviewForumPosts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }


        /// <summary>
        /// Populates a list of forum posts
        /// </summary>
        /// <returns>List of ForumThread objects</returns>
        public List<ForumThread> getForumPosts()
        {
            ForumControls FC = new ForumControls();
            List<ForumThread> tempPosts = FC.getForumPosts();
            List<ForumThread> posts = new List<ForumThread>();
            for (int i = 0; i < tempPosts.Count; i++)
            {
                if (tempPosts[i].forumActive == true)
                {
                    posts.Add(tempPosts[i]);
                }
            }
            return posts;
        }

        /// <summary>
        /// Redirects users to a forum post details page
        /// </summary>
        public void SearchResult_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ForumPostDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                List<ForumThread> posts = getForumPosts();
                ForumThread post = posts[index];
                Session["selectedForumPost"] = post;
                Response.Redirect("AdminViewForumPostDetail.aspx?forumID=" + posts[index].forumID);
            }
        }
    }
}