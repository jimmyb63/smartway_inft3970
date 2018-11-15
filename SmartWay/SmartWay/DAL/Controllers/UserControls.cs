using System;
using SmartWay.BL.Models;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/*	
	FileName	=	UserControls.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created September 2018
	Purpose of the File-
		To Handle communications between the BL and Database regarding User Actions
*/
namespace SmartWay.DAL.Controllers
{
	[DataObject(true)]
	public class UserControls
	{
		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addUser(string fName, string lName, string emailAddress, string password, string regoDate)
		{
			// Add user to database
			// INSERT INTO tblCustomer VALUES()
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "EXEC sp_NewPerson @fName, @lName, @emailAddress, @password, @regoDate";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@fName", SqlDbType.VarChar, 60).Value = fName;
			cmd.Parameters.Add("@lName", SqlDbType.VarChar, 60).Value = lName;
			cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 100).Value = emailAddress;
			cmd.Parameters.Add("@password", SqlDbType.VarChar, 60).Value = password;
			cmd.Parameters.Add("@regoDate", SqlDbType.Date).Value = regoDate;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public bool uNameValidation(string uName)
		{
			int userID = 0;
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "SELECT COUNT(*) FROM Person WHERE SWUsername = @uName";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@uName", SqlDbType.VarChar, 30).Value = uName;
			connection.Open();
			userID = (int)cmd.ExecuteScalar();
			bool exists = false;
			if (userID != 0)
			{
				exists = true;
			}
			return exists;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public bool emailValidation(string email)
		{
			int userID = 0;
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "SELECT COUNT(*) FROM Person WHERE email = @email";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@email", SqlDbType.VarChar, 30).Value = email;
			connection.Open();
			userID = (int)cmd.ExecuteScalar();
			bool exists = false;
			if (userID != 0)
			{
				exists = true;
			}
			return exists;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public int newRegistration(string fName, string lName, string uName, string DOB, string emailAddress, string password, int phoneNumber, string uNum, string sNum, string sName, string city, int pCode, int stateID, string country, string verificationCode)
		{
			// Add user to database
			// INSERT INTO tblCustomer VALUES()
			SqlConnection connection = new SqlConnection(getconnectionString());
			string procedure = "sp_NewRegistration";
			SqlCommand cmd = new SqlCommand(procedure, connection);
			//string query = "EXEC sp_NewRegistration @fName, @lName, @emailAddress, @password, @phoneNumber, @uNum, @sNum, @sName, @city, @pCode, @state, @country, @verificationCode";
			//SqlCommand cmd = new SqlCommand(query, connection);
			//cmd.Parameters.Add("@returnPersonID", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
			cmd.CommandType = CommandType.StoredProcedure;
			SqlParameter param;
			param = cmd.Parameters.Add("@tempFirstName", SqlDbType.VarChar, 20);
			param.Value = fName;
			param = cmd.Parameters.Add("@tempLastName", SqlDbType.VarChar, 20);
			param.Value = lName;
			param = cmd.Parameters.Add("@tempUsername", SqlDbType.VarChar, 30);
			param.Value = uName;
			param = cmd.Parameters.Add("@tempDOB", SqlDbType.Date);
			param.Value = DOB;
			param = cmd.Parameters.Add("@tempEmail", SqlDbType.VarChar, 320);
			param.Value = emailAddress;
			param = cmd.Parameters.Add("@tempPassword", SqlDbType.VarChar, 30);
			param.Value = password;
			param = cmd.Parameters.Add("@tempPhone", SqlDbType.Int);
			param.Value = phoneNumber;
			param = cmd.Parameters.Add("@tempUnitNumber", SqlDbType.VarChar, 4);
			param.Value = uNum;
			param = cmd.Parameters.Add("@tempStreetAddress", SqlDbType.VarChar, 20);
			param.Value = sNum;
			param = cmd.Parameters.Add("@tempStreetName", SqlDbType.VarChar, 35);
			param.Value = sName;
			param = cmd.Parameters.Add("@tempCity", SqlDbType.VarChar, 50);
			param.Value = city;
			param = cmd.Parameters.Add("@tempPostCode", SqlDbType.Int);
			param.Value = pCode;
			param = cmd.Parameters.Add("@tempStateName", SqlDbType.Int);
			param.Value = stateID;
			param = cmd.Parameters.Add("@tempCountry", SqlDbType.VarChar, 30);
			param.Value = country;
			param = cmd.Parameters.Add("@tempVerificationCode", SqlDbType.VarChar, 8);
			param.Value = verificationCode;
			param = cmd.Parameters.Add("@returnPersonID", SqlDbType.Int);
			param.Direction = ParameterDirection.Output;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
			int personID = (int)param.Value;
			return personID;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<Person> getUsers()
		{
			List<Person> users = new List<Person>();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
			string query = "SELECT * FROM Person"; //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			//use command
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database corresponding to the request we create a product and add it to the list
				Person user = new Person((int)reader["ID"],
										reader["firstName"].ToString(),
										reader["lastName"].ToString(),
										reader["email"].ToString(),
										reader["DOB"].ToString(),
										(int)reader["phoneNumberId"],
										(int)reader["addressId"],
										reader["SWUsername"].ToString(),
										reader["SWPassword"].ToString(),
										(DateTime)reader["verificationDate"],
										(DateTime)reader["creationDate"],
										(bool)reader["active"]);
				users.Add(user);
			}
			connection.Close();
			return users;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public string getVerificationCode(int personID)
		{
			string verificationCode;
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "SELECT code FROM VerificationCode WHERE personID = @personID";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@personID", SqlDbType.Int).Value = personID;
			connection.Open();
			verificationCode = Convert.ToString(cmd.ExecuteScalar());
			return verificationCode;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public DateTime getVerificationDate(int personID)
		{
			DateTime verificationDate;
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "SELECT verificationDate FROM Person WHERE ID = @personID";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@personID", SqlDbType.Int).Value = personID;
			connection.Open();
			verificationDate = Convert.ToDateTime(cmd.ExecuteScalar());
			return verificationDate;
		}

		[DataObjectMethod(DataObjectMethodType.Update)]
		public void verifyUser(int personID, string verificationDate)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "UPDATE Person SET verificationDate = @verificationDate  WHERE ID = @personID";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@personID", SqlDbType.Int).Value = personID;
			cmd.Parameters.Add("@verificationDate", SqlDbType.Date).Value = verificationDate;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public bool checkVerified(string email)
		{
			int user = 0;
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "SELECT COUNT(verificationDate) FROM Person WHERE email = @email";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@email", SqlDbType.VarChar, 30).Value = email;
			connection.Open();
			user = (int)cmd.ExecuteScalar();
			bool exists = false;
			if (user != 0)
			{
				exists = true;
			}
			return exists;
		}



		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addProfileImage(string filePath, int userID)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "INSERT INTO ProfileImage (filePath, userID) VALUES(@filePath, @userID)";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@filePath", SqlDbType.VarChar, 260).Value = filePath;
			cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<string> getProfileImages(int userID)
		{
			List<string> profileImages = new List<string>();
			SqlConnection connection = new SqlConnection(getconnectionString());
			//string query = "SELECT filePath FROM ProfileImage WHERE userID = @userID";
			string query = "SELECT filePath FROM ProfileImage WHERE userID = @userID";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database corresponding to the request we create a product and add it to the list
				string profileImage = reader["filePath"].ToString();
				profileImages.Add(profileImage);
			}
			if (profileImages.Count < 1)
			{
				List<string> defaultImages = new List<string>();
				defaultImages.Add("../Images/DefaultImg/GenericProfileImage.png");
				profileImages = defaultImages;
			}
			connection.Close();
			return profileImages;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public string getProfileImage(int userID)
		{
			List<string> profileImages = new List<string>();
			profileImages = getProfileImages(userID);
			string filePAth = profileImages[0];
			return filePAth;
		}

		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void addPhoneNumber(int phoneNumber)
		{
			// Add phone number to database
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "EXEC sp_newPhone @phoneNumber";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@phoneNumber", SqlDbType.Int).Value = phoneNumber;
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();
			//int phoneID = getPhoneID(phoneNumber);
			//return phoneID;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public int getPhoneID(int phoneNumber)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "SELECT ID FROM PhoneNumber WHERE phoneNumber = @phoneNumber";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@phoneNumber", SqlDbType.Int).Value = phoneNumber;
			connection.Open();
			int phoneID = (int)cmd.ExecuteScalar();
			connection.Close();
			return phoneID;
		}

		/// <summary>
		/// This is Used to Get the Phone Number By providing the PhoneNumber ID.
		/// </summary>
		/// <param name="phoneNumberID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public int getPhoneNumber(int phoneNumberID)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "SELECT phoneNumber FROM PhoneNumber WHERE ID = @phoneNumberID";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@phoneNumberID", SqlDbType.Int).Value = phoneNumberID;
			connection.Open();
			int phoneNumber = (int)cmd.ExecuteScalar();
			connection.Close();
			return phoneNumber;
		}

		/// <summary>
		/// This is Used to Get the Address Object By providing the Address ID.
		/// </summary>
		/// <param name="addressID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public Address getUserAddress (int addressID)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "SELECT ID, unitNumber, streetAddress, streetName, stateName, city, postCode, country FROM PostalAddress WHERE ID = @tempAddressID";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempAddressID", SqlDbType.VarChar, 320).Value = addressID;
			connection.Open();
			SqlDataReader dr = cmd.ExecuteReader();
			Address tempAddress = new Address();
			while (dr.Read())
			{
				tempAddress.addressUnitNum = dr["ID"].ToString();
				tempAddress.addressUnitNum = dr["unitNumber"].ToString();
				tempAddress.addressStreetNum = dr["streetAddress"].ToString();
				tempAddress.addressStreetName = dr["streetName"].ToString();
				tempAddress.addressStateID = Convert.ToInt32(dr["stateName"]);
				tempAddress.addressCity = dr["city"].ToString();
				tempAddress.addressPostCode = Convert.ToInt32(dr["postCode"]);
				tempAddress.addressCountry = dr["country"].ToString();
			}
			return tempAddress;
		}

		/// <summary>
		/// Gets Users Email address by their user ID
		/// </summary>
		/// <param name="userID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public string getUserEmail(int userID)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "SELECT email FROM Person WHERE ID = @userID";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
			connection.Open();
			string email = cmd.ExecuteScalar().ToString();
			return email;
		}

		/// <summary>
		/// Get Users Account details by their email address.
		/// </summary>
		/// <param name="email"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public Person getUserAccount(string email)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "SELECT ID, firstName, lastName, SWUsername, DOB, email, phoneNumberId, addressId, SWPassword FROM Person WHERE email = @email";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@email", SqlDbType.VarChar, 320).Value = email;
			connection.Open();
			SqlDataReader dr = cmd.ExecuteReader();
			Person tempUser = new Person();
			while (dr.Read())
			{
				tempUser.userID = Convert.ToInt32(dr["ID"]);
				tempUser.userfName = dr["firstName"].ToString();
				tempUser.userlName = dr["lastName"].ToString();
				tempUser.userName = dr["SWUsername"].ToString();
				tempUser.userDOB = dr["DOB"].ToString();
				tempUser.userEmail = dr["email"].ToString();
				tempUser.userPhoneID = Convert.ToInt32(dr["phoneNumberId"]);
				tempUser.userAddressID = Convert.ToInt32(dr["addressId"]);
				tempUser.userPassword = dr["SWPassword"].ToString();
			}
			return tempUser;
		}

