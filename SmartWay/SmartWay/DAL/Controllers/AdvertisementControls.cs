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

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void cancelOffer(int offerID)
        {
            bool cancel = false;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET active = @cancel WHERE ID = @offerID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@offerID", SqlDbType.Int).Value = offerID;
            cmd.Parameters.Add("@cancel", SqlDbType.Bit).Value = cancel;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

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
            if (accepted == 0)
            {
                deactivateDeclined(offerID);
            }
            else if (accepted == 1)
            {
                deactivateAccepted(adID);
            }
        }

        public void deactivateDeclined(int offerID)
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

        public void deactivateAccepted(int adID)
        {
            bool active = false;
            int pending = 2;
            int declined = 0;
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "UPDATE AddOffer SET active = @active, offerAccepted = @declined WHERE AddID = @adID AND offerAccpted = @pending";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@adID", SqlDbType.Int).Value = adID;
            cmd.Parameters.Add("@active", SqlDbType.Bit).Value = active;
            cmd.Parameters.Add("@pending", SqlDbType.Int).Value = pending;
            cmd.Parameters.Add("@declined", SqlDbType.Int).Value = declined;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

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
            string query = "EXEC sp_SaleItems " + tempAdID; //the sql request
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