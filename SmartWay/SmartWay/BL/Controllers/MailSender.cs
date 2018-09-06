using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace SmartWay.BL.Controllers
{
    public class MailSender
    {
        public void sendVerificationEmail(string toEmail, string fName, string verificationCode)
        {
            MailAddress fromAddress = new MailAddress("bluecloudinft3970@gmail.com", "BlueCloud");
            MailAddress toAddress = new MailAddress(toEmail, fName);
            string fromPassword = "SomethingEasy";
            string subject = "Verify Account";
            string body = getVerificationEmail(verificationCode);
            SmtpClient smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (MailMessage message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }

        public string getVerificationEmail(string code)
        {
            return "Your verification code is: \n\n" + code + "\n\nPlease enter this code to verify your account";
        }
    }
}