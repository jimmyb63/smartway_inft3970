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
    public partial class sellerFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {

            }
        }

        public string getUsername(int sellerID)
        {
            string username = "";
            UserControls UC = new UserControls();
            Person seller = UC.getUserByID(sellerID);
            username = seller.userName;
            return username;
        }

        public void submitFeedback(object sender, EventArgs e)
        {
            int rating = Convert.ToInt32(rbRating.SelectedValue);
            string comment = txtFeedbackComment.Text;
            Person user = (Person)Session["currentUser"];
            int buyerID = user.userID;
            int sellerID = Convert.ToInt32(Request.QueryString["sellerID"]);
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            AC.submitFeedback(rating, comment, buyerID, sellerID, adID);
            int offerID = Convert.ToInt32(Request.QueryString["offerID"]);
            AC.deactivateAcceptedOffer(offerID);
            Response.Redirect("sellerFeedbackConfirmation.aspx");
        }
    }
}