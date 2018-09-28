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
    public partial class AccountVerification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["userEmail"] != "" && Request.QueryString["userEmail"] != null)
            {
                string email = Request.QueryString["userEmail"];
                UserControls UC = new UserControls();
                Person user = UC.getUserAccount(email);
                int userID = user.userID;
                Session["userID"] = userID;
            }
        }

        protected void VerifyUser(object sender, EventArgs e)
        {
            int userID = (int)Session["userID"];
            string userInput = txtVerficiationCode.Text;
            UserControls UC = new UserControls();
            string verificationCode = UC.getVerificationCode(userID);
            if (userInput != verificationCode)
            {
                errorMessage.Text = "Code does not match";
            }
            else
            {
                string verificationDate = DateTime.Now.ToString("yyyy/MM/dd");
                UC.verifyUser(userID, verificationDate);
                Response.Redirect("RegistrationConfirmation.aspx");
            }
        }

        protected void resendVerificationCode(object sender, EventArgs e)
        {
            string email = Request.QueryString["userEmail"];
            UserControls UC = new UserControls();
            Person user = UC.getUserAccount(email);
            int userID = user.userID;
            string fName = user.userfName;
            string verificationCode = UC.getVerificationCode(userID);
            MailSender MS = new MailSender();
            MS.sendVerificationEmail(email, fName, verificationCode);
        }
    }
}