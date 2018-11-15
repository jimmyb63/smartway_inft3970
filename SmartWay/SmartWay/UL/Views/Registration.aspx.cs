using System;
using SmartWay.BL.Controllers;
using SmartWay.DAL.Controllers;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace SmartWay.UL.Views
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// All user specific data is captured and new user is registered
        /// </summary>
        protected void RegisterUser(object sender, EventArgs e)
        {
            // If client side validation is valid
            if (IsValid)
            {
                AddressControls AC = new AddressControls();
                UserControls UC = new UserControls();
                MailSender MS = new MailSender();
                SMSSender SS = new SMSSender();
                string uName = txtUsername.Text;
                bool uNameExists = UC.uNameValidation(uName);
                string email = txtEmail.Text;
                bool emailExists = UC.emailValidation(email);
                // Database is checked to see if the username or email entered already exists
                if (uNameExists)
                {
                    errorMessage.Text = "Username already exists";
                }
                else if (emailExists)
                {
                    errorMessage.Text = "Email already exists";
                }
                else
                { 
                    string fName = txtFirstName.Text;
                    string lName = txtLastName.Text;
                    string DOB = txtDOB.Text;
                    string password = txtPassword.Text;
                    int phoneNumber = Convert.ToInt32(txtPhone.Text);
                    string uNum = "";
                    uNum = txtUnitNumber.Text;
                    string sNum = txtStreetNumber.Text;
                    string sName = txtStreetName.Text;
                    string city = txtCity.Text;
                    int state = Convert.ToInt32(ddState.SelectedValue);
                    string country = txtCountry.Text;
                    int pCode = Convert.ToInt32(txtPostcode.Text);
                    string verificationCode = randomCodeGen();
                    // New user is created in database and ID is returned
                    int userID = UC.newRegistration(fName, lName, uName, DOB, email, password, phoneNumber, uNum, sNum, sName, city, pCode, state, country, verificationCode);
                    // Checks if profile picture has been uploaded
                    if (FileUpload1.HasFile)
                    {
                        string filePath = profileImageUpload(userID);
                        UC.addProfileImage(filePath, userID);
                    }
                    Session["userID"] = userID;
                    // Sends verification code via the supplied email address
                    MS.sendVerificationEmail(email, fName, verificationCode);
                    // Due to twilio trial account on these numbers can be sent SMS messages for verification
                    if (phoneNumber == 0422628242 || phoneNumber == 0434837691 || phoneNumber == 0421030606 || phoneNumber == 0466548976 || phoneNumber == 0450025977 || phoneNumber == 0439627096)
                    {
                        // Sends verification code via SMS to supplied phone number
                        SS.SendSMS(phoneNumber, verificationCode);
                    }
                    Response.Redirect("AccountVerification.aspx");
                }
                    
            }
        }

        /// <summary>
        /// Gets the image uploaded for profile image and resizes it to a maximum height or width of 100px,
        /// image file is saved to a location on the server and the filepath is stored in database.
        /// </summary>
        /// <param name="userID"></param>
        /// <returns>String filepath</returns>
        protected string profileImageUpload(int userID)
        {
            string path = "";
            string filePath = "";
            string profileImageFolder = "../Images/ProfileImg/";
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileWithoutExt = Path.GetFileNameWithoutExtension(fileName);
            string fileExtension = Path.GetExtension(fileName.ToLower());
            if (fileExtension == ".jpg" || fileExtension == ".bmp" || fileExtension == ".png")
            {
                if (!Directory.Exists(Server.MapPath(profileImageFolder)))
                {
                    Directory.CreateDirectory(Server.MapPath(profileImageFolder));
                }
                path = Server.MapPath(profileImageFolder) + userID + fileExtension;
                filePath = profileImageFolder + userID + fileExtension;
                //FileUpload1.PostedFile.SaveAs(path);
                Bitmap originalImage = new Bitmap(FileUpload1.FileContent);

                // Calculate the new image dimensions
                int thumbnailSize = 100;
                int newWidth, newHeight;
                if (originalImage.Width > originalImage.Height)
                {
                    newWidth = thumbnailSize;
                    newHeight = originalImage.Height * thumbnailSize / originalImage.Width;
                }
                else
                {
                    newWidth = originalImage.Width * thumbnailSize / originalImage.Height;
                    newHeight = thumbnailSize;
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

        /// <summary>
        /// Generates a random 8 digit verification code consisting of alpha-numeric characters
        /// </summary>
        /// <returns>String code</returns>
        protected string randomCodeGen()
        {
            string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
            char[] stringChars = new char[8];
            Random random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            string finalString = new string(stringChars);
            return finalString;
        }
    }
}