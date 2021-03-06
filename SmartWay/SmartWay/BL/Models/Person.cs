﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Person
    {
        protected int ID;
        protected string fName;
        protected string lName;
        protected string uName;
        protected string DOB;
        protected string email;
        protected string password;
        protected int phoneID;
        protected int addressID;
        protected int paypalID;
        protected DateTime verDate;
        protected DateTime createDate;
        protected bool active;

        public Person()
        {
            ID = 0;
            fName = null;
            lName = null;
            email = null;
            DOB = null;
            phoneID = 0;
            addressID = 0;
            uName = null;
            password = null;
            verDate = DateTime.Now;
            active = true;

        }

        public Person(int init_ID, string init_fName, string init_lName, string init_email, string init_DOB, int init_phoneID, int init_addressID, string init_uName, string init_password, DateTime init_verDate, DateTime init_createDate, bool init_active)
        {
            ID = init_ID;
            fName = init_fName;
            lName = init_lName;
            email = init_email;
            DOB = init_DOB;
            phoneID = init_phoneID;
            addressID = init_addressID;
            uName = init_uName;
            password = init_password;
            verDate = init_verDate;
            createDate = init_createDate;
            active = init_active;
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

        public string userName
        {
            get
            {
                return uName;
            }
            set
            {
                uName = value;
            }
        }

        public string userDOB
        {
            get
            {
                return DOB;
            }
            set
            {
                DOB = value;
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

        public DateTime userVerDate
        {
            get
            {
                return verDate;
            }
            set
            {
                verDate = value;
            }
        }

        public DateTime userCreateDate
        {
            get
            {
                return createDate;
            }
            set
            {
                createDate = value;
            }
        }

        public bool userActive
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