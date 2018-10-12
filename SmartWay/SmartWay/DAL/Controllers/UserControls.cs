using System;
using SmartWay.BL.Models;
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
        public string getProfileImage(int userID)
        {
            SqlConnection connection = new SqlConnection(getconnectionString());
            //string query = "SELECT filePath FROM ProfileImage WHERE userID = @userID";
            string query = "EXEC sp_GetProfileImg @userID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
            connection.Open();
            string filePath = cmd.ExecuteScalar().ToString();
            connection.Close();
            return filePath;
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

        //This is Used to Get the Phone Number By providing the PhoneNumber ID.
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

        //This is Used to Get the Address Object By providing the Address ID.
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<int> getPrivateMessageList(int tempPrivateMsgID)
        {
            List<int> currentPrivateMessageID = new List<int>();
            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "EXEC sp_GetPrivateMsg " + tempPrivateMsgID; //the sql request
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<PrivateMsg> getPrivateMessage(int tempPrivateMsgID)
        {
            List<PrivateMsg> currentPrivateMessage = new List<PrivateMsg>();
            PrivateMsg lastPM = new PrivateMsg();

            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "EXEC sp_GetPrivateMsg " + tempPrivateMsgID; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                PrivateMsg newPM = new PrivateMsg(
                                        (int)reader["ID"],
                                        (int)reader["sendersUserID"],
                                        (int)reader["receiverUserID"],
                                        (int)reader["addID"],
                                        (int)reader["forumID"],
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ReplyMessage> getReplyMessages(int tempPrivateMsgID)
        {
            List<ReplyMessage> currentReplyMessages = new List<ReplyMessage>();

            //setting connection string and sql request
            SqlConnection connection = new SqlConnection(getconnectionString()); //getting connection string
            string query = "EXEC getPMReplyList " + tempPrivateMsgID; //the sql request
            SqlCommand cmd = new SqlCommand(query, connection);
            //use command
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //for each rows of the database corresponding to the request we create a product and add it to the list
                ReplyMessage newPM = new ReplyMessage(
                                        (int)reader["ID"],
                                        (int)reader["privateMessageID "],
                                        reader["messageDetails"].ToString(),
                                        (bool)reader["messageRead"],
                                        (bool)reader["messageReplied"],
                                        (DateTime)reader["creationDate"],
                                        (bool)reader["active"]);
                currentReplyMessages.Add(newPM);
            }
            connection.Close();
            return currentReplyMessages;
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
        public void savePrivateMessage(int tempSenderID, int tempRecipientID, int tempAdID, int tempForumID, string tempMessage)
        {
            // Add private message to database
            SqlConnection connection = new SqlConnection(getconnectionString());
            string query = "EXEC sp_NewPrivateMessage @tempSenderID, @tempRecipientID, @tempAdID, @tempForumID, @tempMessage, 2222";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.Add("@tempSenderID", SqlDbType.Int).Value = tempSenderID;
            cmd.Parameters.Add("@tempRecipientID", SqlDbType.Int).Value = tempRecipientID;
            cmd.Parameters.Add("@tempAdID", SqlDbType.Int).Value = tempAdID;
            cmd.Parameters.Add("@tempForumID", SqlDbType.Int).Value = tempForumID;
            cmd.Parameters.Add("@tempMessage", SqlDbType.VarChar, 250).Value = tempMessage; // might need to increase the character limit           
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();

            //int phoneID = getPhoneID(phoneNumber);
            //return phoneID;
        }


        public string getconnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SmartWayconnectionString"].ConnectionString;
        }
    }
}