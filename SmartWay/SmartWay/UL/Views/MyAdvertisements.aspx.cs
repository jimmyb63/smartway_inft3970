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
            List<Advertisement> tempAds = new List<Advertisement>();
            for (int i = 0; i < ads.Count; i++)
            {
                if (ads[i].advertisementActive == true)
                {
                    tempAds.Add(ads[i]);
                }
            }
            return tempAds;
        }

        public List<Advertisement> getSoldAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<Advertisement> ads = AC.getSoldUserAdvertisements(currentUser.userID);
            List<Advertisement> tempAds = new List<Advertisement>();
            for (int i = 0; i < ads.Count; i++)
            {
                if (ads[i].advertisementActive == true)
                {
                    tempAds.Add(ads[i]);
                }
            }
            return tempAds;
        }

        public string getAdImage(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            string filePath = AC.getAdImage(adID);
            return filePath;
        }

        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }

        public string getBuyerUsername(int buyerID)
        {
            string buyerName;
            UserControls UC = new UserControls();
            Person user = UC.getUserByID(buyerID);
            buyerName = user.userName;
            return buyerName;
        }
    }
}