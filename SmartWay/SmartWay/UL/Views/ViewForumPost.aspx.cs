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

        public void ReportAd(object sender, EventArgs e)
        {
            int ad = Convert.ToInt32(forumId.Value);
            Person currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;
            Response.Redirect("NewAddReviewRequest.aspx?userID=" + userID + "&adID=" + ad);
        }

        public List<ForumThread> getForumPost([Control]string forumId)
        {
            int currentID =Convert.ToInt32(forumId);
            ForumControls FC = new ForumControls();
            List<ForumThread> forumPost = new List<ForumThread>();
            forumPost = FC.getForumPost(currentID);
            return forumPost;
        }

        public List<string> getForumImages(int forumID)
        {
            ForumControls FC = new ForumControls();
            List<string> forumImages = FC.getForumImages(forumID);
            return forumImages;
        }

        public string getPostersUsername(int userID)
        {
            UserControls UC = new UserControls();
            string email = UC.getUserEmail(userID);
            Person user = UC.getUserAccount(email);
            string username = user.userName;
            return username;
        }

        public string getPostersRegoDate(int userID)
        {
            UserControls UC = new UserControls();
            string date = (UC.getVerificationDate(userID)).ToString("dd/MM/yyyy");
            return date;
        }

        public string getPostersAvatar(int userID)
        {
            UserControls UC = new UserControls();
            string filepath = UC.getProfileImage(userID);
            return filepath;
        }

        protected void ContactSeller(object sender, EventArgs e)
        {
            Response.Redirect("PrivateMessage.aspx");
        }


        public List<ForumTag> getForumTagsByForumID()
        {
            int forumID = Convert.ToInt32(forumId.Value);
            ForumControls FC = new ForumControls();
            List<ForumTag> currentForumTags = FC.getForumTagsbyForumID(forumID);
            return currentForumTags;
        }

        public List<ForumReply> getForumRepliedListbyID()
        {
            int forumID = Convert.ToInt32(forumId.Value);
            ForumControls FC = new ForumControls();
            List<ForumReply> currentForumReplies = FC.getForumRepliedListbyID(forumID);
            return currentForumReplies;
        }

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