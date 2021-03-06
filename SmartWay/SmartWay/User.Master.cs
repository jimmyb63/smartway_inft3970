﻿using SmartWay.BL.Controllers;
using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
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
            checkAnimation();
        }

        protected void userLogout(object sender, EventArgs e)
        {
            Session["currentUser"] = null;
            Session.Abandon();
            Response.Redirect("LogoutConfirmation.aspx");
        }

        public void searchLg(object sender, EventArgs e)
        {
            string search = txtSearchLg.Text;
            Response.Redirect("ViewAdvertisementList.aspx?search=" + search);
        }

        public void searchSm(object sender, EventArgs e)
        {
            string search = txtSearchSm.Text;
            Response.Redirect("ViewAdvertisementList.aspx?search=" + search);
        }

        protected void userLogin(Object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            Validation validate = new Validation();
            validate.IsValidEmail(email);
            // Check email exists, password matches email
            UserControls UC = new UserControls();
            Person tempUser = UC.getUserAccount(email);
            Staff tempAdmin = UC.getAdminAccount(email);
            if (tempAdmin.adminEmail != null)
            {
                if (password != tempAdmin.adminPassword)
                {
                    errorMessage.Text = "Incorrect email or Password";
                }
                else
                {
                    //if (tempUser.userAdmin == "admin")
                    Session["currentAdmin"] = tempAdmin;
                    Response.Redirect("AdminReviewUsers.aspx");
                }
            }
            else if (tempUser.userEmail != null)
            {
                if (UC.checkVerified(tempUser.userEmail))
                {
                    if (password != tempUser.userPassword)
                    {
                        errorMessage.Text = "Incorrect email or Password";
                    }
                    else
                    {
                        //if (tempUser.userAdmin == "admin")
                        Session["currentUser"] = tempUser;
                        Session["animationsPlayed"] = "false";
                        Response.Redirect("Index.aspx");
                    }
                }
                else
                {
                    Response.Redirect("AccountVerification.aspx?userEmail=" + email);
                }
            }

            //Session["log"] = "logged";
            //Response.Redirect("Index.aspx");
        }

        public void checkAnimation()
        {
            if (Session["animationsPlayed"] != null)
            {
                string hasPlayed = Session["animationsPlayed"].ToString();
                if (hasPlayed == "true")
                {
                    animations.Attributes["class"] = animations.Attributes["class"].Replace("animated", "");
                }
                else
                {
                    Session["animationsPlayed"] = "true";
                }
            }
        }

    }
}