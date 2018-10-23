using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class MyMessages : System.Web.UI.Page
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
            if (Session["currentUser"] == null)
            {
                Session["returnURL"] = "MyMessages.aspx";
                Response.Redirect("Login.aspx");
            }
        }

        public List<PrivateMsg> getPrivateMsgList()
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            currentUser = (Person)Session["currentUser"];
            int tempSenderID2 = currentUser.userID;
            //tempRecipientID2 = 1003;
            //tempAddID2 = 1003;
            List<PrivateMsg> tempPrivateMsg = UC.getPrivateMessageListforUser(tempSenderID2);
            return tempPrivateMsg;
        }

        public List<PrivateMsg> getRepliedPrivateMsgList()
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            List<PrivateMsg> tempPrivateMsg = getPrivateMsgList();
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
            List<PrivateMsg> tempPrivateMsg = getPrivateMsgList();
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

        public string getAdTitle(int tempAdID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            Advertisement currentAd = new Advertisement();
            currentAd = AC.getAd(tempAdID);
            string returnAddTitle = currentAd.advertisementTitle;
            return returnAddTitle;
        }

        public string getUsername(int tempUserID)
        {
            UserControls UC = new UserControls();
            Person currentUser = new Person();
            currentUser = UC.getUserByID(tempUserID);
            string returnUserName = currentUser.userName;
            return returnUserName;
        }
    }
}