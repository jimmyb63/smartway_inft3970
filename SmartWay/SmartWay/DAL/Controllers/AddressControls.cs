using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


/*	
	FileName	=	AddressControls.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Gabriele Urbonaite, Graham Johnstone, Zac Skoumbourdis and Brock Buttsworth
	Created August 2018
	Purpose of the File-
		To Handle communications between the BL and Database regarding Address Actions
*/
namespace SmartWay.DAL.Controllers
{
	[DataObject(true)]
	public class AddressControls
	{
		/// <summary>
		/// Add a new address to the database.
		/// </summary>
		/// <param name="uNum"></param>
		/// <param name="sNum"></param>
		/// <param name="sName"></param>
		/// <param name="city"></param>
		/// <param name="pCode"></param>
		/// <param name="stateID"></param>
		/// <param name="country"></param>
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addAddress(string uNum, string sNum, string sName, string city, int pCode, int stateID, string country)
		{
			// Add address to database
			SqlConnection connection = new SqlConnection(getConnectionString());
			String query = "EXEC sp_NewAddress @uNum, @sNum, @sName, @city, @pCode, @state, @country";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@uNum", SqlDbType.VarChar, 4).Value = uNum;
			cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
			cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
			cmd.Parameters.Add("@city", SqlDbType.VarChar, 50).Value = city;
			cmd.Parameters.Add("@state", SqlDbType.Int).Value = stateID;
			cmd.Parameters.Add("@pCode", SqlDbType.SmallInt).Value = pCode;
			cmd.Parameters.Add("@country", SqlDbType.VarChar, 30).Value = country;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
			//int addressID = getAddressID(uNum, sNum, sName, pCode);
			//return addressID;
		}

		/// <summary>
		/// Find Address detail in thae database.
		/// </summary>
		/// <param name="uNum"></param>
		/// <param name="sNum"></param>
		/// <param name="sName"></param>
		/// <param name="pCode"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public int getAddressID(string uNum, string sNum, string sName, int pCode)
		{
			SqlConnection connection = new SqlConnection(getConnectionString());
			SqlCommand cmd = new SqlCommand();
			if (uNum != null)
			{
				String query = "SELECT ID FROM PostalAddress WHERE unitNumber = @uNum AND streetAddress = @sNum AND streetName = @sNum AND postCode = @pCode";
				cmd = new SqlCommand(query, connection);
				cmd.Parameters.Add("@uNum", SqlDbType.VarChar, 4).Value = uNum;
				cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
				cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
				cmd.Parameters.Add("@uNum", SqlDbType.Int).Value = pCode;
			}
			else
			{
				String query = "SELECT ID FROM PostalAddress WHERE streetAddress = @sNum AND streetName = @sNum AND postCode = @pCode";
				cmd = new SqlCommand(query, connection);
				cmd.Parameters.Add("@sNum", SqlDbType.VarChar, 20).Value = sNum;
				cmd.Parameters.Add("@sName", SqlDbType.VarChar, 35).Value = sName;
				cmd.Parameters.Add("@uNum", SqlDbType.Int).Value = pCode;
			}
			connection.Open();
			int addressID = (int)cmd.ExecuteScalar();
			connection.Close();
			return addressID;
		}

		/// <summary>
		/// Get State Id's from the database.
		/// </summary>
		/// <param name="state"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public int getStateID(string state)
		{
			SqlConnection connection = new SqlConnection(getConnectionString());
			SqlCommand cmd = new SqlCommand();
			String query = "SELECT ID FROM StateName WHERE stateName = @state";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@state", SqlDbType.VarChar, 20).Value = state;
			connection.Open();
			int stateID = (int)cmd.ExecuteScalar();
			connection.Close();
			return stateID;
		}

		/// <summary>
		/// Connection string used to connect to the database.
		/// </summary>
		/// <returns></returns>
		public string getConnectionString()
		{
			return ConfigurationManager.ConnectionStrings["SmartWayConnectionString"].ConnectionString;
		}
	}
}