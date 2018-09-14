using System;
using SmartWay.BL.Models;
using SmartWay.BL.Controllers;
using SmartWay.DAL.Controllers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string fName = txtFirstName.Text;
                string lName = txtLastName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                int phoneNumber = Convert.ToInt32(txtPhone.Text);
                int paypalID = 20;
                string uNum = "";
                uNum = txtUnitNumber.Text;
                string sNum = txtStreetNumber.Text;
                string sName = txtStreetName.Text;
                string city = txtCity.Text;
                int state = Convert.ToInt32(ddState.SelectedValue);
                string country = txtCountry.Text;
                int pCode = Convert.ToInt32(txtPostcode.Text);
                string verificationCode = randomCodeGen();
                AddressControls AC = new AddressControls();
                UserControls UC = new UserControls();
                int userID = UC.newRegistration(fName, lName, email, password, phoneNumber, uNum, sNum, sName, city, pCode, state, country, verificationCode);
                Session["userID"] = userID;
                //UC.newVerficationCode(verificationCode, userID);
                MailSender MS = new MailSender();
                MS.sendVerificationEmail(email, fName, verificationCode);
                Response.Redirect("AccountVerification.aspx");
                //BL.Models.User newUser = new BL.Models.User(fName, lName, email, password, phoneNumber, payPalID);
                //Address newAddress = new Address(sNum, sName, city, state, pCode, country);
                //AC.addAddress(uNum, sNum, sName, city, pCode, state, country);
                //UC.addPhoneNumber(phoneNumber);
                //UC.addUser(fName, lName, email, password, regoDate);
                //string verificationCode = "JEFF";
                
                //MS.sendVerificationEmail(email, fName, verificationCode);
                //// Add in some verification stuff
                //Response.Redirect("RegistrationConfirmation.aspx");
            }
        }

        protected string randomCodeGen()
        {
            string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
            char[] stringChars = new char[8];
            Random random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            string finalString = new string(stringChars);
            return finalString;
        }
    }
}