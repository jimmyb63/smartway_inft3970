using System;
using SmartWay.BL.Controllers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartWay.DAL.Controllers;
using SmartWay.BL.Models;

namespace SmartWay.UL.Views
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Sends user an email when password has been forgotten
        /// </summary>
        public void forgotPassword(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            UserControls UC = new UserControls();
            Person tempUser = UC.getUserAccount(email);
            MailSender MS = new MailSender();
            string password = tempUser.userPassword;
            MS.sendForgotPasswordEmail(email, password);

            Response.Redirect("passwordResetConfirmation.aspx");
        }
    }
}