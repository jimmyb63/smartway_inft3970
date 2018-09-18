using SmartWay.BL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userLogout(object sender, EventArgs e)
        {
            Session["log"] = null;
            Session["loggedemail"] = null;
            Session["loggedpassword"] = null;
            Response.Redirect("Logout.aspx");
        }
    }
}