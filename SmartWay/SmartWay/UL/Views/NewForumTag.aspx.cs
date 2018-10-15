using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.DAL.Controllers;
using SmartWay.BL.Models;

namespace SmartWay.UL.Views
{
    public partial class NewForumTag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<ForumTag> getForumTags()
        {
            ForumControls FC = new ForumControls();
            List<ForumTag> tempTagList = FC.getForumTags();
            return tempTagList;
        }


        public List<ForumTag> getForumTagsColumn1()
        {
            int listToAddTo = 1;
            List<ForumTag> tempTagList = getForumTags();
            List<ForumTag> tempTagListColumn1 = new List<ForumTag>();
            List<ForumTag> tempTagListColumn2 = new List<ForumTag>();
            List<ForumTag> tempTagListColumn3 = new List<ForumTag>();
            for (var i = 0; i < tempTagList.Count; i++)
            {
                if (listToAddTo == 1)
                {
                    tempTagListColumn1.Add(tempTagList[i]);
                    listToAddTo = 2;
                }
                else if (listToAddTo == 2)
                {
                    tempTagListColumn2.Add(tempTagList[i]);
                    listToAddTo = 3;
                }
                else
                {
                    tempTagListColumn3.Add(tempTagList[i]);
                    listToAddTo = 1;
                }
            }
            return tempTagListColumn1;
        }

        public List<ForumTag> getForumTagsColumn2()
        {
            int listToAddTo = 1;
            List<ForumTag> tempTagList = getForumTags();
            List<ForumTag> tempTagListColumn1 = new List<ForumTag>();
            List<ForumTag> tempTagListColumn2 = new List<ForumTag>();
            List<ForumTag> tempTagListColumn3 = new List<ForumTag>();
            for (var i = 0; i < tempTagList.Count; i++)
            {
                if (listToAddTo == 1)
                {
                    tempTagListColumn1.Add(tempTagList[i]);
                    listToAddTo = 2;
                }
                else if (listToAddTo == 2)
                {
                    tempTagListColumn2.Add(tempTagList[i]);
                    listToAddTo = 3;
                }
                else 
                {
                    tempTagListColumn3.Add(tempTagList[i]);
                    listToAddTo = 1;
                }
            }
            return tempTagListColumn2;
        }

        public List<ForumTag> getForumTagsColumn3()
        {
            int listToAddTo = 1;
            List<ForumTag> tempTagList = getForumTags();
            List<ForumTag> tempTagListColumn1 = new List<ForumTag>();
            List<ForumTag> tempTagListColumn2 = new List<ForumTag>();
            List<ForumTag> tempTagListColumn3 = new List<ForumTag>();
            for (var i = 0; i < tempTagList.Count; i++)
            {
                if (listToAddTo == 1)
                {
                    tempTagListColumn1.Add(tempTagList[i]);
                    listToAddTo = 2;
                }
                else if (listToAddTo == 2)
                {
                    tempTagListColumn2.Add(tempTagList[i]);
                    listToAddTo = 3;
                }
                else
                {
                    tempTagListColumn3.Add(tempTagList[i]);
                    listToAddTo = 1;
                }
            }
            return tempTagListColumn3;
        }

        protected void btnNewTagSubmit_Click(object sender, EventArgs e)
        {
            ForumControls FC = new ForumControls();
            string tempTagName = txbNewTag.Text.Trim();
            //Check if tag exists
            int checkValue = FC.checkIfTagExists(tempTagName);
            if (checkValue == 1)
            //IF so update Label
            {
                lblNewTagVal.Text = "This Tag Exists";
            }
            //If not Add to DB
            else
            {
                FC.addForumTag(tempTagName);
                //Reload Page
                Response.Redirect("NewForumTag.aspx");
            }

        }

        protected void btnReturnToForumPost_Click(object sender, EventArgs e)
        {
            //Redirect To PostForumThread.aspx
            Response.Redirect("PostForumThread.aspx");
        }
    }
}