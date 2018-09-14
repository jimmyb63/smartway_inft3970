using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Admin : User 
    {
        private string position;

        public Admin()
        {
            fName = null;
            lName = null;
            email = null;
            phoneID = 0;
            addressID = 0;
            password = null;
            paypalID = 0;
            position = "ADMIN";
        }

        public Admin(string init_fName, string init_lName, string init_email, string init_password, int init_phone,int init_addressID, int init_paypalID, string init_position)
        {
            fName = init_fName;
            lName = init_lName;
            email = init_email;
            phoneID = init_phone;
            addressID = init_addressID;
            password = init_password;
            paypalID = init_paypalID;
            position = "ADMIN";
        }

        public string adminfName
        {
            get
            {
                return fName;
            }
            set
            {
                fName = value;
            }
        }

        public string adminlName
        {
            get
            {
                return lName;
            }
            set
            {
                lName = value;
            }
        }

        public string adminEmail
        {
            get
            {
                return email;
            }
            set
            {
                email = value;
            }
        }

        public string adminPassword
        {
            get
            {
                return password;
            }
            set
            {
                password = value;
            }
        }

        public int adminPhoneID
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

        public int adminAdressID
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

        public int adminPaypalID
        {
            get
            {
                return paypalID;
            }
            set
            {
                paypalID = value;
            }
        }

        public string adminPosition
        {
            get
            {
                return position;
            }
            set
            {
                position = value;
            }
        } 
    }
}