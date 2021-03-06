﻿using SmartWay.BL.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/*	
	FileName	=	AdvertisementControls.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		To Handle communications between the BL and Database regarding Advertisement Actions
*/

namespace SmartWay.DAL.Controllers
{
    [DataObject(true)]
    public class AdvertisementControls
    {
        /// <summary>
        /// Add new advertisement details to the database.
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="adTitle"></param>
        /// <param name="adType"></param>
        /// <param name="adCategory"></param>
        /// <param name="adSubCategory"></param>
        /// <param name="adDescription"></param>
        /// <param name="adAddressID"></param>
        /// <param name="adPrice"></param>
        /// <returns></returns>
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
            param = cmd.Parameters.Add("@tempDescription", SqlDbType.VarChar, 250);
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

        /// <summary>
        /// Add an Image to be linked to an advertisement in the database.
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="userID"></param>
        /// <param name="adID"></param>
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

        /// <summary>
        /// Get all advertisements that exist in the database
        /// </summary>
        /// <returns></returns>
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

        /// <summary>
        /// update advertisement details that exist in a database.
        /// </summary>
        /// <param name="ad"></param>
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

        /// <summary>
        /// Get Advertisement's that match the search word list.
        /// </summary>
        /// <param name="searchList"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getAdvertisementsSearch(List<string> searchList)
        {
            List<Advertisement> ads = new List<Advertisement>();
            List<string> list = searchList;
            string searchWord = "";
            for (int i = 0; i < list.Count; i++)
            {
                searchWord = list[i];
                SqlConnection connection = new SqlConnection(getconnectionString());
                string procedure = "sp_SearchSaleItemsByTitle";
                SqlCommand cmd = new SqlCommand(procedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param;
                param = cmd.Parameters.Add("@tempSearchWord", SqlDbType.VarChar, 30);
                param.Value = searchWord;
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
            }
            return ads;
        }

        /// <summary>
        /// Get Advertisement add categories from the database.
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Get Advertisement Subcategories from the database.
        /// </summary>
        /// <param name="subCategory"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Get advertisement details via the Ad Id from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Get advertisement images related to an Ad Id from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public string getAdImage(int adID)
        {
            List<string> adImages = new List<string>();
            adImages = getAdImages(adID);
            string adImage = adImages[0];
            return adImage;
        }

        /// <summary>
        /// Get advertisement images related to an Ad Id from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
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
            //Adds default Ad image if the list is empty
            if (adImages.Count < 1)
            {
                List<string> defaultImages = new List<string>();
                defaultImages.Add("../Images/DefaultImg/GenericAddImage.png");
                adImages = defaultImages;
            }
            connection.Close();
            return adImages;
        }

        /// <summary>
        /// Gets Ad thumbnail image from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <param name="userID"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Get Advertisements related to a User's ID.
        /// </summary>
        /// <param name="tempUserID"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Get advertisements that have sold related to a Ad's ID from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getSoldUserAdvertisement(int adID)
        {
            List<Advertisement> userAdds = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            //string query = "EXEC sp_SaleItems " + tempUserID; //the sql request
            //SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            string query = "SELECT * FROM Advertisement WHERE ID = @adID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement tempAd = new Advertisement(
                                        (int)reader["ID"],
                                        (int)reader["sellerID"],
                                        (int)reader["buyerID"],
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (DateTime)reader["dateCompleted"],
                                        (DateTime)reader["creationDate"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                userAdds.Add(tempAd);
            }
            connection.Close();
            return userAdds;
        }

