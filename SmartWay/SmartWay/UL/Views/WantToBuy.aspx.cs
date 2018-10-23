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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
                Session["returnURL"] = "WantToBuy.aspx?advertisementID=" + adID;
                Response.Redirect("Login.aspx");
            }
        }

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

        public void MakeOffer(object sender, EventArgs e)
        {
            string adID = Request.QueryString["advertisementID"];
            Response.Redirect("Offer.aspx?advertisementID=" + adID);
        }
    }
}