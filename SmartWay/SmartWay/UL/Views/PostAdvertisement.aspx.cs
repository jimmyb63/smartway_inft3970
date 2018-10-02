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

namespace SmartWay.UL.Views
{
    public partial class PostAdvertisement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void postAd(object sender, EventArgs e)
        {
            string adTitle = txtTitle.Text;
            string adType = rbAdType.SelectedValue;
            string adCategory = rbAdCategory.SelectedValue;
            string adSubCategory = ddSubCategory.SelectedValue;
            decimal adPrice = Convert.ToDecimal(txtPrice.Text);
            string adDescription = txtDescription.Text;
            Person currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;
            int addressID = currentUser.userAddressID;
            AdvertisementControls AC = new AdvertisementControls();
            int adID = AC.newAdvertisement(userID, adTitle, adType, adCategory, adSubCategory, adDescription, addressID, adPrice);
            if (FileUpload1.HasFile)
            {
                int index = 1;
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                Bitmap image = new Bitmap(FileUpload1.FileContent);
                string filePath = adImageUpload(image, index, adID, fileName, currentUser.userID);
                AC.addAdImage(filePath, currentUser.userID, adID);
            }
            if (FileUpload2.HasFile)
            {
                int index = 2;
                string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
                Bitmap image = new Bitmap(FileUpload2.FileContent);
                string filePath = adImageUpload(image, index, adID, fileName, currentUser.userID);
                AC.addAdImage(filePath, currentUser.userID, adID);
            }
            if (FileUpload3.HasFile)
            {
                int index = 3;
                string fileName = Path.GetFileName(FileUpload3.PostedFile.FileName);
                Bitmap image = new Bitmap(FileUpload3.FileContent);
                string filePath = adImageUpload(image, index, adID, fileName, currentUser.userID);
                AC.addAdImage(filePath, currentUser.userID, adID);
            }
            if (FileUpload4.HasFile)
            {
                int index = 4;
                string fileName = Path.GetFileName(FileUpload4.PostedFile.FileName);
                Bitmap image = new Bitmap(FileUpload4.FileContent);
                string filePath = adImageUpload(image, index, adID, fileName, currentUser.userID);
                AC.addAdImage(filePath, currentUser.userID, adID);
            }
            if (FileUpload5.HasFile)
            {
                int index = 5;
                string fileName = Path.GetFileName(FileUpload5.PostedFile.FileName);
                Bitmap image = new Bitmap(FileUpload5.FileContent);
                string filePath = adImageUpload(image, index, adID, fileName, currentUser.userID);
                AC.addAdImage(filePath, currentUser.userID, adID);
            }
            if (FileUpload6.HasFile)
            {
                int index = 6;
                string fileName = Path.GetFileName(FileUpload6.PostedFile.FileName);
                Bitmap image = new Bitmap(FileUpload6.FileContent);
                string filePath = adImageUpload(image, index, adID, fileName, currentUser.userID);
                AC.addAdImage(filePath, currentUser.userID, adID);
            }
        }

        protected string adImageUpload(Bitmap image, int index, int adID, string fileName, int userID)
        {
            string path = "";
            string filePath = "";
            string profileImageFolder = "../Images/AdImg/";
            string fileWithoutExt = Path.GetFileNameWithoutExtension(fileName);
            string fileExtension = Path.GetExtension(fileName.ToLower());
            if (fileExtension == ".jpg" || fileExtension == ".bmp" || fileExtension == ".png")
            {
                if (!Directory.Exists(Server.MapPath(profileImageFolder)))
                {
                    Directory.CreateDirectory(Server.MapPath(profileImageFolder));
                }
                path = Server.MapPath(profileImageFolder) + index + "_" + adID + "_" + userID + fileExtension;
                filePath = profileImageFolder + index + "_" + adID + "_" + userID + fileExtension;
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
            //FileUpload1.SaveAs(profileImageFolder + Path.GetFileName(FileUpload1.FileName));
            
        }

        protected void rbAdCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = rbAdCategory.SelectedValue;
            string constr = ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString; ;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT subCategory FROM AddCategory WHERE category = @category"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add("@category", SqlDbType.VarChar, 30).Value = category;
                    cmd.Connection = con;
                    con.Open();
                    ddSubCategory.DataSource = cmd.ExecuteReader();
                    ddSubCategory.DataTextField = "subCategory";
                    ddSubCategory.DataValueField = "subCategory";
                    ddSubCategory.DataBind();
                    con.Close();
                }
            }
            ddSubCategory.Items.Insert(0, new ListItem("--Select Sub-Category--", "0"));
        }
    }
}