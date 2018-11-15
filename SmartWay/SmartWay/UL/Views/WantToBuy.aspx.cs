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
    public partial class WantToBuy : System.Web.UI.Page
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
                Session["returnURL"] = "WantToBuy.aspx?advertisementID=" + adID;
                Response.Redirect("Login.aspx");
            }
        }

        /// <summary>
        /// Grabs the advertisemntID and userID from the Session, 
        /// uses them both to create a new offer at the price listed on the specifies advertisement
        /// </summary>
        public void BuyNow(object sender, EventArgs e)
        {
            // create an accepted offer
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(adID);
            int sellerID = ad[0].advertisementSellerID;
            Person currentUser = (Person)Session["currentUser"];
            int buyerID = currentUser.userID;
            decimal offerAmount = ad[0].advertisementPrice;
            int code = AC.makeOffer(buyerID, sellerID, adID, offerAmount);
            // redirect to my offers
            Response.Redirect("OfferConfirmation.aspx?advertisementID=" + Request.QueryString["advertisementID"]);
            //Response.Redirect("Payment.aspx?advertisementID=" + adID);
        }

        /// <summary>
        /// User is redirected to the offer screen
        /// </summary>
        public void MakeOffer(object sender, EventArgs e)
        {
            string adID = Request.QueryString["advertisementID"];
            Response.Redirect("Offer.aspx?advertisementID=" + adID);
        }
    }
}