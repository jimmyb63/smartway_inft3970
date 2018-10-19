using SmartWay.BL.Models;
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
            string adID = Request.QueryString["advertisementID"];
            Response.Redirect("Payment.aspx?advertisementID=" + adID);
        }

        public void MakeOffer(object sender, EventArgs e)
        {
            string adID = Request.QueryString["advertisementID"];
            Response.Redirect("Offer.aspx?advertisementID=" + adID);
        }
    }
}