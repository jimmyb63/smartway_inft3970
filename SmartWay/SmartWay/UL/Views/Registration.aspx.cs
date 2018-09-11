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
                string uNum = txtUnitNumber.Text;
                string sNum = txtStreetNumber.Text;
                string sName = txtStreetName.Text;
                string city = txtCity.Text;
                string state = txtState.Text;
                string country = txtCountry.Text;
                int pCode = Convert.ToInt32(txtPostcode.Text);
                string regoDate = DateTime.Now.ToString("yyyy/MM/dd");
                //BL.Models.User newUser = new BL.Models.User(fName, lName, email, password, phoneNumber, payPalID);
                //Address newAddress = new Address(sNum, sName, city, state, pCode, country);
                AddressControls AC = new AddressControls();
                UserControls UC = new UserControls();
                int stateID = AC.getStateID(state);
                int addressID = AC.addAddress(uNum, sNum, sName, city, stateID, pCode, country, true);
                int phoneID = UC.addPhoneNumber(phoneNumber);
                UC.addUser(fName, lName, email, phoneID, addressID, paypalID, password, regoDate);
                string verificationCode = "JEFF";
                MailSender MS = new MailSender();
                MS.sendVerificationEmail(email, fName, verificationCode);
                // Add in some verification stuff
                Response.Redirect("RegistrationConfirmation.aspx");
            }
        }
    }
}