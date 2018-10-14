using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class ForumThread
    {
        //Private Variables
        private int ID;
        private int postUserID;
        private string title;
        private string description;
        private string filepath;
        //private int imgID;
        private List<string> ForumTags;
        private DateTime creationDate;
        private bool active;

        public ForumThread()
        {
            ID = 0;
            postUserID = 0;
            title = "";
            description = "";
            filepath = "";
            //imgID = 0;
            creationDate= DateTime.Now;
            active = true;
        }

        //Creating a New ForumThread
        public ForumThread(int tempPostUserID, string tempTitle, string tempDescription, string tempFilepath)
        {
            postUserID = tempPostUserID;
            title = tempTitle;
            description = tempDescription;
            filepath = tempFilepath;
            creationDate = DateTime.Now;
            active = true;
        }

        //Creating a New ForumThread From Database
        public ForumThread(int tempID, int tempPostUserID, string tempTitle, string tempDescription, DateTime tempCreationDate, bool tempActive)
        {
            ID = tempID;
            postUserID = tempPostUserID;
            title = tempTitle;
            description = tempDescription;
            //imgID = tempImgID;
            creationDate = tempCreationDate;
            active = tempActive;
        }


        //Getter and Setter
        public int forumID
        {
            get
            {
                return ID;
            }
            set
            {
                ID = value;
            }
        }

        public int forumUserID
        {
            get
            {
                return postUserID;
            }
            set
            {
                postUserID = value;
            }
        }

        public string forumTitle
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }

        public string forumDescription
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public string forumFilepath
        {
            get
            {
                return filepath;
            }
            set
            {
                filepath = value;
            }
        }

        /*public int forumImgID
        {
            get
            {
                return imgID;
            }
            set
            {
                imgID = value;
            }
        }*/

        public DateTime forumCreationDate
        {
            get
            {
                return creationDate;
            }
            set
            {
                creationDate = value;
            }
        }

        public bool forumActive
        {
            get
            {
                return active;
            }
            set
            {
                active = value;
            }
        }

        public List<string> forumPostTags
        {
            get
            {
                return ForumTags;
            }
            set
            {
                ForumTags = value;
            }
        }

        public void addForumPostTags (string tempTag)
        {
            ForumTags.Add(tempTag);
        }

    }

    
}