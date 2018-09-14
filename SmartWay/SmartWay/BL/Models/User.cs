using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class User
    {
        protected int ID;
        protected string fName;
        protected string lName;
        protected string email;
        protected string password;
        protected int phoneID;
        protected int addressID;
        protected int paypalID;

        public User()
        {
            ID = 0;
            fName = null;
            lName = null;
            email = null;
            phoneID = 0;
            addressID = 0;
            password = null;
            paypalID = 0; ;
        }

        public User(int init_ID, string init_fName, string init_lName, string init_email, string init_password, int init_phoneID, int init_addressID, int init_paypalID)
        {
            ID = init_ID;
            fName = init_fName;
            lName = init_lName;
            email = init_email;
            phoneID = init_phoneID;
            addressID = init_addressID;
            password = init_password;
            paypalID = init_paypalID;
        }

        public int userID
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

        public string userfName
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

        public string userlName
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

        public string userEmail
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

        public string userPassword
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

        public int userPhoneID
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

        public int userAddressID
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

        public int userPaypalID
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
    }
}