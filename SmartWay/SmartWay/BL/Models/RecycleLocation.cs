using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class RecycleLocation
    {
        private int ID;
        private string title;
        private int imageID;
        private int categoryID;
        private string shortDescription;
        private int phoneID;
        private int addressID;
        private bool active;

        public RecycleLocation()
        {
            ID = 0;
            title = null;
            imageID = 0;
            categoryID = 0;
            shortDescription = null;
            phoneID = 0;
            addressID = 0;
            active = true;
        }

        public RecycleLocation(int init_ID, string init_title, int init_imageID, int init_categoryID, string init_shortDescription, int init_phoneID, int init_addressID)
        {
            ID = init_ID;
            title = init_title;
            imageID = init_imageID;
            categoryID = init_categoryID;
            shortDescription = init_shortDescription;
            phoneID = init_phoneID;
            addressID = init_addressID;
            active = true;
        }

        public int recycleLocationID
        {
            get
            {
                return ID;
            }
            set
            {
                ID = value;
            }
        }

        public string recycleLocationTitle
        {
            get
            {
                return title; 
            }
            set
            {
                title = value;
            }
        }

        public int recycleLocationImageID
        {
            get
            {
                return imageID;
            }
            set
            {
                imageID = value;
            }
        }

        public int recycleLocationCategoryID
        {
            get
            {
                return categoryID;
            }
            set
            {
                categoryID = value;
            }
        }

        public string recycleLocationShortDescription
        {
            get
            {
                return shortDescription;
            }
            set
            {
                shortDescription = value;
            }
        }

        public int recycleLocationPhoneID
        {
            get
            {
                return phoneID;
            }
            set
            {
                phoneID = value;
            }
        }

        public int recycleLocationAddressID
        {
            get
            {
                return addressID;
            }
            set
            {
                addressID = value;
            }
        }

        public bool recycleLocationActive
        {
            get
            {
                return active;
            }
            set
            {
                active = value;
            }
        }
    }
}