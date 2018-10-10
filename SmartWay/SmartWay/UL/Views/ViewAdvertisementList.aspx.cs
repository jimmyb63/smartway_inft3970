using System;
using SmartWay.BL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.DAL.Controllers;
using System.Web.ModelBinding;

namespace SmartWay.UL.Views
{
    public partial class ViewAdvertisementList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "";
            if (Request.QueryString["category"] != "" && Request.QueryString["category"] != null)
            {
                query = Request.QueryString["category"];
            }
            else if (Request.QueryString["subCategory"] != "" && Request.QueryString["subCategory"] != null)
            {
                query = Request.QueryString["subCategory"];
            }

            ID.Value = query;
        }

        public List<Advertisement> getAds([Control]string ID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ads = new List<Advertisement>();
            string query = ID;
            if (query != "")
            {
                if (query == "goods" || query == "services")
                {
                    ads = AC.getAdvertisementsCategory(query);
                }
                else
                {
                    ads = AC.getAdvertisementsSubCategory(query);
                }
            }
            else
            {
                ads = AC.getAdvertisements();
            }
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

        public string getAdThumbnail(int adID, int userID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            string filePath = AC.getAdThumbnail(adID, userID);
            return filePath;
        }

        public int getViewCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int viewCount = AC.getViewCount(adID);
            return viewCount;
        }

        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }

        //public void SearchResult_RowCommand(Object sender, GridViewCommandEventArgs e)
        //{


        //    if (e.CommandName == "AdvertisementDetail")
        //    {
        //        int index = Convert.ToInt32(e.CommandArgument);
        //        List<Advertisement> ads = getAds();
        //        Advertisement ad = ads[index];
        //        Session["selectedAd"] = ad;
        //        Response.Redirect("ViewAdvertisement.aspx");
        //    }
        //}
    }
}