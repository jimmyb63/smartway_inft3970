using System;
using SmartWay.BL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.DAL.Controllers;

namespace SmartWay.UL.Views
{
    public partial class ViewAdvertisementList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Advertisement> getAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ads = AC.getAdvertisements();
            return ads;
        }

        public string getAdThumbnail(int adID, int userID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            string filePath = AC.getAdThumbnail(adID, userID);
            return filePath;
        }

        public void SearchResult_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            
            
            if (e.CommandName == "AdvertisementDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                List<Advertisement> ads = getAds();
                Advertisement ad = ads[index];
                Session["selectedAd"] = ad;
                Response.Redirect("ViewAdvertisement.aspx");
            }
        }
    }
}