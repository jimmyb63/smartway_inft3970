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
            return offers;
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
                AC.updateOfferAccepted(offers[index].offerOfferAccepted, offers[index].offerID);
                Response.Redirect("Index.aspx");
            }
            else if (e.CommandName == "decline")
            {
                offers[index].offerOfferAccepted = 0;
                AC.updateOfferAccepted(offers[index].offerOfferAccepted, offers[index].offerID);
                Response.Redirect("Index.aspx");
            }
        }
    }
}