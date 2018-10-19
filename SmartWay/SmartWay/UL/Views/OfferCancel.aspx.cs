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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] != null)
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

        public void cancelOffer(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(offerID.Value);
            AdvertisementControls AC = new AdvertisementControls();
            AC.cancelOffer(ID);
            Response.Redirect("OfferCancelConfirmation.aspx");
        }
    }
}