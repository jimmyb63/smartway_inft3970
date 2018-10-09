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
    public partial class MyOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public List<BL.Models.Offer> getOffers()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<BL.Models.Offer> offers = AC.getUserOffers(currentUser.userID);
            List<BL.Models.Offer> tempOffers = new List<BL.Models.Offer>();
            for (int i = 0; i < tempOffers.Count; i++)
            {
                if (offers[i].offerActive == true)
                {
                    tempOffers.Add(offers[i]);
                }
            }
            return tempOffers;
        }

        public List<Advertisement> getAd(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(adID);
            return ad;
        }

        public string getAdThumbnail(int adID, int sellerID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            string filePath = AC.getAdThumbnail(adID, sellerID);
            return filePath;
        }
    }
}