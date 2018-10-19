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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
                Session["returnURL"] = "Offer.aspx?advertisementID=" + adID;
                Response.Redirect("Login.aspx");
            }
        }

        public void MakeOffer(object sender, EventArgs e)
        {
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(adID);
            int sellerID = ad[0].advertisementSellerID;
            Person currentUser = (Person)Session["currentUser"];
            int buyerID = currentUser.userID;
            decimal offerAmount = Convert.ToDecimal(txtOfferAmount.Text);
            int code = AC.makeOffer(buyerID, sellerID, adID, offerAmount);
            if (code == -1)
            {
                Response.Write("<script>alert('Offer Already Exists')</script>");
            }
            else
            {
                Response.Redirect("OfferConfirmation.aspx?advertisementID=" + Request.QueryString["advertisementID"]);
            }
        }
    }
}