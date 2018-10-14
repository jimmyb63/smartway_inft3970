﻿using SmartWay.DAL.Controllers;
using SmartWay.BL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class AdvertisementOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public List<BL.Models.Offer> GetOffers()
        {
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            List<BL.Models.Offer> offers = AC.getAdOffers(adID);
            List<BL.Models.Offer> finalOffers = new List<BL.Models.Offer>();
            for (int i = 0; i < offers.Count; i++)
            {
                if (offers[i].offerActive)
                {
                    finalOffers.Add(offers[i]);
                }
            }
            
            return finalOffers;
        }

        public string getUsername(int userID)
        {
            UserControls UC = new UserControls();
            string email = UC.getUserEmail(userID);
            Person user = UC.getUserAccount(email);
            string userName = user.userName;
            return userName;
        }

        protected void offerList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            List<BL.Models.Offer> offers = GetOffers();
            AdvertisementControls AC = new AdvertisementControls();
            if (e.CommandName == "accept")
            {
                offers[index].offerOfferAccepted = 1;
                AC.updateOfferAccepted(offers[index].offerOfferAccepted, offers[index].offerID, offers[index].offerAdID);
                Response.Redirect("AdvertisementOffers.aspx?advertisementID=" + offers[index].offerAdID);
            }
            else if (e.CommandName == "decline")
            {
                offers[index].offerOfferAccepted = 0;
                AC.updateOfferAccepted(offers[index].offerOfferAccepted, offers[index].offerID, offers[index].offerAdID);
                Response.Redirect("AdvertisementOffers.aspx?advertisementID=" + offers[index].offerAdID);
            }
            else if (e.CommandName == "message")
            {
                int buyerID = offers[index].offerBuyerID;
                int adID = offers[index].offerAdID;
                Response.Redirect("PrivateMessage.aspx?advertisementID=" + adID + "&buyerID=" + buyerID);
            }
            else if (e.CommandName == "finalise")
            {
                int buyerID = offers[index].offerBuyerID;
                int adID = offers[index].offerAdID;
                decimal ammount = offers[index].offerAmountOffered;
                Response.Redirect("FinaliseAdvertisement.aspx?advertisementID=" + adID + "&buyerID=" + buyerID + "&ammount=" + ammount);
            }
        }
    }
}