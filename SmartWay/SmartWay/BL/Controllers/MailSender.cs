﻿using System;
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
            //Mail Settings for GoDaddy

            //MailAddress fromAddress = new MailAddress("admin@smartwayapp.net", "SmartWay");
            //MailAddress toAddress = new MailAddress(toEmail, fName);
            //string fromPassword = "@SomethingEasy1";
            //string subject = "Verify Account";
            //string body = getVerificationEmail(verificationCode);
            //SmtpClient smtp = new SmtpClient
            //{
            //    Host = "relay-hosting.secureserver.net",
            //    Port = 25,
            //    EnableSsl = false,
            //    UseDefaultCredentials = false,
            //    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            //};
            //using (MailMessage message = new MailMessage(fromAddress, toAddress)
            //{
            //    Subject = subject,
            //    Body = body
            //})
            //{
            //    message.IsBodyHtml = true;
            //    smtp.Send(message);
            //}

            //Mail Settings for Gmail - Not compatible with GoDaddy

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

        public void sendForgotPasswordEmail(string email, string password)
        {
            //Mail Settings for GoDaddy

            //MailAddress fromAddress = new MailAddress("admin@smartwayapp.net", "SmartWay");
            //MailAddress toAddress = new MailAddress(email);
            //string fromPassword = "@SomethingEasy1";
            //string subject = "Reset Password";
            //string body = getForgotPasswordEmail(email, password);
            //SmtpClient smtp = new SmtpClient
            //{
            //    Host = "relay-hosting.secureserver.net",
            //    Port = 25,
            //    EnableSsl = false,
            //    //DeliveryMethod = SmtpDeliveryMethod.Network,
            //    UseDefaultCredentials = false,
            //    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            //};
            //using (MailMessage message = new MailMessage(fromAddress, toAddress)
            //{
            //    Subject = subject,
            //    Body = body
            //})
            //{
            //    message.IsBodyHtml = true;
            //    smtp.Send(message);
            //}

            //Mail Settings for Gmail - Not compatible with GoDaddy

            MailAddress fromAddress = new MailAddress("bluecloudinft3970@gmail.com", "BlueCloud");
            MailAddress toAddress = new MailAddress(email);
            string fromPassword = "SomethingEasy";
            string subject = "Reset Password";
            string body = getForgotPasswordEmail(email, password);
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

            public void sendContactAdmin(string fName, string lName, string email, string content)
        {
                //Mail Settings for GoDaddy

                //MailAddress fromAddress = new MailAddress("admin@smartwayapp.net", "SmartWay");
                //MailAddress toAddress = new MailAddress("Admin@smartwayapp.net");
                //string fromPassword = "@SomethingEasy1";
                //string userFirstName = fName;
                //string userLastName = lName;
                //string userEmail = email;
                //string userContent = content;
                //string subject = "Query from " + userFirstName + " " + userLastName;
                //string body = getContactAdmin(userEmail, userFirstName, userLastName, userContent);
                //SmtpClient smtp = new SmtpClient
                //{
                //    Host = "relay-hosting.secureserver.net",
                //    Port = 25,
                //    EnableSsl = false,
                //    UseDefaultCredentials = false,
                //    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                //};
                //using (MailMessage message = new MailMessage(fromAddress, toAddress)
                //{
                //    Subject = subject,
                //    Body = body
                //})
                //{
                //    message.IsBodyHtml = true;
                //    smtp.Send(message);
                //}

                //Mail Settings for Gmail - Not compatible with GoDaddy

                MailAddress fromAddress = new MailAddress("bluecloudinft3970@gmail.com", "BlueCloud");
                MailAddress toAddress = new MailAddress("bluecloudinft3970@gmail.com");
                string fromPassword = "SomethingEasy";
                string userFirstName = fName;
                string userLastName = lName;
                string userEmail = email;
                string userContent = content;
                string subject = "Query from " + userFirstName + " " + userLastName;
                string body = getContactAdmin(userEmail, userFirstName, userLastName, userContent);
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

            public string getContactAdmin(string email, string fName, string lName, string content)
        {
            return "<h2>Query from user: " + fName + " " + lName + "</h2>" +
                   "<br/><br/>" +
                   "<p>The following message is a question or query from user " + fName + " " + lName + "</p>" +
                   "<p><u>Message content: </u></p>" +
                   "<p>" + content + "</p>" +
                   "<p>User's contact email: " + email + "</p>";
        }

        public string getForgotPasswordEmail(string email, string password)
        {
            return "<h2>Reset password</h2>" + 
                   "<br/><br/>" +
                   "<p>Your password is: " + "<b>" + password + "</b></p>";

        }

        public string getVerificationEmail(string code)
        {
            return "<div style=\"text-align:center\"></div>" + 
                   "<h2>Verify your Account</h2>" + 
                   "<br/>" + 
                   "<p>Your verification code is: </p>" + 
                   "<br/>" + 
                   "<p><b>" + code + "</b></p>" + 
                   "<br/>" + 
                   "<p>Please enter this code to verify your account</p>" + 
                   "</div>";
        }
    }
}