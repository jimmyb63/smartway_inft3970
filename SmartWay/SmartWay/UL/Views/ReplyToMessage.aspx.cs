using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.BL.Models;

namespace SmartWay.UL.Views
{
    public partial class ReplyToMessage : System.Web.UI.Page
    {
        
        AdvertisementControls AC = new AdvertisementControls();
        UserControls UC = new UserControls();
        int privateMessageID = 1000; // for testing

        // PRIVATE MESSAGE:
        PrivateMsg tempPrivateMessage = new PrivateMsg();
        DateTime tempSentDate = new DateTime();

        // SENDER:
        Person tempSender = new Person();
        // need username and ID
        string tempSenderUsername;
        int tempSenderID;
        
        
        // RECIPIENT:
        Person tempRecipient = new Person();
        // need an ID
        int tempRecipientID;
        int tempRecipientID2;
        string tempRecipientUsername;
        

        // AD: 
        Advertisement tempAd = new Advertisement();
        // need a title
        string tempTitle;               
        int adID;
        int tempAddID2;

        // LOGGED ID:
        Person tempCurrent = new Person();
        int tempCurrentID;


        protected void Page_Load(object sender, EventArgs e)
        {
            string tempPmID = "";
            if (Request.QueryString["privateMessageID"] != "" && Request.QueryString["privateMessageID"] != null)
            {
                tempPmID = Request.QueryString["privateMessageID"];
                // adID.Value = adId;
                
                privateMessageID = Convert.ToInt32(tempPmID);
            }
            tempPrivateMessage = UC.getPrivateMessageByID(privateMessageID);
            //adID = tempPrivateMessage.pmAdID;
            tempSentDate = tempPrivateMessage.pmCreationDate;
            tempSenderID = tempPrivateMessage.pmSendersUserID;
            tempRecipientID = tempPrivateMessage.pmReceiverUserID;
            tempCurrent = (Person)Session["currentUser"];
            tempCurrentID = tempCurrent.userID;
            hfUserID.Value = tempCurrentID.ToString().Trim();
            adID = tempPrivateMessage.pmAdID;
            hfAdID.Value = adID.ToString().Trim();

            // HERE GOES NOTHING
            if (tempSenderID != tempCurrentID)
            {
                int switchID;
                switchID = tempRecipientID;
                tempRecipientID = tempSenderID;
                tempSenderID = switchID;
            }

            // DEALING WITH PEOPLE DATA
            tempRecipient = UC.getUserByID(tempRecipientID);
            tempSender = UC.getUserByID(tempSenderID);
            // getting usernames
            tempRecipientUsername = tempRecipient.userName;
            tempSenderUsername = tempSender.userName;
            // ad info
            tempAd = AC.getAd(adID);
            tempTitle = tempAd.advertisementTitle;
            // update labels
            lblAdTitle.Text = "<h5>Title: " + tempTitle + "</h5>";


        }

        public List<PrivateMsg> getPrivateMsgListofAd()
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            PrivateMsg PM = new PrivateMsg();
            int tempPrivateMessageID = Convert.ToInt32(hfAdID.Value);
            PM = UC.getPrivateMessageByID(tempPrivateMessageID);
            adID = PM.pmAdID;
            currentUser = (Person)Session["currentUser"];
            int tempSenderID2 = currentUser.userID;
            List<PrivateMsg> tempPrivateMsg = UC.getPrivateMessageListforUser(tempSenderID2);
            List<PrivateMsg> tempReturnList = new List<PrivateMsg>();
            for (var i = 0; i < tempPrivateMsg.Count; i++)
            {
                if (tempPrivateMsg[i].pmAdID == adID)
                {
                    tempReturnList.Add(tempPrivateMsg[i]);
                }
            };
            return tempReturnList;
        }

        public List<PrivateMsg> getRepliedPrivateMsgList()
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            List<PrivateMsg> tempPrivateMsg = getPrivateMsgListofAd();
            List<PrivateMsg> tempReturnList = new List<PrivateMsg>();
            for (var i = 0; i < tempPrivateMsg.Count; i++)
            {
                if (tempPrivateMsg[i].pmMessageReplied == true)
                {
                    tempReturnList.Add(tempPrivateMsg[i]);
                }
            };
            return tempReturnList;
        }

        public List<PrivateMsg> getNotRepliedPrivateMsgList()
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            List<PrivateMsg> tempPrivateMsg = getPrivateMsgListofAd();
            List<PrivateMsg> tempReturnList = new List<PrivateMsg>();
            for (var i = 0; i < tempPrivateMsg.Count; i++)
            {
                if (tempPrivateMsg[i].pmMessageReplied == false)
                {
                    tempReturnList.Add(tempPrivateMsg[i]);
                }
            };
            return tempReturnList;
        }

        public string getUsername(int tempUserID)
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            currentUser = UC.getUserByID(tempUserID);
            string returnUserName = currentUser.userName;
            return returnUserName;
        }

        public string setMessageStyle(int senderID)
        {
            tempCurrent = (Person)Session["currentUser"];
            tempCurrentID = tempCurrent.userID;
            if (senderID != tempCurrentID)
            {
                return "background-color: #FEEFB3; ";
            }
            else
            {
                return "background-color: #33b5e5; text-align: right; color: white;";
            }
            
        }

        public string messageFromStyle(int senderID)
        {
            tempCurrent = (Person)Session["currentUser"];
            tempCurrentID = tempCurrent.userID;
            string senderName = getUsername(senderID);
            if (senderID != tempCurrentID)
            {
                return "Message From: " + senderName;
            }
            else
            {
                return "Your Response ";
            }

        }

        protected void btnReply_Click(object sender, EventArgs e)
        {

            string tempMessage = txtMessage.Text;
            // saves to DB at the moment
            UC.savePrivateMessage(tempCurrentID, tempRecipientID, adID, tempMessage);
            Response.Redirect("MessageSentConfirmation.aspx");
        }
    }
}