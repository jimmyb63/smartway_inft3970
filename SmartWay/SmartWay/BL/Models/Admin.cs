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
            phone = 0;
            password = null;
            paypalID = null;
            regDate = DateTime.Now;
            verified = false;
            active = true;
            position = "ADMIN";
        }

        public Admin(string init_fName, string init_lName, string init_email, string init_password, int init_phone, string init_paypalID, string init_position)
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

        public int adminPhone
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

        public string adminPaypalID
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

        public DateTime adminRegDate
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

        public bool adminVerified
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

        public bool adminActive
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