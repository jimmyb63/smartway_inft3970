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
        /// <summary>
        /// Check is there is a user logged in. 
        /// If yes, page is loaded. If no, return URL is set and user is redirected to login screen
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Session["returnURL"] = "MyAdvertisements.aspx";
                Response.Redirect("Login.aspx");
            }
        }

        /// <summary>
        /// Populates a list of active advertisements which have been added by this specific user
        /// </summary>
        /// <returns>List of Advertisement objects</returns>
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

        /// <summary>
        /// Populates a list of sold advertisements which have been added by this specific user
        /// </summary>
        /// <returns>List of Advertisement objects</returns>
        public List<Advertisement> getSoldAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<Advertisement> ads = AC.getSoldUserAdvertisements(currentUser.userID);
            return ads;
        }

        /// <summary>
        /// Gets the file path of the first image that is linked to this specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>String filepath</returns>
        public string getAdImage(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            string filePath = AC.getAdImage(adID);
            return filePath;
        }

        /// <summary>
        /// Gets the count of offers made for this specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>Int offer count</returns>
        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }

        /// <summary>
        /// Get the username of the user who made a successful offer of this specific advertisement
        /// </summary>
        /// <param name="buyerID"></param>
        /// <returns></returns>
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