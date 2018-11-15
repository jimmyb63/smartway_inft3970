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
        /// <summary>
        /// Calls the method BindListView which ultimately populates a list of advertisements
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            BindListView();
        }

        /// <summary>
        /// Handles rhe paging of the listview control
        /// </summary>
        protected void onPageChange(object sender, PagePropertiesChangingEventArgs e)
        {
            //set current page startindex, max rows and rebind to false
            DataPagerAds.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

            //rebind List View
            BindListView();
        }

        /// <summary>
        /// Binds a the data source (List of advertisements) to the listview control
        /// </summary>
        void BindListView()
        {
            adList.DataSource = getAds();
            adList.DataBind();
        }

        /// <summary>
        /// Takes the string entered into the search bar by the user,
        /// converts it to a list of strings by splitting with spaces (" "),
        /// iterates through the list to remove any conjunction works to simplify the search process.
        /// </summary>
        /// <param name="searchWords"></param>
        /// <returns>List of Strings</returns>
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

        /// <summary>
        /// Pulls adverisement data from the databse and creates a list which is 
        /// used to be binded to a listview control
        /// </summary>
        /// <returns>List of Advertisement objects</returns>
        public List<Advertisement> getAds()
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ads = new List<Advertisement>();
            string query = "";
            // Takes the query string and populates list, each query string will generate a different list
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
            // Iterates though advertisements and removes any deactive advertisments
            for (int i = 0; i < ads.Count; i++)
            {
                if (ads[i].advertisementActive == true)
                {
                    tempAds.Add(ads[i]);
                }
            }
            List<Advertisement> sortedAds = new List<Advertisement>();
            // Sorts advertisment list by either:
            // - Price(High - Low)
            // - Price(Low - High)
            // - Date Added(Old - New)
            // - Date Added(New - Old)
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
                else if (sort == "o2n")
                {
                    sortedAds = tempAds.OrderByDescending(x => x.advertisementDatePosted).ToList();
                    sortedAds.Reverse();
                }
                else if (sort == "n2o")
                {
                    sortedAds = tempAds.OrderByDescending(x => x.advertisementDatePosted).ToList();
                }
            }
            else
            {
                // Advertisment list is sorted by Date Added(New - Old) 
                sortedAds = tempAds.OrderByDescending(x => x.advertisementDatePosted).ToList();
            }
            return sortedAds;
        }

        /// <summary>
        /// Gets the filepath of the first image linked to this specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>filepath String</returns>
        public string getAdImage(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            string filePath = AC.getAdImage(adID);
            return filePath;
        }

        /// <summary>
        /// Gets the view count for a specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>Int advertisement views</returns>
        public int getViewCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int viewCount = AC.getViewCount(adID);
            return viewCount;
        }

        /// <summary>
        /// Gets a count of the amount of offers made on a specific advertisemnt
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
        /// Pulls query string and uses it to sort advertisment list
        /// </summary>
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
    }
}