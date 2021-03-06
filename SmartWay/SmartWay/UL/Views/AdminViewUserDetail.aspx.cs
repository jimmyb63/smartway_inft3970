﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class AdminViewUserDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirects user to Login page if not logged in
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}