using System;
using SmartWay.BL.Controllers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void forgotPassword(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            MailSender MS = new MailSender();
            MS.sendForgotPasswordEmail(email);
            Response.Redirect("Index.aspx");
        }
    }
}