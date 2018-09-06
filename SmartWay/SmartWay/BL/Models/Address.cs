using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Address
    {
        private int streetNum;
        private string streetName;
        private string city;
        private string state;
        private int postCode;
        private string country;
        private bool active;

        public Address()
        {
            streetNum = 0;
            streetName = null;
            city = null;
            state = null;
            postCode = 0;
            country = "Australia";
            active = true;
        }

        public Address(int init_streetNum, string init_streetName, string init_city, string init_state, int init_postCode, string init_country)
        {
            streetNum = init_streetNum;
            streetName = init_streetName;
            city = init_city;
            state = init_state;
            postCode = init_postCode;
            country = init_country;
            active = true;
        }

        public int addressStreetNum
        {
            get
            {
                return streetNum;
            }
            set
            {
                streetNum = value;
            }
        }

        public string addressStreetName
        {
            get
            {
                return streetName;
            }
            set
            {
                streetName = value;
            }
        }

        public string addressCity
        {
            get
            {
                return city;
            }
            set
            {
                city = value;
            }
        }

        public string addressState
        {
            get
            {
                return state;
            }
            set
            {
                state = value;
            }
        }

        public int addressPostCode
        {
            get
            {
                return postCode;
            }
            set
            {
                postCode = value;
            }
        }

        public string addressCountry
        {
            get
            {
                return country;
            }
            set
            {
                country = value;
            }
        }

        public bool addressActive
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