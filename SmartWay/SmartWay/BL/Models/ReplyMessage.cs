using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class ReplyMessage
    {
        //Private Variables
        private int ID;
        private int privateMessageID;
        private string messageDetails;
        private bool messageRead;
        private bool messageReplied;
        private DateTime creationDate;
        private bool active;


        //Constructors
        public ReplyMessage()
        {
            ID = 0;
            privateMessageID = 0;
            messageDetails = "";
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for a New Message
        public ReplyMessage(int tempPrivateMessageID, string tempMessageDetails)
        {
            privateMessageID = tempPrivateMessageID;
            messageDetails = tempMessageDetails;
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for when reading from DB
        public ReplyMessage(int tempID, int tempPrivateMessageID, string tempMessageDetails, bool tempMessageRead, bool tempMessageReplied, DateTime tempCreationDate, bool tempActive)
        {
            ID = tempID;
            privateMessageID = tempPrivateMessageID;
            messageDetails = tempMessageDetails;
            messageRead = tempMessageRead;
            messageReplied = tempMessageReplied;
            creationDate = tempCreationDate;
            active = tempActive;
        }



        //Getter and Setters
        public int rmID
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

        public int rmPrivateMessageID
        {
            get
            {
                return privateMessageID;
            }
            set
            {
                privateMessageID = value;
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

    }
}