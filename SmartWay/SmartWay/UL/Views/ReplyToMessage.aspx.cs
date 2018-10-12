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
        string tempRecipientUsername;
               

        // AD: 
        Advertisement tempAd = new Advertisement();
        // need a title
        string tempTitle;               
        int adID;

        // LOGGED ID:
        Person tempCurrent = new Person();
        int tempCurrentID;


        protected void Page_Load(object sender, EventArgs e)
        {
            
            tempPrivateMessage = UC.getPrivateMessageByID(privateMessageID);
            adID = tempPrivateMessage.pmAdID;
            tempSentDate = tempPrivateMessage.pmCreationDate;
            tempSenderID = tempPrivateMessage.pmSendersUserID;
            tempRecipientID = tempPrivateMessage.pmReceiverUserID;
            //tempCurrent = (Person)Session["currentUser"];
            //tempCurrentID = tempCurrent.userID;
            tempCurrentID = 1000;



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
            lblSender.Text = "From: " + tempRecipientUsername;
            lblAdTitle.Text = "Title: " + tempTitle;
            lblSentDate.Text = "Sent: " + tempSentDate.ToString();
            
        }
    }
}