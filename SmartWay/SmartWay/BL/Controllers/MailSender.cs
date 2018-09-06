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
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
        }

        public void sendForgotPasswordEmail(string email)
        {
            MailAddress fromAddress = new MailAddress("bluecloudinft3970@gmail.com", "BlueCloud");
            MailAddress toAddress = new MailAddress(email);
            string fromPassword = "SomethingEasy";
            string subject = "Reset Password";
            string body = getForgotPasswordEmail(email);
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
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
        }

        public string getForgotPasswordEmail(string email)
        {
            return "<h2>Reset password</h2>" + 
                   "<br/><br/>" +
                   "Please click the link to reset your password:" +
                   "<br/>" +
                   "<insert link here>";

        }

        public string getVerificationEmail(string code)
        {
            return "<div style=\"text-align:center\"></div>" + 
                   "<h2>Verify your Account</h2>" + 
                   "<br/>" + 
                   "Your verification code is: " + 
                   "<br/>" + 
                   "<p><b>" + code + "</b></p>" + 
                   "<br/>" + 
                   "Please enter this code to verify your account" + 
                   "</div>";
        }
    }
}