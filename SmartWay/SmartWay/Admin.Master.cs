using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void searchUser(object sender, EventArgs e)
        {
            string userSearch = txtUserSearch.Text;
        }

        protected void searchAd(object sender, EventArgs e)
        {
            string adSearch = txtAdSearch.Text;
        }
    }
}