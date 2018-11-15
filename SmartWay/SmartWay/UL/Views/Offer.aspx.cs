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
    public partial class Offer : System.Web.UI.Page
    {
        /// <summary>
        /// Check is there is a user logged in. 
        /// If yes, page is loaded. If no, return URL is set and user is redirected to login screen
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
                Session["returnURL"] = "Offer.aspx?advertisementID=" + adID;
                Response.Redirect("Login.aspx");
            }
        }

        /// <summary>
        /// Creates a new offer and links it to the selected advertisement
        /// </summary>
        public void MakeOffer(object sender, EventArgs e)
        {
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(adID);
            int sellerID = ad[0].advertisementSellerID;
            Person currentUser = (Person)Session["currentUser"];
            int buyerID = currentUser.userID;
            decimal offerAmount = Convert.ToDecimal(txtOfferAmount.Text);
            // Creates a new offer in the database and returns the ID
            int code = AC.makeOffer(buyerID, sellerID, adID, offerAmount);
            Response.Redirect("OfferConfirmation.aspx?advertisementID=" + Request.QueryString["advertisementID"]);
        }
    }
}