        /// <summary>
        /// Get advertisements that have sold related to a User's ID from the database.
        /// </summary>
        /// <param name="tempUserID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Advertisement> getSoldUserAdvertisements(int tempUserID)
        {
            List<Advertisement> userAdds = new List<Advertisement>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            //string query = "EXEC sp_SaleItems " + tempUserID; //the sql request
            //SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            string query = "SELECT * FROM Advertisement WHERE sellerID = @userID AND buyerID IS NOT NULL"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = tempUserID;
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement tempAd = new Advertisement(
                                        (int)reader["ID"],
                                        (int)reader["sellerID"],
                                        (int)reader["buyerID"],
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (DateTime)reader["dateCompleted"],
                                        (DateTime)reader["creationDate"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                userAdds.Add(tempAd);
            }
            connection.Close();
            return userAdds;
        }

        /// <summary>
        /// Adds to the view count of an Ad in the database.
        /// </summary>
        /// <param name="adID"></param>
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addViewCount(int adID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "INSERT INTO ViewCounter (adID) VALUES (@adID)"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Updates View count of an Ad in the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <param name="viewCount"></param>
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void updateViewCount(int adID, int viewCount)
        {
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "UPDATE ViewCounter SET viewCount = @viewCount WHERE adID = @adID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@viewCount", SqlDbType.Int).Value = viewCount;
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Get the current view count of an Ad from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public int getViewCount(int adID)
        {
            int viewCount = 0;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT viewCount FROM ViewCounter WHERE adID = @adID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            connection.Open();
            viewCount = (int)cmd.ExecuteScalar();
            connection.Close();
            return viewCount;
        }

        /// <summary>
        /// Add's a User's rating for a seller and an Ad in the database.
        /// </summary>
        /// <param name="rating"></param>
        /// <param name="comment"></param>
        /// <param name="buyerID"></param>
        /// <param name="sellerID"></param>
        /// <param name="adID"></param>
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void submitFeedback(int rating, string comment, int buyerID, int sellerID, int adID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "INSERT INTO FeedBack (sellerID, buyerID, addID, rating, comment) VALUES (@sellerID, @buyerID, @adID, @rating, @comment)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@buyerID", SqlDbType.Int).Value = buyerID;
            cmd.Parameters.Add("@sellerID", SqlDbType.Int).Value = sellerID;
            cmd.Parameters.Add("@rating", SqlDbType.Int).Value = rating;
            cmd.Parameters.Add("@comment", SqlDbType.VarChar, 75).Value = comment;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Get a List of Offers related to an Ad Id from the database.
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Offer> getUserOffers(int userID)
        {
            List<Offer> offers = new List<Offer>();
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT ID, buyerID, sellerID, addID, offerAmount, offerAccepted, active FROM AddOffer WHERE buyerID = @userID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Offer offer = new Offer((int)reader["ID"],
                                            (int)reader["buyerID"],
                                            (int)reader["sellerID"],
                                            (int)reader["addID"],
                                            (decimal)reader["offerAmount"],
                                            (int)reader["offerAccepted"],
                                            (bool)reader["active"]);
                offers.Add(offer);
            }
            connection.Close();
            return offers;
        }

        /// <summary>
        /// Adds a User's Ad offer to the database.
        /// </summary>
        /// <param name="buyerID"></param>
        /// <param name="sellerID"></param>
        /// <param name="adID"></param>
        /// <param name="offerAmount"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public int makeOffer(int buyerID, int sellerID, int adID, decimal offerAmount)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string procedure = "sp_NewAddOffer";
            SqlCommand cmd = new SqlCommand(procedure, connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param;
            param = cmd.Parameters.Add("@tempBuyerID", SqlDbType.Int);
            param.Value = buyerID;
            param = cmd.Parameters.Add("@tempSellerID", SqlDbType.Int);
            param.Value = sellerID;
            param = cmd.Parameters.Add("@tempAddID", SqlDbType.Int);
            param.Value = adID;
            param = cmd.Parameters.Add("@tempOfferAmount", SqlDbType.Decimal);
            param.Value = offerAmount;
            param = cmd.Parameters.Add("@returnCode", SqlDbType.Int);
            param.Direction = ParameterDirection.Output;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            int returnCode = (int)param.Value;
            return returnCode;
        }

        /// <summary>
        /// Get's the count of how many offers exist for an Ad from the database.
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public int getOfferCount(int adID)
        {
            int count = 0;
            bool active = true;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT COUNT(ID) FROM AddOffer WHERE addID = @adID AND active = @active";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@active", SqlDbType.Bit).Value = active;
            connection.Open();
            count = (int)cmd.ExecuteScalar();
            return count;
        }

