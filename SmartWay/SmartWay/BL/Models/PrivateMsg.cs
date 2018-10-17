using SmartWay.DAL.Controllers;
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
        private int privateMessageChainID;
        private int sendersUserID;
        private int receiverUserID;
        private int addID;
        //private int forumID;
        private string messageDetails;
        private bool messageRead;
        private bool messageReplied;
        private DateTime creationDate;
        private bool active;


        //Constructors
        public PrivateMsg()
        {
            ID = 0;
            sendersUserID = 0;
            receiverUserID = 0;
            //addID = 0;
            //forumID = 0;
            messageDetails = "";
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
            messageRead = false;
            messageReplied = false;
            active = true;
        }

        //Constructor for when reading from DB
        public PrivateMsg(int tempID, int tempPrivateMessageChainID, int tempSendersUserID, int tempReceiverUserID,
                string tempMessageDetails, bool tempMessageRead, bool tempMessageReplied, DateTime tempCreationDate, bool tempActive)
        {
            ID = tempID;
            privateMessageChainID = tempPrivateMessageChainID;
            sendersUserID = tempSendersUserID;
            receiverUserID = tempReceiverUserID;
            //addID = tempAddID;
            messageDetails = tempMessageDetails;
            messageRead = tempMessageRead;
            messageReplied = tempMessageReplied;
            creationDate = tempCreationDate;
            active = tempActive;
            addID = getAddIDPrivateMessageChain(tempPrivateMessageChainID);
        }

        //Action Methods

        public int getAddIDPrivateMessageChain(int tempPrivateMessageChainID)
        {
            int returnAdID = 0;
            UserControls UC = new UserControls();
            returnAdID = UC.getAddIDPrivateMessageChain(tempPrivateMessageChainID);
            return returnAdID;
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

        public int pmPrivateMessageChainID
        {
            get
            {
                return privateMessageChainID;
            }
            set
            {
                privateMessageChainID = value;
            }
        }

        public int pmSendersUserID
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


        public int pmReceiverUserID
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

        public int pmAdID
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

        /*public int pmForumID
        {
            get
            {
                return ID;
            }
            set
            {
                ID = value;
            }
        }*/

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