using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class AdminViewForumPostDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        //public void DeactivateForumPost(object sender, EventArgs e)
        //{
        //    int ID = Convert.ToInt32(forumID.Value);
        //    ForumControls FC = new ForumControls();
        //    List<ForumThread> post = FC.getForumPost(ID);
        //    post[0].forumActive = false;
        //    FC.;
        //    Response.Redirect("AdminReviewForumPosts.aspx");
        //}

        /// <summary>
        /// Populates a list of forum posts
        /// </summary>
        /// <returns>List of ForumThread objects</returns>
        public List<ForumThread> GetForumPost()
        {
            int id = Convert.ToInt32(Request.QueryString["forumID"]);
            ForumControls fC = new ForumControls();
            List<ForumThread> post = fC.getForumPost(id);
            return post;
        }

        /// <summary>
        /// Retrieves the filepath's of images that are linked to specific forum post
        /// </summary>
        /// <param name="forumID"></param>
        /// <returns>List of String objects</returns>
        public List<string> getForumImages(int forumID)
        {
            ForumControls AC = new ForumControls();
            List<string> forumImages = AC.getForumImages(forumID);
            return forumImages;
        }
    }
}