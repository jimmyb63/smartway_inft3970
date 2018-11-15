using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*	
	FileName	=	MyMessages.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created September 2018
	Purpose of the File-
		To Handle communications between the UL and BL regarding User's requesting a new Recycling Location. 
		Will show a form to be completed by the logged in User and reviewed by Admin.
*/
namespace SmartWay.UL.Views
{
	public partial class NewRecyclingRequest : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["currentUser"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{
				//Set as DateTime with the time you need
				DateTime openHour = new DateTime(2018, 1, 1, 9, 0, 0);
				DateTime closeHour = new DateTime(2018, 1, 1, 17, 0, 0);
				//Assign that to the text field
				//Monday
				txtTimeMonOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeMonClose.Text = closeHour.ToString("HH\\:mm");
				//Tuesday
				txtTimeTuesOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeTuesClose.Text = closeHour.ToString("HH\\:mm");
				//Wednesday
				txtTimeWedOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeWedClose.Text = closeHour.ToString("HH\\:mm");
				//Thursday
				txtTimeThursOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeThursClose.Text = closeHour.ToString("HH\\:mm");
				//Friday
				txtTimeFriOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeFriClose.Text = closeHour.ToString("HH\\:mm");
				//Saturday
				txtTimeSatOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeSatClose.Text = closeHour.ToString("HH\\:mm");
				//Sunday
				txtTimeSunOpen.Text = openHour.ToString("HH\\:mm");
				txtTimeSunClose.Text = closeHour.ToString("HH\\:mm");
			}
		}

		protected void postAd(object sender, EventArgs e)
		{

		}
	}
}