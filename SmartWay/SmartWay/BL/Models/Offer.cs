using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Offer
    {
        private int ID;
        private int buyerID;
        private int sellerID;
        private int adID;
        private decimal amountOffered;
        private int offerAccepted;
        private bool active;

        public Offer()
        {
            ID = 0;
            buyerID = 0;
            sellerID = 0;
            adID = 0;
            amountOffered = 0;
            offerAccepted = 2;
            active = false;
        }

        public Offer(int init_ID, int init_buyerID, int init_sellerID, int init_adID, decimal init_amountOffered, int init_offerAccepted, bool init_active)
        {
            ID = init_ID;
            buyerID = init_buyerID;
            sellerID = init_sellerID;
            adID = init_adID;
            amountOffered = init_amountOffered;
            offerAccepted = init_offerAccepted;
            active = init_active;
        }

        public int offerID
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

        public int offerBuyerID
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

        public int offerSellerID
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

        public int offerAdID
        {
            get
            {
                return adID;
            }
            set
            {
                adID = value;
            }
        }

        public decimal offerAmountOffered
        {
            get
            {
                return amountOffered;
            }
            set
            {
                amountOffered = value;
            }
        }

        public int offerOfferAccepted
        {
            get
            {
                return offerAccepted;
            }
            set
            {
                offerAccepted = value;
            }
        }

        public bool offerActive
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