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
    public partial class MyAdvertisements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public List<Advertisement> getAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<Advertisement> ads = AC.getUserAdvertisements(currentUser.userID);
            return ads;
        }

        public string getAdThumbnail(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            string filePath = AC.getAdThumbnail(adID, currentUser.userID);
            return filePath;
        }

        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }
    }
}