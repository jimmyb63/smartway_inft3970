using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoogleMaps.LocationServices;

namespace SmartWay.UL.Views
{
    public partial class ViewAdvertisement : System.Web.UI.Page
    {
        /// <summary>
        /// Check is there is a user logged in. 
        /// If yes, page is loaded. If no, return URL is set and user is redirected to login screen
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            string adId = "";
            if (Request.QueryString["advertisementID"] != "" && Request.QueryString["advertisementID"] != null)
            {
                adId = Request.QueryString["advertisementID"];
            }
            adID.Value = adId;
            AdvertisementControls AC = new AdvertisementControls();
            int id = Convert.ToInt32(adId);
            txtViewCount.Value = Convert.ToString(AC.getViewCount(id));
            if (Session["currentUser"] != null)
            {
                if (Session[adId] == null)
                {
                    id = Convert.ToInt32(adId);
                    int count = Convert.ToInt32(txtViewCount.Value);
                    AC.updateViewCount(id, (count + 1));
                    Session[adId] = adId;
                }
            }
        }

        /// <summary>
        /// Redirects users to the create review request page
        /// </summary>
        public void ReportAd(object sender, EventArgs e)
        {
            int ad = Convert.ToInt32(adID.Value);
            Person currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;
            Response.Redirect("NewAddReviewRequest.aspx?userID=" + userID + "&adID=" + ad);
        }

        /// <summary>
        /// Used to check if an offer exists on a specific advertisement
        /// </summary>
        /// <returns>True if offer exists, False if offer doesnt exist</returns>
        public bool pendingOffer()
        {
            int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            if (Session["currentUser"] != null)
            {
                Person currentUser = (Person)Session["currentUser"];
                int userID = currentUser.userID;
                AdvertisementControls AC = new AdvertisementControls();
                bool offerExists = AC.offerExists(adID, userID);
                return offerExists;
            }
            return false;
        }

        /// <summary>
        /// Gets the average of all the feedback related to this specific seller and displays it as a star rating
        /// </summary>
        /// <param name="sellerID"></param>
        /// <returns>Int seller rating</returns>
        public string getSellerRating(int sellerID)
        {
            string rating = null;
            AdvertisementControls AC = new AdvertisementControls();
            rating = AC.getSellerRating(sellerID);
            return rating;
        }

        /// <summary>
        /// Gets a specific advertisement whic is used to display
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>List of Advertisment objects</returns>
        public List<Advertisement> getAd([Control]string adID)
        {
            int id = Convert.ToInt32(adID);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(id);
            return ad;
        }

        /// <summary>
        /// Gets the filepaths of the images linked to this specific advertisment
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>List of filepath strings</returns>
        public List<string> getAdImages(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<string> adImages = AC.getAdImages(adID);
            return adImages;
        }

        /// <summary>
        /// Redirects used to the make an offer page where they can 'buy it now' or 'make an offer'
        /// </summary>
        public void WantToBuy(object sender, EventArgs e)
        {
            string adID = Request.QueryString["advertisementID"];
            if (Session["currentUser"] != null)
            {
                Response.Redirect("WantToBuy.aspx?advertisementID=" + adID);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        /// <summary>
        /// Gets the username of the specific user linked to the advertisement
        /// </summary>
        /// <param name="sellerID"></param>
        /// <returns>String username</returns>
        public string getSellerUsername(int sellerID)
        {
            UserControls UC = new UserControls();
            string email = UC.getUserEmail(sellerID);
            Person user = UC.getUserAccount(email);
            string username = user.userName;
            return username;
        }

        /// <summary>
        /// Gets the registration date of the seller linked to this advertisement
        /// </summary>
        /// <param name="sellerID"></param>
        /// <returns>String registration date</returns>
        public string getSellerRegoDate(int sellerID)
        {
            UserControls UC = new UserControls();
            string date = (UC.getVerificationDate(sellerID)).ToString("dd/MM/yyyy");
            return date;
        }

        /// <summary>
        /// Gets the filepath for the profile image of the seller related to the advertisement
        /// </summary>
        /// <param name="sellerID"></param>
        /// <returns>String filepath</returns>
        public string getSellerAvatar(int sellerID)
        {
            UserControls UC = new UserControls();
            string filepath = UC.getProfileImage(sellerID);
            return filepath;
        }

        /// <summary>
        /// Gets the count of offers made on this specific advertisement
        /// </summary>
        /// <param name="adID"></param>
        /// <returns>Int offers</returns>
        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }
        
        /// <summary>
        /// Redirects the user to the message page
        /// </summary>
		public void ContactSeller(object sender, EventArgs e)
		{
            int ad = Convert.ToInt32(adID.Value);    
            Response.Redirect("PrivateMessage.aspx?advertisementID="+ ad);
		}

        /// <summary>
        /// Uses the coordinates of the address linked to the advertisement and gets the latitude
        /// </summary>
        /// <param name="addressID"></param>
        /// <returns>Doubke latitude</returns>
        public double getLat(int addressID)
        {
            double latitude = 0;
            List<double> coordinates = getCoordinates(addressID);
            latitude = coordinates[0];
            return latitude;
        }

        /// <summary>
        /// Uses the coordinates of the address linked to the advertisement and gets the longitude
        /// </summary>
        /// <param name="addressID"></param>
        /// <returns>Doubke longitude</returns>
        public double getLong(int addressID)
        {
            double longitude = 0;
            List<double> coordinates = getCoordinates(addressID);
            longitude = coordinates[1];
            return longitude;
        }

        /// <summary>
        /// Uses the address linked to the advertisement and gets the coordinates
        /// </summary>
        /// <param name="addressID"></param>
        /// <returns>List of Doubles objects</returns>
        public List<double> getCoordinates(int addressID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            Address adAddress = AC.getAdAddress(addressID);

            string address = adAddress.addressStreetNum + " " +
                             adAddress.addressStreetName + ", " +
                             adAddress.addressCity + " " +
                             adAddress.addressState + " " +
                             adAddress.addressPostCode + ", " +
                             adAddress.addressCountry;
            string apiKey = "AIzaSyBS_nOmu7Z5my3ELOiqHOgxrzOnoHfvJNU";
            GoogleLocationService locationService = new GoogleLocationService(apiKey);
            MapPoint point = locationService.GetLatLongFromAddress(address);

            double latitude = point.Latitude;
            double longitude = point.Longitude;
            List<double> coordinates = new List<double>();
            coordinates.Add(latitude);
            coordinates.Add(longitude);
            return coordinates;
        }
    }
}