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

        }

        public List<BL.Models.User> getUsers()
        {
            UserControls UC = new UserControls();
            List<BL.Models.User> users = UC.getUsers();
            return users;
        }

        public void SearchResult_RowCommand(Object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName == "AdvertisementDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                List<BL.Models.User> users = getUsers();
                BL.Models.User user = users[index];
                Session["selectedUser"] = user;
                Response.Redirect("ViewAdvertisement.aspx?advertisementID=" + users[index].userID);
            }
        }
    }
}