		/// <summary>
		/// Get User details by the user's ID.
		/// </summary>
		/// <param name="tempID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public Person getUserByID(int tempID)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "EXEC sp_GetUserByID @tempID";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempID", SqlDbType.Int).Value = tempID;
			connection.Open();
			SqlDataReader dr = cmd.ExecuteReader();
			Person tempUser = new Person();
			while (dr.Read())
			{
				tempUser.userID = Convert.ToInt32(dr["ID"]);
				tempUser.userfName = dr["firstName"].ToString();
				tempUser.userlName = dr["lastName"].ToString();
				tempUser.userName = dr["SWUsername"].ToString();
				tempUser.userDOB = dr["DOB"].ToString();
				tempUser.userEmail = dr["email"].ToString();
				tempUser.userPhoneID = Convert.ToInt32(dr["phoneNumberId"]);
				tempUser.userAddressID = Convert.ToInt32(dr["addressId"]);
			}
			return tempUser;
		}

		/// <summary>
		/// Get Admin details for a User, by their email address
		/// </summary>
		/// <param name="email"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public Staff getAdminAccount(string email)
		{
			SqlConnection connection = new SqlConnection(getconnectionString());
			SqlCommand cmd = new SqlCommand();
			string query = "SELECT a.position, u.ID, u.firstName, u.lastName, u.email, u.SWPassword FROM Staff a INNER JOIN Person u ON a.personID = u.ID WHERE u.email = @email";
			cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@email", SqlDbType.VarChar, 320).Value = email;
			connection.Open();
			SqlDataReader dr = cmd.ExecuteReader();
			Staff tempAdmin = new Staff();
			while (dr.Read())
			{
				tempAdmin.adminID = Convert.ToInt32(dr["ID"]);
				tempAdmin.adminfName = dr["firstName"].ToString();
				tempAdmin.adminlName = dr["lastName"].ToString();
				tempAdmin.adminEmail = dr["email"].ToString();
				tempAdmin.adminPassword = dr["SWPassword"].ToString();
				tempAdmin.adminPosition = dr["position"].ToString();
			}
			return tempAdmin;
		}

