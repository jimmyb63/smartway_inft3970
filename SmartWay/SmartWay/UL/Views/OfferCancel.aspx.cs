using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class OfferCancel : System.Web.UI.Page
    {
        /// <summary>
        /// Check is there is a user logged in. 
        /// If yes, page is loaded. If no, return URL is set and user is redirected to login screen
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                int offerID = Convert.ToInt32(Request.QueryString["offerID"]);
                Session["returnURL"] = "OfferCancel.aspx?offerID=" + offerID;
                Response.Redirect("Login.aspx");
            }
            ID = "";
            if (Request.QueryString["offerID"] != "" || Request.QueryString["offerID"] != null)
            {
                ID = Request.QueryString["offerID"];
            }
            offerID.Value = ID;
        }

        /// <summary>
        /// Cancels and deactivates the selected offer
        /// </summary>
        public void cancelOffer(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(offerID.Value);
            AdvertisementControls AC = new AdvertisementControls();
            AC.cancelOffer(ID);
            Response.Redirect("OfferCancelConfirmation.aspx");
        }
    }
}