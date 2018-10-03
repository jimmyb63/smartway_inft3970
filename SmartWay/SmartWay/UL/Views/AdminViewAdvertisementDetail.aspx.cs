using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class AdminViewAdvertisementDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string adId = "";
                if (Request.QueryString["advertisementID"] != "" && Request.QueryString["advertisementID"] != null)
                {
                    adId = Request.QueryString["advertisementID"];
                }

                adID.Value = adId;
            }
        }

        public void DeactivateAd(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(adID.Value);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(ID);
            ad[0].advertisementActive = false;
            AC.updateAd(ad[0]);
            Response.Redirect("AdminReviewAdvertisements.aspx");
        }

        public List<Advertisement> GetAd([Control]string adID)
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
    }
}