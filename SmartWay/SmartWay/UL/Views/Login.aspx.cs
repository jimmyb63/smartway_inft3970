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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Uses the email address and password provided to access a user account
        /// </summary>
        protected void userLogin(Object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            Validation validate = new Validation();
            // Checks if valid email address format
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
                        if (Session["returnURL"] != null)
                        {
                            string returnURL = Session["returnURL"].ToString();
                            Session["returnURL"] = null;
                            Response.Redirect(returnURL);
                        }
                        else
                        {
                            Response.Redirect("Index.aspx");
                        }
                    }
                }
                else
                {
                    Response.Redirect("AccountVerification.aspx?userEmail=" + email);
                }
            }
        }
    }
}