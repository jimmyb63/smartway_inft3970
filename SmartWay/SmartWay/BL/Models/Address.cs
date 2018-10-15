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
        private int stateID;
        private string stateName;

        //Constructor
        public Address()
        {

            addressUnitNum = null;
            addressStreetNum = null;
            addressStreetName = null;
            addressCity = null;
            stateID = 0;
            addressPostCode = 0;
            addressCountry = "Australia";
            addressActive = true;
        }

        public Address(string init_unitNum, string init_streetNum, string init_streetName, string init_city, string init_state, int init_postCode, string init_country)
        {
            addressUnitNum = init_unitNum;
            addressStreetNum = init_streetNum;
            addressStreetName = init_streetName;
            addressCity = init_city;
            stateName = init_state;
            setStateID(stateName);
            addressPostCode = init_postCode;
            addressCountry = init_country;
            addressActive = true;
        }

        //Get Set Methods
        public string addressUnitNum { get; set; }

        public string addressStreetNum { get; set; }

        public string addressStreetName { get; set; }

        public string addressCity { get; set; }

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

        public int addressPostCode { get; set; }

        public string addressCountry { get; set; }

        public bool addressActive { get; set; }

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