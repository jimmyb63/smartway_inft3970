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
        /// <summary>
        /// Check is there is a user logged in. 
        /// If yes, page is loaded. If no, return URL is set and user is redirected to login screen
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Session["returnURL"] = "MyOffers.aspx";
                Response.Redirect("Login.aspx");
            }
        }

        /// <summary>
        /// Populates a list of active offers that this specific user has made to others
        /// </summary>
        /// <returns>List of Offer objects</returns>
        public List<BL.Models.Offer> getOffers()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<BL.Models.Offer> offers = AC.getUserOffers(currentUser.userID);
            List<BL.Models.Offer> tempOffers = new List<BL.Models.Offer>();
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerActive == true)
                {
                    tempOffers.Add(offers[i]);
                }
            }
            return tempOffers;
        }

        /// <summary>
        /// Populates a list of offers made by this specific user that have been accepted by others
        /// </summary>
        /// <returns>List of Offer objects</returns>
        public List<BL.Models.Offer> getAcceptedOffers()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<BL.Models.Offer> offers = AC.getUserOffers(currentUser.userID);
            List<BL.Models.Offer> tempOffers = new List<BL.Models.Offer>();
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerActive == true && offers[i].offerOfferAccepted == 1)
                {
                    tempOffers.Add(offers[i]);
                }
            }
            return tempOffers;
        }

        /// <summary>
        /// Populates a list of active offers that this specific user has made to others
        /// </summary>
        /// <returns>List of Offer objects</returns>
        public List<BL.Models.Offer> getPendingOffers()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<BL.Models.Offer> offers = AC.getUserOffers(currentUser.userID);
            List<BL.Models.Offer> tempOffers = new List<BL.Models.Offer>();
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerActive == true && offers[i].offerOfferAccepted == 2)
                {
                    tempOffers.Add(offers[i]);
                }
            }
            return tempOffers;
        }

        /// <summary>
        /// Checks whether the specified advertisement has been finalised
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>True if finalised, False if not finalised</returns>
        public bool adFinalised(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getSoldUserAdvertisement(adID);
            if (ad[0].advertisementBuyerID != 0)
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// Populates a list of offers for this specific user that were not accepted
        /// </summary>
        /// <returns>List of Offer objects</returns>
        public List<BL.Models.Offer> getNotAcceptedOffers()
        {
            AdvertisementControls AC = new AdvertisementControls();
            Person currentUser = (Person)Session["currentUser"];
            List<BL.Models.Offer> offers = AC.getUserOffers(currentUser.userID);
            List<BL.Models.Offer> tempOffers = new List<BL.Models.Offer>();
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerActive == true && (offers[i].offerOfferAccepted == 0 || offers[i].offerOfferAccepted == 3))
                {
                    tempOffers.Add(offers[i]);
                }
            }
            return tempOffers;
        }

        /// <summary>
        /// Gets the price offered for the specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>Decimal price</returns>
        public decimal getAdPrice(int adID)
        {
            List<Advertisement> ad = getAd(adID);
            decimal price = ad[0].advertisementPrice;
            return price;
        }

        /// <summary>
        /// Gets the Title of the specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>String title</returns>
        public string getAdTitle(int adID)
        {
            List<Advertisement> ad = getAd(adID);
            string title = ad[0].advertisementTitle;
            return title;
        }

        /// <summary>
        /// Gets the status of the offer that has been placed on and advertisement
        /// </summary>
        /// <param name="offerID"></param>
        /// <returns>String offer</returns>
        public string getOfferStatus(int offerID)
        {
            List<BL.Models.Offer> offers = getOffers();
            int accepted = -1;
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerID == offerID)
                {
                    accepted = offers[i].offerOfferAccepted;
                }
            }
            string status = "";
            if (accepted == 0)
            {
                status = "Declined";
            }
            else if (accepted == 1)
            {
                status = "Accepted";
            }
            else if (accepted == 2)
            {
                status = "Pending";
            }
            else if (accepted == 3)
            {
                status = "Not Accepted";
            }
            return status;
        }

        /// <summary>
        /// Pupulates a list of adverisements
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>List of advertisment objects</returns>
        public List<Advertisement> getAd(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(adID);
            return ad;
        }

        /// <summary>
        /// gets the filepath of the first image that is linked to this specific advertisement
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
    }
}