using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class PrivateMsg
    {
        //Private Variables
        private int ID;
        private int sendersUserID { get; set; }
        private int receiverUserID { get; set; }
        private int addID { get; set; }
        private int forumID { get; set; }
        private string messageDetails { get; set; }
        private int lastPrivateMessageID;
        private bool messageRead { get; set; }
        private bool messageReplied { get; set; }
        private DateTime creationDate { get; set; }
        private bool active { get; set; }


        //Constructors
        public PrivateMsg()
        {
            ID = 0;
            sendersUserID = 0;
            receiverUserID = 0;
            addID = 0;
            forumID = 0;
            messageDetails = "";
            lastPrivateMessageID = 0;
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for a New Message
        public PrivateMsg(int tempSendersUserID, int tempReceiverUserID, string tempMessageDetails)
        {
            sendersUserID = tempSendersUserID;
            receiverUserID = tempReceiverUserID;
            messageDetails = tempMessageDetails;
            lastPrivateMessageID = 0;
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for when reading from DB
        public PrivateMsg(int tempID, int tempSendersUserID, int tempReceiverUserID, int tempAddID, int tempForumID,
                string tempMessageDetails, int tempLastPrivateMessageID, bool tempMessageRead, bool tempMessageReplied, DateTime tempCreationDate, bool tempActive)
        {
            ID = tempID;
            sendersUserID = tempSendersUserID;
            receiverUserID = tempReceiverUserID;
            addID = tempAddID;
            forumID = tempForumID;
            messageDetails = tempMessageDetails;
            lastPrivateMessageID = tempLastPrivateMessageID;
            messageRead = tempMessageRead;
            messageReplied = tempMessageReplied;
            creationDate = tempCreationDate;
            active = tempActive;
        }



        //Getter and Setters
        public int pmID
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

        public int pmSendersUserID
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


        public int pmReceiverUserID
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

        public int pmAdID
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

        public int pmForumID
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

        public string pmMessageDetails
        {
            get
            {
                return messageDetails;
            }
            set
            {
                messageDetails = value;
            }
        }



        public bool pmMessageRead
        {
            get
            {
                return messageRead;
            }
            set
            {
                messageRead = value;
            }
        }

        public bool pmMessageReplied
        {
            get
            {
                return messageReplied;
            }
            set
            {
                messageReplied = value;
            }
        }

        public DateTime pmCreationDate
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

        public bool pmActive
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


        public int pmLastPrivateMessageID
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

    }
}