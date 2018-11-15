using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using SmartWay.DAL.Controllers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using SmartWay.BL.Models;
using System.Text;

/*	
	FileName	=	PostForumThread.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created September 2018
	Purpose of the File-
		To Handle communications between the UL and BL regarding Forum Posts. 
		Will show a form to be completed by the logged in User.
*/
namespace SmartWay.UL.Views
{
	public partial class PostForumThread : System.Web.UI.Page
	{
		//Variables
		ForumControls FC = new ForumControls();
		UserControls UC = new UserControls();
		Person currentUser = new Person();
		List<ForumTag> tempTagsSelected = new List<ForumTag>();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["currentUser"] == null)
			{
				Session["returnURL"] = "PostForumThread.aspx";
				Response.Redirect("Login.aspx");
			}
		}

		/// <summary>
		/// Generate a List of All available forum tags
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		public void getForumTags(object sender, EventArgs e)
		{

			ForumControls FC = new ForumControls();
			List<ForumTag> tempTagList = FC.getForumTags();
			cblForumTags.DataSource = tempTagList;
			cblForumTags.DataTextField = "forumTagName";
			cblForumTags.DataValueField = "forumTagID";
			cblForumTags.DataBind();
		}

		/// <summary>
		/// Add ForumPost Details to the database via DAL.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void postForumPost(object sender, EventArgs e)
		{
			string tempDescription = txtDescription.Text;
			currentUser = (Person)Session["currentUser"];
			string forumTitle = txtTitle.Text;
			int userID = currentUser.userID;
			string tempFilePath = "";
			int forumID = FC.addForumPost(userID, forumTitle, tempDescription, tempFilePath);
			if (FileUpload1.HasFile)
			{
				int index = 1;
				string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
				Bitmap image = new Bitmap(FileUpload1.FileContent);
				string filePath = forumImageUpload(image, index, forumID, fileName, currentUser.userID);
				FC.addForumImage(filePath, currentUser.userID, forumID);
			}
			if (FileUpload2.HasFile)
			{
				int index = 2;
				string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
				Bitmap image = new Bitmap(FileUpload2.FileContent);
				string filePath = forumImageUpload(image, index, forumID, fileName, currentUser.userID);
				FC.addForumImage(filePath, currentUser.userID, forumID);
			}

			//To Add  Tags Linked to ForumPost
			if (cblForumTags.SelectedItem != null)
			{
				List<ForumTag> currentTagsSelected = new List<ForumTag>();
				foreach (ListItem li in cblForumTags.Items)
				{
					if (li.Selected)
					{
						int tempID = Convert.ToInt32(li.Value);
						ForumTag tempTag = new ForumTag(tempID, li.Text);
						currentTagsSelected.Add(tempTag);
					}
				}
				FC.addForumTagsToForumPost(currentTagsSelected, forumID);
			}
			
			Response.Redirect("ForumPostConfirmation.aspx?forumID=" + forumID);



		}
		/// <summary>
		/// Add A forum Tag to the Selected List when clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void cblForumTags_SelectedIndexChanged
				(object sender, EventArgs e)
		{
			{
				StringBuilder sb = new StringBuilder();
				sb.Append("Selected are:");
				foreach (ListItem li in cblForumTags.Items)
				{
					if (li.Selected)
					{
						sb.Append("<br/>" + li.Value + " - " + li.Text);
					}
				}
				lblTestData.Text = sb.ToString();
			}
		}

		/// <summary>
		/// Upload a Forum Post image to the database, via DAL
		/// </summary>
		/// <param name="image"></param>
		/// <param name="index"></param>
		/// <param name="forumID"></param>
		/// <param name="fileName"></param>
		/// <param name="userID"></param>
		/// <returns></returns>
		protected string forumImageUpload(Bitmap image, int index, int forumID, string fileName, int userID)
		{
			string path = "";
			string filePath = "";
			string forumImageFolder = "../Images/ForumImg/";
			string fileWithoutExt = Path.GetFileNameWithoutExtension(fileName);
			string fileExtension = Path.GetExtension(fileName.ToLower());
			if (fileExtension == ".jpg" || fileExtension == ".bmp" || fileExtension == ".png")
			{
				if (!Directory.Exists(Server.MapPath(forumImageFolder)))
				{
					Directory.CreateDirectory(Server.MapPath(forumImageFolder));
				}
				path = Server.MapPath(forumImageFolder) + index + "_" + forumID + "_" + userID + fileExtension;
				filePath = forumImageFolder + index + "_" + forumID + "_" + userID + fileExtension;
				//FileUpload1.PostedFile.SaveAs(path);
				Bitmap originalImage = image;

				// Calculate the new image dimensions
				int maxSize = 800;
				int newWidth, newHeight;
				if (originalImage.Width > 800 || originalImage.Height > 800)
				{
					if (originalImage.Width > originalImage.Height)
					{
						newWidth = maxSize;
						newHeight = originalImage.Height * maxSize / originalImage.Width;
					}
					else
					{
						newWidth = originalImage.Width * maxSize / originalImage.Height;
						newHeight = maxSize;
					}
				}
				else
				{
					newWidth = originalImage.Width;
					newHeight = originalImage.Height;
				}

				// Create a new bitmap which will hold the previous resized bitmap
				Bitmap newImage = new Bitmap(originalImage, newWidth, newHeight);
				// Create a graphic based on the new bitmap
				Graphics oGraphics = Graphics.FromImage(newImage);

				// Set the properties for the new graphic file
				oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
				// Draw the new graphic based on the resized bitmap
				oGraphics.DrawImage(originalImage, 0, 0, newWidth, newHeight);

				// Save the new graphic file to the server
				newImage.Save(path);

				// Once finished with the bitmap objects, we deallocate them.
				originalImage.Dispose();
				newImage.Dispose();
				oGraphics.Dispose();
			}
			else
			{
				errorMessage.Text = "Image format is not correct";
			}
			return filePath;
			//FileUpload1.SaveAs(forumImageFolder + Path.GetFileName(FileUpload1.FileName));
		}

		/// <summary>
		/// Redirects to Page to add a forum tag
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void btnAddforumTag_Click(object sender, EventArgs e)
		{
			//Redirect To NewForumTag.aspx
			Response.Redirect("NewForumTag.aspx");
		}

		/// <summary>
		/// Displays a list of what is currently included in the Selected Tags List.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void cblForumTags_SelectedIndexChanged1(object sender, EventArgs e)
		{
			if (cblForumTags.SelectedItem == null)
			{
				lblTestData.Text = "<br />No Selections Made.";
			}
			else
			{
				List<ForumTag> currentTagsSelected = new List<ForumTag>();
				StringBuilder sb = new StringBuilder();
				sb.Append("Selected are:");
				foreach (ListItem li in cblForumTags.Items)
				{
					if (li.Selected)
					{
						sb.Append("<br/>" + li.Value + " - " + li.Text);
						int tempID = Convert.ToInt32(li.Value);
						ForumTag tempTag = new ForumTag(tempID, li.Text);
						currentTagsSelected.Add(tempTag);
					}
				}
				lblTestData.Text = sb.ToString();
				tempTagsSelected = currentTagsSelected;
			}
		}
	}
}