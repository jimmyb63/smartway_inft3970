//using SmartWay.BL.Controllers;
//using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Address
    {

        private string unitNum;
        private string streetNum;
        private string streetName;
        private string city;
        private int stateID;
        private string stateName;
        private int postCode;
        private string country;
        private bool active;
        
        //Constructor
        public Address()
        {

            unitNum = null;
            streetNum = null;
            streetName = null;
            city = null;
            stateName = null;
            stateID = 0;
            postCode = 0;
            country = "Australia";
            active = true;
        }

        public Address(string init_unitNum, string init_streetNum, string init_streetName, string init_city, string init_state, int init_postCode, string init_country)
        {
            unitNum = init_unitNum;
            streetNum = init_streetNum;
            streetName = init_streetName;
            city = init_city;
            stateName = init_state;
            setStateID(stateName);
            postCode = init_postCode;
            country = init_country;
            active = true;
        }

        //Get Set Methods
        public string addressUnitNum
        {
            get
            {
                return unitNum;
            }
            set
            {
                unitNum = value;
            }
        }

        public string addressStreetNum
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
                return stateName;
            }
            set
            {
                stateName = value;
                //When a State Name is added, This will add the State ID
                setStateID(stateName);
            }
        }

        public int addressStateID
        {
            get
            {
                return stateID;
            }
            set
            {
                stateID = value;
                //When a State ID is added, This will add the State Name
                setStateName(stateID);
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

        //Calculation Methods

        // Used to return the int StateID from a string StateName
        public void setStateID( string tempStateName)
        {
            switch (tempStateName.Trim())
            {
                case "NSW":
                    stateID = 1;
                    break;
                case "QLD":
                    stateID = 2;
                    break;
                case "WA":
                    stateID = 3;
                    break;
                case "VIC":
                    stateID = 4;
                    break;
                case "SA":
                    stateID = 5;
                    break;
                case "NT":
                    stateID = 6;
                    break;
                case "TAS":
                    stateID = 7;
                    break;
                case "ACT":
                    stateID = 8;
                    break;
            }
        }

        // Used to return the string StateName from an int StateID.
        public void setStateName(int tempStateID)
        {
            switch (tempStateID)
            {
                case 1:
                    stateName = "NSW";
                    break;
                case 2:
                    stateName = "QLD";
                    break;
                case 3:
                    stateName = "WA";
                    break;
                case 4:
                    stateName = "VIC";
                    break;

                case 5:
                    stateName = "SA";
                    break;
                case 6:
                    stateName = "NT";
                    break;
                case 7:
                    stateName = "TAS";
                    break;
                case 8:
                    stateName = "ACT";
                    break;
            }
        }
    }
}