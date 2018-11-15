using GoogleMaps.LocationServices;
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
    public partial class Map : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Uses the coordinates of the address provided to get the latitude
        /// </summary>
        /// <param name="address"></param>
        /// <returns>Double latitude</returns>
        public double getLat(string address)
        {
            double latitude = 0;
            List<double> coordinates = getCoordinates(address);
            latitude = coordinates[0];
            return latitude;
        }

        /// <summary>
        /// Uses the coordinates of the address provided to get the longitude
        /// </summary>
        /// <param name="address"></param>
        /// <returns>Double longitude</returns>
        public double getLong(string address)
        {
            double longitude = 0;
            List<double> coordinates = getCoordinates(address);
            longitude = coordinates[1];
            return longitude;
        }

        /// <summary>
        /// Uses the address provided to get the coordinates
        /// </summary>
        /// <param name="address"></param>
        /// <returns>List of Double objects</returns>
        public List<double> getCoordinates(string address)
        {
            string address1 = address;
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