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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["index"] == null)
            //{
            //    Session["index"] = "yes";
            //    Response.Redirect("/UL/Views/Index.aspx");
            //}

            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (url == "https://inft3970smartway.azurewebsites.net/UL/Views/Index.aspx")
            {
                Response.Redirect("/UL/Views/Index.aspx");
            }
        }

        public List<Advertisement> getAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ads = AC.getAdvertisements();
            return ads;
        }

        public List<Advertisement> getPopularAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ads = getAds();
            List<ViewCount> views = new List<ViewCount>();
            for (int i = 0; i < ads.Count; i++)
            {
                int count = AC.getViewCount(ads[i].advertisementID);
                ViewCount view = new ViewCount(ads[i].advertisementID, count);
            }
            List<ViewCount> popularViews = views.OrderByDescending(x => x.count).ToList();
            List<Advertisement> popularAds = new List<Advertisement>();
            for (int i = 0; i < popularViews.Count; i++)
            {
                if (ads[i].advertisementID == popularViews[i].adID)
                {
                    popularAds.Add(ads[i]);
                }
            }
            if (popularAds.Count > 6)
            { 
                List<Advertisement> top6 = popularAds.GetRange(0, 6);
                return top6;
            }
            else
            {
                return popularAds;
            }
        }

        public List<Advertisement> getPopularGoods()
        {
            AdvertisementControls AC = new AdvertisementControls();
            string category = "goods";
            List<Advertisement> ads = AC.getAdvertisementsCategory(category);
            List<ViewCount> views = new List<ViewCount>();
            for (int i = 0; i < ads.Count; i++)
            {
                int count = AC.getViewCount(ads[i].advertisementID);
                ViewCount view = new ViewCount(count, ads[i].advertisementID);
                views.Add(view);
            }
            List<ViewCount> popularViews = views.OrderByDescending(x => x.count).ToList();
            List<Advertisement> popularAds = new List<Advertisement>();
            for (int i = 0; i < popularViews.Count; i++)
            {
                for (int x = 0; x < ads.Count; x++)
                {
                    if (ads[x].advertisementID == popularViews[i].adID)
                    {
                        popularAds.Add(ads[i]);
                    }
                }
            }
            if (popularAds.Count > 6)
            {
                List<Advertisement> top6 = popularAds.GetRange(0, 6);
                return top6;
            }
            else
            {
                return popularAds;
            }
        }

        public List<Advertisement> getPopularServices()
        {
            AdvertisementControls AC = new AdvertisementControls();
            string category = "services";
            List<Advertisement> ads = AC.getAdvertisementsCategory(category);
            List<ViewCount> views = new List<ViewCount>();
            for (int i = 0; i < ads.Count; i++)
            {
                int count = AC.getViewCount(ads[i].advertisementID);
                ViewCount view = new ViewCount(count, ads[i].advertisementID);
                views.Add(view);
            }
            List<ViewCount> popularViews = views.OrderByDescending(x => x.count).ToList();
            List<Advertisement> popularAds = new List<Advertisement>();
            for (int i = 0; i < popularViews.Count; i++)
            {
                for (int x = 0; x < ads.Count; x++)
                {
                    if (ads[x].advertisementID == popularViews[i].adID)
                    {
                        popularAds.Add(ads[i]);
                    }
                }
            }
            if (popularAds.Count > 6)
            {
                List<Advertisement> top6 = popularAds.GetRange(0, 6);
                return top6;
            }
            else
            {
                return popularAds;
            }
        }

        public string getAdImage(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            string filePath = AC.getAdImage(adID);
            return filePath;
        }
    }
}