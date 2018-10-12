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
        int adID = 1000;               

        AdvertisementControls AC = new AdvertisementControls();
        UserControls UC = new UserControls();

        // Variables for private message: 
        // Sender, Recipient, Title, Ad Object, Message Text, SenderID
        Person sender = new Person(); // grabbing from session
        Person recipient = new Person(); // recipient is a person who receives - person who posted the ad
        string tempTitle;
        string tempSellerUsername;
        string tempAdReference;
        int tempRecipientID;
        Advertisement tempAd = new Advertisement();  
        string tempMessage = ""; // add Kind regards + Username of the sender


        protected void Page_Load(object sender, EventArgs e)
        {
            // Method to fill labels
            // Method to fill Person objects 
            // Method to fill Advertisement
            // Method to apply data to page            

            sender = (Person)Session["currentUser"]; // Sender - grabbing from session

            tempAd = AC.getAd(adID); // for ad
            tempTitle = tempAd.advertisementTitle; // using GetAd SP for title and sellerID
            tempRecipientID = tempAd.advertisementSellerID; // Getting an ID from an Ad to fill in a Person object for recipient

            recipient = UC.getUserByID(tempRecipientID); // Filling Person object
            tempSellerUsername = recipient.userName;

            tempAdReference = tempTitle + " (Listed by: " + tempSellerUsername + ")";

            
            lblTempTitle.Text = tempAdReference;


        }
    }
}