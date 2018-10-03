using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace SmartWay.BL.Controllers
{
    public class SMSSender
    {
        public void SendSMS(int phoneNumber, string verificationCode)
        {
            // Find your Account Sid and Token at twilio.com/console
            const string accountSid = "AC6c5ab9a7066d32666fb2c8326bd7ae95";
            const string authToken = "e9e678328a83826732f5c22aae1deeb3";
            string phone = Convert.ToString(phoneNumber);

            TwilioClient.Init(accountSid, authToken);

            var message = MessageResource.Create(
                body: "Your SmartWay Verification code is: " + verificationCode,
                from: new Twilio.Types.PhoneNumber("+61437767275"),
                to: new Twilio.Types.PhoneNumber("+61" + phone)
            );
        }
    }
}