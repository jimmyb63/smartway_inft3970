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
    public partial class AdminReviewUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentAdmin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        /// <summary>
        /// Populates a list of users
        /// </summary>
        /// <returns>List of Person objects</returns>
        public List<Person> getUsers()
        {
            UserControls UC = new UserControls();
            List<Person> users = UC.getUsers();
            return users;
        }

        /// <summary>
        /// Redirects users to a details page of the selected user
        /// </summary>
        public void SearchResult_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UserDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                List<Person> users = getUsers();
                Person user = users[index];
                Session["selectedUser"] = user;
                Response.Redirect("AdminViewUserDetail.aspx?userID=" + users[index].userID);
            }
        }
    }
}