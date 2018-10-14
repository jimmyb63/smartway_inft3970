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

        public List<ForumThread> getForumPost([Control]string ID)
        {
            ForumControls FC = new ForumControls();
            List<ForumThread> forumPosts = new List<ForumThread>();
            string query = "";
            if (Request.QueryString["search"] != "" && Request.QueryString["search"] != null)
            {
                query = Request.QueryString["search"];
                string[] searchWordsArr = query.Split(null);
                //List<string> searchWordsList = keySearchWords(searchWordsArr);
                //forumPosts = AC.getAdvertisementsSearch(searchWordsList);
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

        public List<string> getForumImages(int forumID)
        {
            ForumControls FC = new ForumControls();
            List<string> forumImages = FC.getForumImages(forumID);
            return forumImages;
        }

        public string getSellerUsername(int sellerID)
        {
            UserControls UC = new UserControls();
            string email = UC.getUserEmail(sellerID);
            Person user = UC.getUserAccount(email);
            string username = user.userName;
            return username;
        }

        public string getSellerRegoDate(int sellerID)
        {
            UserControls UC = new UserControls();
            string date = (UC.getVerificationDate(sellerID)).ToString("dd/MM/yyyy");
            return date;
        }

        public string getSellerAvatar(int sellerID)
        {
            UserControls UC = new UserControls();
            string filepath = UC.getProfileImage(sellerID);
            return filepath;
        }

        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }

        protected void ContactSeller(object sender, EventArgs e)
        {
            Response.Redirect("PrivateMessage.aspx");
        }
    }
}