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
    public partial class FinaliseAdvertisement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void adSold(object sender, EventArgs e)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            int offerID = Convert.ToInt32(Request.QueryString["offerID"]);
            BL.Models.Offer finalOffer = AC.getOffer(offerID);
            decimal amount = finalOffer.offerAmountOffered;
            int buyerID = finalOffer.offerBuyerID;
            AC.advertisementSold(adID, amount, buyerID);
            AC.deactivateAccepted(adID);
            Response.Redirect("MyAdvertisements.aspx");
        }

        public void cancelOffer(object sender, EventArgs e)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int offerID = Convert.ToInt32(Request.QueryString["offerID"]);
            AC.cancelOffer(offerID);
            Response.Redirect("MyAdvertisements.aspx");
        }

        public string getUsername(int userID)
        {
            UserControls UC = new UserControls();
            string email = UC.getUserEmail(userID);
            Person user = UC.getUserAccount(email);
            string userName = user.userName;
            return userName;
        }
    }
}