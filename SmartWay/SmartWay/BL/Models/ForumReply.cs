using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class ForumReply
    {
        int ID;
        int forumPostID;
        string comment;
        int repliersID;
        string repliersName;
        string repliersProfileImageFilePath;
        DateTime creationDate;
        bool active;

        public ForumReply()
        {
            ID = 0;
            forumPostID = 0;
            comment = "";
            repliersID = 0;
            creationDate = DateTime.Now;
            active = true;
        }

        //Creating a New ForumReply
        public ForumReply(int tempforumPostID, string tempComment, int tempRepliersID)
        {
            forumPostID = tempforumPostID;
            comment = tempComment;
            repliersID = tempRepliersID;
            creationDate = DateTime.Now;
            active = true;
        }


        //Creating a New ForumReply From Database
        public ForumReply(int tempID, int tempforumPostID, string tempComment, int tempRepliersID, string tempRepliersName, string tempRepliersProfileImageFilePath)
        {
            ID = tempID;
            forumPostID = tempforumPostID;
            comment = tempComment;
            repliersID = tempRepliersID;
            repliersName = tempRepliersName;
            if (tempRepliersProfileImageFilePath == "")
            {
                repliersProfileImageFilePath = "../Images/DefaultImg/GenericProfileImage.png";
            }
            else { 
                repliersProfileImageFilePath = tempRepliersProfileImageFilePath;
            }
            creationDate = DateTime.Now;
            active = true;
        }
        //Getter and Setters
        public int forumReplyID
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

        public int forumReplyForumPostID
        {
            get
            {
                return forumPostID;
            }
            set
            {
                forumPostID = value;
            }
        }

        public string forumReplyComment
        {
            get
            {
                return comment;
            }
            set
            {
                comment = value;
            }
        }


        public int forumReplyRepliersID
        {
            get
            {
                return repliersID;
            }
            set
            {
                repliersID = value;
            }
        }

        public string forumReplyRepliersName
        {
            get
            {
                return repliersName;
            }
            set
            {
                repliersName = value;
            }
        }

        public string forumReplyRepliersImgFilePath
        {
            get
            {
                return repliersProfileImageFilePath;
            }
            set
            {
                repliersProfileImageFilePath = value;
            }
        }

        public DateTime forumReplyCreationDate
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

        public bool forumReplyActive
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

    }
}