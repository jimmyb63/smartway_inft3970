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

        public string getconnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
        }
    }
}