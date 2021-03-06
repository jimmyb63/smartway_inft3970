﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWay.UL.Views
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                int adID = Convert.ToInt32(Request.QueryString["advertisementID"]);
                Session["returnURL"] = "Payment.aspx?advertisementID=" + adID;
                Response.Redirect("Login.aspx");
            }
        }
    }
}