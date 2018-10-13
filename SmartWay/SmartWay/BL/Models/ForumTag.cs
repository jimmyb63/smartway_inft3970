using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class ForumTag
    {
        private int ID;
        private string tagName;

        public ForumTag()
        {
            ID = 0;
            tagName = "";
        }

        public ForumTag(int tempID, string tempTagname)
        {
            ID = tempID;
            tagName = tempTagname;
        }

        public int forumTagID
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

        public string forumTagName
        {
            get
            {
                return tagName;
            }
            set
            {
                tagName = value;
            }
        }

    }
}