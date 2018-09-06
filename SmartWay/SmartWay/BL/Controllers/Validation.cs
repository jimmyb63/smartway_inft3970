using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace SmartWay.BL.Controllers
{
    public class Validation
    {
        public bool IsValidEmail(String email)
        {
            if (String.IsNullOrEmpty(email)) return false;
            //tries to convert
            try
            {
                MailAddress to = new MailAddress(email);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

        }
    }
}