using SmartWay.BL.Controllers;
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

        protected void userLogin(Object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            Validation validate = new Validation();
            validate.IsValidEmail(email);
            // Check email exists, password matches email
            UserControls UC = new UserControls();
            BL.Models.User tempUser = UC.getUserAccount(email);
            if (password != tempUser.userPassword)
            {
                errorMessage.Text = "Incorrect email or Password";
            }
            else
            {
                Session["log"] = tempUser;
                Response.Redirect("Index.aspx");
            }
            //Session["log"] = "logged";
            //Response.Redirect("Index.aspx");
        }
    }
}