        /// <summary>
        /// Checks the database for if the Ad exists
        /// </summary>
        /// <param name="adID"></param>
        /// <param name="userID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public bool offerExists(int adID, int userID)
        {
            int count = 0;
            bool active = false;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT COUNT(ID) FROM AddOffer WHERE addID = @adID AND buyerID = @userID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            connection.Open();
            count = (int)cmd.ExecuteScalar();
            if (count > 0)
            {
                active = true;
            }
            return active;
        }

        /// <summary>
        /// Cancel an Offer in the database that was made by a user.
        /// </summary>
        /// <param name="offerID"></param>
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void cancelOffer(int offerID)
        {
            bool cancel = false;
            int declined = 0;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET active = @cancel, offerAccepted = @declined WHERE ID = @offerID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@offerID", SqlDbType.Int).Value = offerID;
            cmd.Parameters.Add("@cancel", SqlDbType.Bit).Value = cancel;
            cmd.Parameters.Add("@declined", SqlDbType.Int).Value = declined;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Updates an old offer to active in the database.
        /// </summary>
        /// <param name="adID"></param>
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void reactivateOffers(int adID)
        {
            int pending = 2;
            int otherOffer = 3;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET offerAccepted = @pending WHERE addID = @adID AND offerAccepted = @otherOffer";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@pending", SqlDbType.Bit).Value = pending;
            cmd.Parameters.Add("@otherOffer", SqlDbType.Bit).Value = otherOffer;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Update offer accepted by the Seller in the Database
        /// </summary>
        /// <param name="accepted"></param>
        /// <param name="offerID"></param>
        /// <param name="adID"></param>
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void updateOfferAccepted(int accepted, int offerID, int adID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET offerAccepted = @accepted WHERE ID = @offerID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@offerID", SqlDbType.Int).Value = offerID;
            cmd.Parameters.Add("@accepted", SqlDbType.Int).Value = accepted;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            if (accepted == 1)
            {
                offerAccepted(adID);
            }
        }

        /// <summary>
        /// Cancel an Offer in the Database.
        /// </summary>
        /// <param name="offerID"></param>
        public void deactivateAcceptedOffer(int offerID)
        {
            bool active = false;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET active = @active WHERE ID = @offerID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@offerID", SqlDbType.Int).Value = offerID;
            cmd.Parameters.Add("@active", SqlDbType.Bit).Value = active;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Get the Current rating for a USer selling an item from the database.
        /// </summary>
        /// <param name="sellerID"></param>
        /// <returns></returns>
        public string getSellerRating(int sellerID)
        {
            string rating = null;
            int ratingNumber = 0;
            int counter = 0;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT rating FROM FeedBack WHERE sellerID = @sellerID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@sellerID", SqlDbType.Int).Value = sellerID;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ratingNumber = ratingNumber + ((int)reader["rating"]);
                    counter++;
                }
                double result = ratingNumber / counter;
                rating = result.ToString();
            }
            connection.Close();
            return rating;
        }

        /// <summary>
        /// Upsate Add offer to accepted.
        /// </summary>
        /// <param name="adID"></param>
        public void offerAccepted(int adID)
        {
            int notAccepted = 3;
            int pending = 2;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET offerAccepted = @notAccepted WHERE AddID = @adID AND offerAccepted = @pending";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@notAccepted", SqlDbType.Int).Value = notAccepted;
            cmd.Parameters.Add("@pending", SqlDbType.Int).Value = pending;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Get and address details using a  
        /// </summary>
        /// <param name="addressID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Address getAdAddress(int addressID)
        {
            Address address = new Address();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "SELECT * FROM PostalAddress WHERE ID = @addressID"; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@addressID", SqlDbType.Int).Value = addressID;
            //use command
            connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                address.addressUnitNum = dr["unitNumber"].ToString();
                address.addressStreetNum = dr["streetAddress"].ToString();
                address.addressStreetName = dr["streetName"].ToString();
                address.addressCity = dr["city"].ToString();
                address.addressPostCode = Convert.ToInt32(dr["postCode"]);
                address.addressStateID = Convert.ToInt32(dr["stateName"]);
                address.addressCountry = dr["country"].ToString();
            }
            connection.Close();
            return address;
        }

