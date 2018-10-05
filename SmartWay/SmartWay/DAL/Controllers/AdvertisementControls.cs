using SmartWay.BL.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SmartWay.DAL.Controllers
{
    [DataObject(true)]
    public class AdvertisementControls
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public int newAdvertisement(int userID, string adTitle, string adType, string adCategory, string adSubCategory, string adDescription, int adAddressID, decimal adPrice)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string procedure = "sp_NewAdvertisement";
            SqlCommand cmd = new SqlCommand(procedure, connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param;
            param = cmd.Parameters.Add("@tempSellerID", SqlDbType.Int);
            param.Value = userID;
            param = cmd.Parameters.Add("@tempTitle", SqlDbType.VarChar, 50);
            param.Value = adTitle;
            param = cmd.Parameters.Add("@tempType", SqlDbType.VarChar, 30);
            param.Value = adType;
            param = cmd.Parameters.Add("@tempCategory", SqlDbType.VarChar, 30);
            param.Value = adCategory;
            param = cmd.Parameters.Add("@tempSubCategory", SqlDbType.VarChar, 30);
            param.Value = adSubCategory;
            param = cmd.Parameters.Add("@tempDescription", SqlDbType.VarChar, 50);
            param.Value = adDescription;
            param = cmd.Parameters.Add("@tempAddressID", SqlDbType.Int);
            param.Value = adAddressID;
            param = cmd.Parameters.Add("@tempPrice", SqlDbType.Decimal);
            param.Value = adPrice;
            param = cmd.Parameters.Add("@returnAdID", SqlDbType.Int);
            param.Direction = ParameterDirection.Output;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            int adID = (int)param.Value;
            return adID;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addAdImage(string filePath, int userID, int adID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "INSERT INTO AddImage (filePath, userID, adID) VALUES(@filePath, @userID, @adID)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@filePath", SqlDbType.VarChar, 260).Value = filePath;
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getAdvertisements()
        {
            List<Advertisement> ads = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "SELECT * FROM Advertisement"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement ad = new Advertisement((int)reader["ID"],
                                        (int)reader["sellerID"],
                                        reader["adType"].ToString(),
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (int)reader["addressID"],
                                        (DateTime)reader["creationDate"], 
                                        (int)reader["categoryID"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                ads.Add(ad);
            }
            connection.Close();
            return ads;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void updateAd(Advertisement ad)
        {
            Advertisement tempAd = ad;
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "UPDATE Advertisement SET active = @active WHERE ID = @adID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@active", SqlDbType.Bit).Value = tempAd.advertisementActive;
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = tempAd.advertisementID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getAdvertisementsCategory(string category)
        {
            string input = category;
            List<Advertisement> ads = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "SELECT adc.category, adv.ID, adv.sellerID, adv.adType, adv.title, adv.adDescription, adv.addressID, adv.creationDate, adv.categoryID, adv.price, adv.active FROM AddCategory adc INNER JOIN Advertisement adv ON adc.ID = adv.categoryID WHERE adc.category = @category AND adc.active = 1 and adv.active = 1";
            //string query = "SELECT * FROM Advertisement"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@category", SqlDbType.VarChar, 260).Value = category;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement ad = new Advertisement((int)reader["ID"],
                                        (int)reader["sellerID"],
                                        reader["adType"].ToString(),
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (int)reader["addressID"],
                                        (DateTime)reader["creationDate"],
                                        (int)reader["categoryID"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                ads.Add(ad);
            }
            connection.Close();
            return ads;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getAdvertisementsSubCategory(string subCategory)
        {
            string input = subCategory;
            List<Advertisement> ads = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "SELECT adc.subCategory, adv.ID, adv.sellerID, adv.adType, adv.title, adv.adDescription, adv.addressID, adv.creationDate, adv.categoryID, adv.price, adv.active FROM AddCategory adc INNER JOIN Advertisement adv ON adc.ID = adv.categoryID WHERE adc.subCategory = @subCategory AND adc.active = 1 and adv.active = 1";
            //string query = "SELECT * FROM Advertisement"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@subCategory", SqlDbType.VarChar, 260).Value = subCategory;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement ad = new Advertisement((int)reader["ID"],
                                        (int)reader["sellerID"],
                                        reader["adType"].ToString(),
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (int)reader["addressID"],
                                        (DateTime)reader["creationDate"],
                                        (int)reader["categoryID"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                ads.Add(ad);
            }
            connection.Close();
            return ads;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getAdvertisement(int adID)
        {
            List<Advertisement> ads = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "SELECT * FROM Advertisement WHERE ID = @adID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement ad = new Advertisement((int)reader["ID"],
                                        (int)reader["sellerID"],
                                        reader["adType"].ToString(),
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (int)reader["addressID"],
                                        (DateTime)reader["creationDate"],
                                        (int)reader["categoryID"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                ads.Add(ad);
            }
            connection.Close();
            return ads;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<string> getAdImages(int adID)
        {
            List<string> adImages = new List<string>();
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "SELECT filePath FROM AddImage WHERE adID = @adID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                string adImage = reader["filePath"].ToString();
                adImages.Add(adImage);
            }
            connection.Close();
            return adImages;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public string getAdThumbnail(int adID, int userID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT filePath FROM AddImage WHERE userID = @userID AND adID = @adID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            connection.Open();
            string filePath = cmd.ExecuteScalar().ToString();
            connection.Close();
            return filePath;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getUserAdvertisements(int tempUserID)
        {
            List<Advertisement> userAdds = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "EXEC sp_SaleItems " + tempUserID; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement ad = new Advertisement(
                                        (int)reader["ID"],
                                        (int)reader["sellerID"],
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (DateTime)reader["creationDate"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                userAdds.Add(ad);
            }
            connection.Close();
            return userAdds;
        }

        public string getconnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
        }
    }
}