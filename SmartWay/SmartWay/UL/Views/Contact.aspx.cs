using System;
using SmartWay.BL.Controllers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Email is sent to admin email address
        /// </summary>
        public void contactAdmin(object sender, EventArgs e)
        {
            string userFirstName = txtFirstName.Text;
            string userLastName = txtLastName.Text;
            string userEmail = txtEmail.Text;
            string content = txtContent.Text;
            MailSender MS = new MailSender();
            MS.sendContactAdmin(userFirstName, userLastName, userEmail, content);
            Response.Redirect("Index.aspx");
        }
    }
}