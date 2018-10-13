using System;
using SmartWay.BL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.DAL.Controllers;
using System.Web.ModelBinding;

namespace SmartWay.UL.Views
{
    public partial class ViewForumPostList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<ForumThread> getForumPosts([Control]string ID)
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

        public string getAdThumbnail(int forumID)
        {
            ForumControls FC = new ForumControls();
            string filePath = FC.getForumThumbnail(forumID);
            return filePath;
        }



    }
}