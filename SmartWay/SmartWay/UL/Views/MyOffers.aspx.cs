﻿using SmartWay.BL.Models;
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
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerActive == true)
                {
                    tempOffers.Add(offers[i]);
                }
            }
            return tempOffers;
        }

        public decimal getAdPrice(int adID)
        {
            List<Advertisement> ad = getAd(adID);
            decimal price = ad[0].advertisementPrice;
            return price;
        }

        public string getAdTitle(int adID)
        {
            List<Advertisement> ad = getAd(adID);
            string title = ad[0].advertisementTitle;
            return title;
        }

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
            return status;
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