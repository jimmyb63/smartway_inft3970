using SmartWay.BL.Controllers;
using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                //Sesion Exists and User was Passed through.
                //Local Variables
                UserControls UC = new UserControls();
                Person currentUser = new Person();
                Address currentUserAddress = new Address();
                Person currentUserPhone = new Person();

                currentUser = (Person)Session["currentUser"];
                int userID = currentUser.userID;
                string fName = currentUser.userfName;
                string lName = currentUser.userlName;
                string uName = currentUser.userName;
                string DOB = currentUser.userDOB;
                string email = currentUser.userEmail;
                int phoneID = currentUser.userPhoneID;
                int addressID = currentUser.userAddressID;
                int paypalID = currentUser.userPaypalID;
                //Populate Phone
                int phoneNumber = UC.getPhoneNumber(phoneID);

                //Populate Address
                currentUserAddress= UC.getUserAddress(addressID);
                string unitNum = currentUserAddress.addressUnitNum;
                string streetNum = currentUserAddress.addressStreetNum;
                string streetName = currentUserAddress.addressStreetName;
                string stateName = currentUserAddress.addressState;
                string city = currentUserAddress.addressCity;
                int postCode = currentUserAddress.addressPostCode;
                string country = currentUserAddress.addressCountry;


                //Update the Labels
                //Details
                lblUserName.Text = uName;
                lblFName.Text = fName;
                lblLName.Text = lName;
                lblEmail.Text = email;
                lblDOB.Text = uName;
                lblPhoneNumber.Text = phoneNumber.ToString();

                //Address
                lblUnitNum.Text = unitNum;
                lblStreetNum.Text = streetNum;
                lblStreetName.Text = streetName;
                lblCity.Text = city;
                lblState.Text = stateName;
                lblCountry.Text = country;
                lblPostcode.Text = postCode.ToString();

            }


        }
    }
}