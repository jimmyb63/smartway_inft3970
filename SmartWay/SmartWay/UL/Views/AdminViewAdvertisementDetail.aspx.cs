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
        }

        /// <summary>
        /// Updates a specific advertisement to deactive
        /// </summary>
        public void DeactivateAd(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(ID);
            ad[0].advertisementActive = false;
            AC.updateAd(ad[0]);
            Response.Redirect("AdminReviewAdvertisements.aspx");
        }

        /// <summary>
        /// Populates a list of advertisements
        /// </summary>
        /// <returns> A list of advertisements </returns>
        public List<Advertisement> GetAd()
        {
            int id = Convert.ToInt32(Request.QueryString["advertisementID"]);
            AdvertisementControls AC = new AdvertisementControls();
            List<Advertisement> ad = AC.getAdvertisement(id);
            return ad;
        }

        /// <summary>
        /// Retireves a list of filepaths for images linked to specific advertisment
        /// </summary>
        /// <param name="adID"></param>
        /// <returns> List of filepath strings </returns>
        public List<string> getAdImages(int adID)
        {
            AdvertisementControls AC = new AdvertisementControls();
            List<string> adImages = AC.getAdImages(adID);
            return adImages;
        }
    }
}