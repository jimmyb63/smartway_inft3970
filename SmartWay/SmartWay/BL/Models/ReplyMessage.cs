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
        private int sendersUserID;
        private int receiverUserID;
        private int addID;
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
            sendersUserID = 0;
            receiverUserID = 0;
            addID = 0;
            privateMessageID = 0;
            messageDetails = "";
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for a New Reply Message
        public ReplyMessage(int tempSendersUserID, int tempReceiverUserID, int tempAddID, int tempPrivateMessageID, string tempMessageDetails)
        {
            sendersUserID = tempSendersUserID;
            receiverUserID = tempReceiverUserID;
            addID = tempAddID;
            privateMessageID = tempPrivateMessageID;
            messageDetails = tempMessageDetails;
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for when reading from DB
        public ReplyMessage(int tempID, int tempSendersUserID, int tempReceiverUserID, int tempAddID, int tempPrivateMessageID, string tempMessageDetails, bool tempMessageRead, bool tempMessageReplied, DateTime tempCreationDate, bool tempActive)
        {
            ID = tempID;
            sendersUserID = tempSendersUserID;
            receiverUserID = tempReceiverUserID;
            addID = tempAddID;
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

        public int rmSendersUserID
        {
            get
            {
                return sendersUserID;
            }
            set
            {
                sendersUserID = value;
            }
        }

        public int rmReceiverUserID
        {
            get
            {
                return receiverUserID;
            }
            set
            {
                receiverUserID = value;
            }
        }

        public int rmAddID
        {
            get
            {
                return addID;
            }
            set
            {
                addID = value;
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

        public string rmMessageDetails
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



        public bool rmMessageRead
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

        public bool rmMessageReplied
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

        public DateTime rmCreationDate
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

        public bool rmActive
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