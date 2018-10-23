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
    public partial class PrivateMessage : System.Web.UI.Page
    {
        // SENDER - PERSON INTERESTED/MAKING AN OFFER/CONTACTING SELLER
        // RECIPIENT - PERSON THAT WILL RECEIVE THE MESSAGE (SELLER OF THE SELECTED GOODS/SERVICES)

        // We need to pull adID from database in order for this to work.
        int adID = 0;               
        
        AdvertisementControls AC = new AdvertisementControls();
        UserControls UC = new UserControls();

        // Variables for private message: 
        // Sender, Recipient, Title, Ad Object, Message Text, SenderID
        Person tempSender = new Person(); // grabbing from session
        Person tempRecipient = new Person(); // recipient is a person who receives - person who posted the ad
        int tempSenderID;
        string tempTitle;
        string tempSellerUsername;
        string tempAdReference;
        int tempRecipientID;
        Advertisement tempAd = new Advertisement();  
        //string tempMessage = ""; // add Kind regards + Username of the sender


        protected void Page_Load(object sender, EventArgs e)
        {
            // Method to fill labels
            // Method to fill Person objects 
            // Method to fill Advertisement
            // Method to apply data to page         

            if (Session["currentUser"] == null)
            {
                int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
                Session["returnURL"] = "PrivateMessage.aspx?advertisementID=" + adID;
                Response.Redirect("Login.aspx");
            }
            else
            {

                string tempAdID = "";
                if (Request.QueryString["advertisementID"] != "" && Request.QueryString["advertisementID"] != null)
                {
                    tempAdID = Request.QueryString["advertisementID"];
                    // adID.Value = adId;
                    AdvertisementControls AC = new AdvertisementControls();
                    adID = Convert.ToInt32(tempAdID);
                }
                

                // adID = Convert.ToInt32(Request.QueryString["advertisementID"]);

                tempSender = (Person)Session["currentUser"]; // Sender - grabbing from session
                tempSenderID = tempSender.userID;
                // tempSenderID = 1008; // for testing (worked!)
                tempAd = AC.getAd(adID); // for ad
                tempTitle = tempAd.advertisementTitle; // using GetAd SP for title and sellerID
                tempRecipientID = tempAd.advertisementSellerID; // Getting an ID from an Ad to fill in a Person object for recipient

                tempRecipient = UC.getUserByID(tempRecipientID); // Filling Person object
                tempSellerUsername = tempRecipient.userName;

                tempAdReference = tempTitle + " (Listed by: " + tempSellerUsername + ")";

                lblTempTitle.Text = tempAdReference;

            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string tempMessage = txtMessage.Text;
            // saves to DB at the moment
            UC.savePrivateMessage(tempSenderID, tempRecipientID, adID, tempMessage );
            Response.Redirect("MessageSentConfirmation.aspx");


        }
    }
}