using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class Staff : Person 
    {
        private string position;

        public Staff()
        {
            ID = 0;
            fName = null;
            lName = null;
            email = null;
            password = null;
            position = null;
        }

        public Staff(int init_ID, string init_fName, string init_lName, string init_email, string init_password, string init_position)
        {
            ID = init_ID;
            fName = init_fName;
            lName = init_lName;
            email = init_email;
            password = init_password;
            position = init_position;
        }

        public int adminID
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