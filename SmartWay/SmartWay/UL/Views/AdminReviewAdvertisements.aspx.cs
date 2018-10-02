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
    public partial class AdminReviewAdvertisements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public List<Advertisement> getAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> tempAds = AC.getAdvertisements();
            List<Advertisement> ads = new List<Advertisement>();
            for (int i = 0; i < tempAds.Count; i++)
            {
                if (tempAds[i].advertisementActive == true)
                {
                    ads.Add(tempAds[i]);
                }
            }
            return ads;
        }

        public void SearchResult_RowCommand(Object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName == "AdvertisementDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                List<Advertisement> ads = getAds();
                Advertisement ad = ads[index];
                Session["selectedAd"] = ad;
                Response.Redirect("AdminViewAdvertisementDetail.aspx?advertisementID=" + ads[index].advertisementID);
            }
        }
    }
}