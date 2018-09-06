using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class User
    {
        protected string fName;
        protected string lName;
        protected string email;
        protected string password;
        protected int phone;
        protected string paypalID;
        protected DateTime regDate;
        protected bool verified;
        protected bool active;

        public User()
        {
            fName = null;
            lName = null;
            email = null;
            phone = 0;
            password = null;
            paypalID = null;
            regDate = DateTime.Now;
            verified = false;
            active = true;
        }

        public User(string init_fName, string init_lName, string init_email, string init_password, int init_phone, string init_paypalID)
        {
            fName = init_fName;
            lName = init_lName;
            email = init_email;
            phone = init_phone;
            password = init_password;
            paypalID = init_paypalID;
            regDate = DateTime.Now;
            verified = false;
            active = true;
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

        public int userPhone
        {
            get
            {
                return phone;
            }
            set
            {
                phone = value;
            }
        }

        public string userPaypalID
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

        public DateTime userRegDate
        {
            get
            {
                return regDate;
            }
            set
            {
                regDate = value;
            }
        }

        public bool userVerified
        {
            get
            {
                return verified;
            }
            set
            {
                verified = value;
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