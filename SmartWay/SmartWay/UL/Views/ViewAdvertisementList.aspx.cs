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
            
        }

        public List<string> keySearchWords(string[] searchWords)
        {
            List<string> searchWordsList = new List<string>();
            string[] conjunctionWords = new string[] { "and", "or", "is", "the", "if", "but", "because", "for", "when" };
            
            for (int i = 0; i < searchWords.Count(); i++)
            {
                bool match = false;
                for (int x = 0; x < conjunctionWords.Count(); x++)
                {
                    if (searchWords[i] == conjunctionWords[x])
                    {
                        match = true;
                    }
                }
                if (!match)
                {
                    searchWordsList.Add(searchWords[i]);
                }
            }
            return searchWordsList;
        }

        public List<Advertisement> getAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ads = new List<Advertisement>();
            string query = "";
            if (Request.QueryString["search"] != "" && Request.QueryString["search"] != null)
            {
                query = Request.QueryString["search"];
                string[] searchWordsArr = query.Split(null);
                List<string> searchWordsList = keySearchWords(searchWordsArr);
                ads = AC.getAdvertisementsSearch(searchWordsList);
            }
            else if (Request.QueryString["category"] != "" && Request.QueryString["category"] != null)
            {
                query = Request.QueryString["category"];
                ads = AC.getAdvertisementsCategory(query);
            }
            else if (Request.QueryString["subCategory"] != "" && Request.QueryString["subCategory"] != null)
            {
                query = Request.QueryString["subCategory"];
                ads = AC.getAdvertisementsSubCategory(query);
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
            List<Advertisement> sortedAds = new List<Advertisement>();
            if (Request.QueryString["sort"] != null)
            {
                string sort = Request.QueryString["sort"];
                if (sort == "h2l")
                {
                    sortedAds = tempAds.OrderByDescending(x => x.advertisementPrice).ToList();
                }
                else if (sort == "l2h")
                {
                    sortedAds = tempAds.OrderByDescending(x => x.advertisementPrice).ToList();
                    sortedAds.Reverse();
                }
                else if (sort == "n2o")
                {
                    sortedAds = tempAds.OrderByDescending(x => x.advertisementDatePosted).ToList();
                    sortedAds.Reverse();
                }
                else if (sort == "o2n")
                {
                    sortedAds = tempAds.OrderByDescending(x => x.advertisementDatePosted).ToList();
                }
            }
            else
            {
                sortedAds = tempAds.OrderByDescending(x => x.advertisementDatePosted).ToList();
                sortedAds.Reverse();
            }
            return sortedAds;
        }

        public string getAdImage(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            string filePath = AC.getAdImage(adID);
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

        public void sortAds(object sender, EventArgs e)
        {
            string value = ddSort.SelectedValue;
            string query = "";
            if (Request.QueryString["search"] != null)
            {
                query = "search=" + Request.QueryString["search"];
            }
            else if (Request.QueryString["category"] != null)
            {
                query = "category=" + Request.QueryString["category"];
            }
            else if (Request.QueryString["subCategory"] != null)
            {
                query = "subCategory=" + Request.QueryString["subCategory"];
            }
            Response.Redirect("ViewAdvertisementList.aspx?" + query + "&sort=" + value);
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