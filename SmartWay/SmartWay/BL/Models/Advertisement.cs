using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Advertisement
    {
        private int ID;
        private int sellerID;
        private int buyerID;
        private string adType;
        private string title;
        private string description;
        private int addressID;
        private string status;
        private DateTime datePosted;
        private DateTime? dateComplete;
        private int categoryID;
        private decimal price;
        private bool active;

        public Advertisement()
        {
            ID = 0;
            sellerID = 0;
            buyerID = 0;
            adType = null;
            title = null;
            description = null;
            addressID = 0;
            datePosted = DateTime.Now;
            dateComplete = null;
            categoryID = 0;
            price = 0;
            active = true;
        }

        public Advertisement(int init_ID, int init_sellerID, string init_adType, string init_title, string init_description, int init_addressID, DateTime init_datePosted, int init_categoryID, decimal init_price, bool init_active)
        {
            ID = init_ID;
            sellerID = init_sellerID;
            adType = init_adType;
            title = init_title;
            description = init_description;
            addressID = init_addressID;
            datePosted = init_datePosted;
            dateComplete = null;
            categoryID = init_categoryID;
            price = init_price;
            active = init_active;
        }

        public Advertisement(int init_ID, int init_sellerID, string init_title, string init_description, DateTime init_datePosted, decimal init_price, bool init_active)
        {
            ID = init_ID;
            sellerID = init_sellerID;
            title = init_title;
            description = init_description;
            datePosted = init_datePosted;
            dateComplete = null;
            price = init_price;
            active = init_active;
        }

        public int advertisementID
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

        public int advertisementSellerID
        {
            get
            {
                return sellerID;
            }
            set
            {
                sellerID = value;
            }
        }

        public int advertisementBuyerID
        {
            get
            {
                return buyerID;
            }
            set
            {
                buyerID = value;
            }
        }

        public string advertisementType
        {
            get
            {
                return adType;
            }
            set
            {
                adType = value;
            }
        }

        public string advertisementTitle
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

        public string advertisementDescription
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public int advertisementAddressID
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

        public string advertisementStatus
        {
            get
            {
                return status;
            }
            set
            {
                status = value;
            }
        }

        public DateTime advertisementDatePosted
        {
            get
            {
                return datePosted;
            }
            set
            {
                datePosted = value;
            }
        }

        public DateTime? advertisementDateComplete
        {
            get
            {
                return dateComplete;
            }
            set
            {
                dateComplete = value;
            }
        }

        public int advertisementCategoryID
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

        public decimal advertisementPrice
        {
            get
            {
                return price;
            }
            set
            {
                price = value;
            }
        }

        public bool advertisementActive
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