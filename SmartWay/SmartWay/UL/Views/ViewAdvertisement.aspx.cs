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

        public void ReportAd(object sender, EventArgs e)
        {
            int ad = Convert.ToInt32(adID.Value);
            Person currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;
            Response.Redirect("NewAddReviewRequest.aspx?userID=" + userID + "&adID=" + ad);
        }

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

        public string getSellerRating(int sellerID)
        {
            string rating = null;
            AdvertisementControls AC = new AdvertisementControls();
            rating = AC.getSellerRating(sellerID);
            return rating;
        }

        public List<Advertisement> getAd([Control]string adID)
        {
            int id = Convert.ToInt32(adID);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(id);
            return ad;
        }

        public List<string> getAdImages(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<string> adImages = AC.getAdImages(adID);
            return adImages;
        }

        public void WantToBuy(object sender, EventArgs e)
        {
            string adID = Request.QueryString["advertisementID"];
            if (Session["currentUser"] != null)
            {
                //Person currentUser = (Person)Session["currentUser"];
                //string userID = Convert.ToString(currentUser.userID);
                Response.Redirect("WantToBuy.aspx?advertisementID=" + adID);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public string getSellerUsername(int sellerID)
        {
            UserControls UC = new UserControls();
            string email = UC.getUserEmail(sellerID);
            Person user = UC.getUserAccount(email);
            string username = user.userName;
            return username;
        }

        public string getSellerRegoDate(int sellerID)
        {
            UserControls UC = new UserControls();
            string date = (UC.getVerificationDate(sellerID)).ToString("dd/MM/yyyy");
            return date;
        }

        public string getSellerAvatar(int sellerID)
        {
            UserControls UC = new UserControls();
            string filepath = UC.getProfileImage(sellerID);
            return filepath;
        }

        public int getOfferCount(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            int count = AC.getOfferCount(adID);
            return count;
        }
        
		public void ContactSeller(object sender, EventArgs e)
		{
            // we need to send adID as well to the private message
            //< a href = "ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>" >
            int ad = Convert.ToInt32(adID.Value);    
            Response.Redirect("PrivateMessage.aspx?advertisementID="+ ad);
		}

        public double getLat(int addressID)
        {
            double latitude = 0;
            List<double> coordinates = getCoordinates(addressID);
            latitude = coordinates[0];
            return latitude;
        }

        public double getLong(int addressID)
        {
            double longitude = 0;
            List<double> coordinates = getCoordinates(addressID);
            longitude = coordinates[1];
            return longitude;
        }

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