        /// <summary>
        /// Get Offer details by Offer ID
        /// </summary>
        /// <param name="offerID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Offer getOffer(int offerID)
        {
            Offer offer = new Offer();
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT ID, buyerID, sellerID, addID, offerAmount, offerAccepted, active FROM AddOffer WHERE ID = @offerID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@offerID", SqlDbType.Int).Value = offerID;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                offer.offerID = (int)reader["ID"];
                offer.offerBuyerID = (int)reader["buyerID"];
                offer.offerSellerID = (int)reader["sellerID"];
                offer.offerAdID = (int)reader["addID"];
                offer.offerAmountOffered = (decimal)reader["offerAmount"];
                offer.offerOfferAccepted = (int)reader["offerAccepted"];
                offer.offerActive = (bool)reader["active"];
            }
            connection.Close();
            return offer;
        }

        /// <summary>
        /// Get advertisements sold by a user.
        /// </summary>
        /// <param name="adID"></param>
        /// <param name="amount"></param>
        /// <param name="buyerID"></param>
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void advertisementSold(int adID, decimal amount, int buyerID)
        {
            DateTime date = DateTime.Now;
            bool active = false;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE Advertisement SET price = @amount, buyerID = @buyerID, dateCompleted = @date, active = @active WHERE ID = @adID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@buyerID", SqlDbType.Int).Value = buyerID;
            cmd.Parameters.Add("@amount", SqlDbType.Decimal).Value = amount;
            cmd.Parameters.Add("@date", SqlDbType.Date).Value = date;
            cmd.Parameters.Add("@active", SqlDbType.Bit).Value = active;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        /// <summary>
        /// Get all Offers for an Ad via Ad ID
        /// </summary>
        /// <param name="adID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Offer> getAdOffers(int adID)
        {
            List<Offer> offers = new List<Offer>();
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "SELECT ID, buyerID, sellerID, addID, offerAmount, offerAccepted, active FROM AddOffer WHERE addID = @adID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Offer offer = new Offer(   (int)reader["ID"],
                                            (int)reader["buyerID"],
                                            (int)reader["sellerID"],
                                            (int)reader["addID"],
                                            (decimal)reader["offerAmount"],
                                            (int)reader["offerAccepted"],
                                            (bool)reader["active"]);
                offers.Add(offer);
            }
            connection.Close();
            return offers;
        }

        /// <summary>
        /// Gets the ad for the private message
        /// </summary>
        /// <param name="tempAdID"></param>
        /// <returns></returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Advertisement getAd(int tempAdID)
        {
            Advertisement returnAd = new Advertisement();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "EXEC sp_GetAd " + tempAdID; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                Advertisement tempAd = new Advertisement(
                                        (int)reader["ID"],
                                        (int)reader["sellerID"],
                                        reader["title"].ToString(),
                                        reader["adDescription"].ToString(),
                                        (DateTime)reader["creationDate"],
                                        (decimal)reader["price"],
                                        (bool)reader["active"]);
                returnAd = tempAd;                
            }
            connection.Close();
            return returnAd;
        }

        //[DataObjectMethod(DataObjectMethodType.Insert)]
        //public void makeOffer(int buyerID, int sellerID, int adID, decimal offerAmount)
        //{
        //    SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
        //    string query = "INSERT INTO AddOffer (buyerID, sellerID, adID, offerAmount) VALUES (@buyerID, @sellerID, @adID, @offerAmount) "; //the sql request
        //    SqlCommand cmd = new SqlCommand(query, connection);
        //    cmd.Parameters.Add("@buyerID", SqlDbType.Int).Value = buyerID;
        //    cmd.Parameters.Add("@sellerID", SqlDbType.Int).Value = sellerID;
        //    cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
        //    cmd.Parameters.Add("@offerAmount", SqlDbType.Decimal).Value = offerAmount;
        //    //use command
        //    connection.Open();
        //    cmd.ExecuteNonQuery();
        //    connection.Close();
        //}

        public string getconnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
        }
    }
}