		/// <summary>
		/// Get a List of all Private Message ID's associated with a User's ID.
		/// </summary>
		/// <param name="tempUserID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<int> getAllPriMsgListForUser(int tempUserID)
		{
			List<int> currentPrivateMessageID = new List<int>();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
			string query = "EXEC sp_GetPrivateMsg " + tempUserID; //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			//use command
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database the ID is added to the List
				int tempID = (int)reader["ID"];
				currentPrivateMessageID.Add(tempID);
			}
			connection.Close();
			return currentPrivateMessageID;
		}

		/// <summary>
		/// Get a List of all Private Messages associated with a User's ID.
		/// </summary>
		/// <param name="tempUserID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<PrivateMsg> getPrivateMessageListforUser(int tempUserID)
		{
			List<PrivateMsg> currentPrivateMessage = new List<PrivateMsg>();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
			string query = "SELECT * FROM PrivateMessage WHERE sendersUserID = @tempUserID OR receiverUserID = @tempUserID ORDER BY PrivateMessageChainID, creationDate ASC"; //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempUserID", SqlDbType.Int).Value = tempUserID;
			//use command
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database corresponding to the request we create a product and add it to the list
				PrivateMsg newPM = new PrivateMsg(
										(int)reader["ID"],
										(int)reader["PrivateMessageChainID"],
										(int)reader["sendersUserID"],
										(int)reader["receiverUserID"],
										reader["messageDetails"].ToString(),
										(bool)reader["messageRead"],
										(bool)reader["messageReplied"],
										(DateTime)reader["creationDate"],
										(bool)reader["active"]);
				currentPrivateMessage.Add(newPM);
			}
			connection.Close();
			return currentPrivateMessage;
		}

		/// <summary>
		/// Get a list of private messages (a conversation) that are related to a sender and reciever and an Ad ID
		/// </summary>
		/// <param name="tempSenderID"></param>
		/// <param name="tempReceiversID"></param>
		/// <param name="tempAdID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<PrivateMsg> getPrivateMessageList (int tempSenderID, int tempReceiversID, int tempAdID)
		{
			List<PrivateMsg> currentPrivateMessage = new List<PrivateMsg>();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
			string query = "EXEC sp_getPMList @tempSenderID, @tempReceiversID, @tempAdID "; //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempSenderID", SqlDbType.Int).Value = tempSenderID;
			cmd.Parameters.Add("@tempReceiversID", SqlDbType.Int).Value = tempReceiversID;
			cmd.Parameters.Add("@tempAdID", SqlDbType.Int).Value = tempAdID;
			//use command
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database corresponding to the request we create a product and add it to the list
				PrivateMsg newPM = new PrivateMsg(
										(int)reader["ID"],
										(int)reader["PrivateMessageChainID"],
										(int)reader["sendersUserID"],
										(int)reader["receiverUserID"],
										//(int)reader["addID"],
										//(int)reader["forumID"],
										reader["messageDetails"].ToString(),
										(bool)reader["messageRead"],
										(bool)reader["messageReplied"],
										(DateTime)reader["creationDate"],
										(bool)reader["active"]);
				currentPrivateMessage.Add(newPM);
			}
			connection.Close();
			return currentPrivateMessage;
		}

		/// <summary>
		/// Get a List of replies to a Private Message Chain that is associated with a sender and reciever and Ad ID
		/// </summary>
		/// <param name="tempSenderID"></param>
		/// <param name="tempReceiversID"></param>
		/// <param name="tempAdID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<PrivateMsg> getPrivateMessageListReplied(int tempSenderID, int tempReceiversID, int tempAdID)
		{
			List<PrivateMsg> currentPrivateMessage = new List<PrivateMsg>();
			currentPrivateMessage = getPrivateMessageList(tempSenderID, tempReceiversID, tempAdID);


			List<PrivateMsg> repliedPrivateMessage = new List<PrivateMsg>();
			for (int i = 0; i < currentPrivateMessage.Count; i++)
			{
				if (currentPrivateMessage[i].pmMessageReplied == true)
				{
					repliedPrivateMessage.Add(currentPrivateMessage[i]);
				}
			}
			return repliedPrivateMessage;
		}

		/// <summary>
		/// Get a list of messages that have been replied to.
		/// </summary>
		/// <param name="tempSenderID"></param>
		/// <param name="tempReceiversID"></param>
		/// <param name="tempAdID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public List<PrivateMsg> getPrivateMessageListNotReplied(int tempSenderID, int tempReceiversID, int tempAdID)
		{
			List<PrivateMsg> currentPrivateMessage = new List<PrivateMsg>();
			currentPrivateMessage = getPrivateMessageList(tempSenderID, tempReceiversID, tempAdID);
			List<PrivateMsg> repliedPrivateMessage = new List<PrivateMsg>();
			for (int i = 0; i < currentPrivateMessage.Count; i++)
			{
				if (currentPrivateMessage[i].pmMessageReplied == false)
				{
					repliedPrivateMessage.Add(currentPrivateMessage[i]);
				}
			}
			return repliedPrivateMessage;
		}

		/// <summary>
		/// Saves a private message, two types - add and forum
		/// </summary>
		/// <param name="tempSenderID"></param>
		/// <param name="tempRecipientID"></param>
		/// <param name="tempAdID"></param>
		/// <param name="tempForumID"></param>
		/// <param name="tempMessage"></param>

		[DataObjectMethod(DataObjectMethodType.Insert)]
		public void savePrivateMessage(int tempSenderID, int tempRecipientID, int tempAdID, string tempMessage)
		{
			// Add private message to database
			SqlConnection connection = new SqlConnection(getconnectionString());
			string query = "EXEC sp_NewPrivateMessage @tempSenderID, @tempRecipientID, @tempAdID, @tempMessage, 2222";
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempSenderID", SqlDbType.Int).Value = tempSenderID;
			cmd.Parameters.Add("@tempRecipientID", SqlDbType.Int).Value = tempRecipientID;
			cmd.Parameters.Add("@tempAdID", SqlDbType.Int).Value = tempAdID;
			//cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
			cmd.Parameters.Add("@tempMessage", SqlDbType.VarChar, 250).Value = tempMessage; // might need to increase the character limit           
			connection.Open();
			cmd.ExecuteNonQuery();
			connection.Close();

		}
			  
		/// <summary>
		/// Get Private Message Details by a Private Message ID
		/// </summary>
		/// <param name="tempPrivateMsgID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public PrivateMsg getPrivateMessageByID(int tempPrivateMsgID)
		{
			PrivateMsg tempPrivateMessage = new PrivateMsg();
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
			string query = "EXEC sp_GetPrivateMsg " + tempPrivateMsgID; //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@privateMessageID", SqlDbType.Int).Value = tempPrivateMsgID;
			//use command
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database corresponding to the request we create a product and add it to the list
				PrivateMsg newPrivateMessage = new PrivateMsg(
										(int)reader["ID"],
										(int)reader["PrivateMessageChainID"],
										(int)reader["sendersUserID"],
										(int)reader["receiverUserID"],
										//(int)reader["addID"],
										//if (!reader.IsDBNull("forumID"))
										//    return reader.GetString(colIndex);
										//(int)reader["forumID"],
										reader["messageDetails"].ToString(),
										(bool)reader["messageRead"],
										(bool)reader["messageReplied"],
										(DateTime)reader["creationDate"],
										(bool)reader["active"]);
				tempPrivateMessage = newPrivateMessage;
			}
			connection.Close();
			return tempPrivateMessage;
		}

		/// <summary>
		/// Get Ad ID associated with a Private Message Chain.
		/// </summary>
		/// <param name="tempPrivateMessageChainID"></param>
		/// <returns></returns>
		[DataObjectMethod(DataObjectMethodType.Select)]
		public int getAddIDPrivateMessageChain(int tempPrivateMessageChainID)
		{
			int returnAdID = 0;
			//setting connection string and sql request
			SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
			string query = "SELECT addID FROM PrivateMessageChain WHERE ID = @tempPrivateMessageChainID"; //the sql request
			SqlCommand cmd = new SqlCommand(query, connection);
			cmd.Parameters.Add("@tempPrivateMessageChainID", SqlDbType.Int).Value = tempPrivateMessageChainID;
			//use command
			connection.Open();
			SqlDataReader reader = cmd.ExecuteReader();
			while (reader.Read())
			{
				//for each rows of the database corresponding to the request we create a product and add it to the list
				int tempAdID = (int)reader["addID"];
				returnAdID = tempAdID;
			}
			connection.Close();
			return returnAdID;
		}


		public string getconnectionString()
		{
			return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
		}
	}
}