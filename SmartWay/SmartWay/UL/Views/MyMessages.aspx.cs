using SmartWay.BL.Models;
using SmartWay.DAL.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*	
	FileName	=	MyMessages.aspx.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created October 2018
	Purpose of the File-
		To Handle communications between the UL and BL regarding User Messages. Will Show a Summary of Messages related to the logged in User
*/

namespace SmartWay.UL.Views
{
	public partial class MyMessages : System.Web.UI.Page
	{
		AdvertisementControls AC = new AdvertisementControls();
		UserControls UC = new UserControls();
		//int privateMessageID = 1000; // for testing

		// PRIVATE MESSAGE:
		PrivateMsg tempPrivateMessage = new PrivateMsg();
		//DateTime tempSentDate = new DateTime();

		// SENDER:
		Person tempSender = new Person();
		// need username and ID
		//string tempSenderUsername;
		//int tempSenderID;


		// RECIPIENT:
		Person tempRecipient = new Person();
		// need an ID
		//int tempRecipientID;
		//int tempRecipientID2;
		//string tempRecipientUsername;


		// AD: 
		Advertisement tempAd = new Advertisement();
		// need a title
		//string tempTitle;
		//int adID;
		//int tempAddID2;

		// LOGGED ID:
		Person tempCurrent = new Person();
		//int tempCurrentID;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["currentUser"] == null)
			{
				Session["returnURL"] = "MyMessages.aspx";
				Response.Redirect("Login.aspx");
			}
		}

		/// <summary>
		/// Get a List of all PrivateMessages associated with the logged in User's ID
		/// </summary>
		/// <returns></returns>
		public List<PrivateMsg> getPrivateMsgList()
		{
			UserControls UC = new UserControls();
			Person currentUser = new Person();
			currentUser = (Person)Session["currentUser"];
			int tempSenderID2 = currentUser.userID;
			//tempRecipientID2 = 1003;
			//tempAddID2 = 1003;
			List<PrivateMsg> tempPrivateMsg = UC.getPrivateMessageListforUser(tempSenderID2);
			List<PrivateMsg> returnMessageList = new List<PrivateMsg>();
			// for (var i = 0; i < tempPrivateMsg.Count; i++)
			int thisCount = tempPrivateMsg.Count;
			for (var i = tempPrivateMsg.Count -1; i >= 0; i--)
				{

				// creating a private message of the message in the list
				// at that position of the loop             
				PrivateMsg tempMessage = tempPrivateMsg[i];
				int pmChain = tempMessage.pmPrivateMessageChainID;
				bool pmChainExists = false;
				for (var j = 0; j < returnMessageList.Count; j++)
				{
					if (returnMessageList[j].pmPrivateMessageChainID == pmChain)
					{
						pmChainExists = true;
					}
				}
					if (pmChainExists == false) // we're checking if the private message does NOT exist
					{
						returnMessageList.Add(tempMessage); // if true, it adds to the list
					}
			}
			// we return returnMessageList - list of messages that did not exist and were added to the list
			return returnMessageList;
		}

		/// <summary>
		/// Create a List of Private Messages that have been replied to for the logged in User
		/// </summary>
		/// <returns></returns>
		public List<PrivateMsg> getRepliedPrivateMsgList()
		{
			UserControls UC = new UserControls();
			Person currentUser = new Person();
			currentUser = (Person)Session["currentUser"];
			int currentUserID = currentUser.userID;
			List<PrivateMsg> tempPrivateMsg = getPrivateMsgList();
			List<PrivateMsg> tempReturnList = new List<PrivateMsg>();
			for (var i = 0; i < tempPrivateMsg.Count; i++)
			{
				// we are taking logged in user's ID and see if it matches with pm recipient's ID 
				if (currentUserID != tempPrivateMsg[i].pmReceiverUserID)
				{
					// if it doesn't match, we check if the message was read (true)
					if (tempPrivateMsg[i].pmMessageRead == false)
					{
						// we adding those read messages to a list for displaying
						tempReturnList.Add(tempPrivateMsg[i]);
					}
				}
			};
			// returning the list of read messages
			return tempReturnList;
		}

		/// <summary>
		/// Create a List of Private Messages that have been Not been replied to for the logged in User
		/// </summary>
		/// <returns></returns>
		public List<PrivateMsg> getNotRepliedPrivateMsgList()
		{
			UserControls UC = new UserControls();
			Person currentUser = new Person();
			currentUser = (Person)Session["currentUser"];
			int currentUserID = currentUser.userID;            
			List<PrivateMsg> tempPrivateMsg = getPrivateMsgList();
			List<PrivateMsg> tempReturnList = new List<PrivateMsg>();
			// going through a loop
			for (var i = 0; i < tempPrivateMsg.Count; i++)
			{
				// we are taking logged in user's ID and see if it matches with pm recipient's ID               
				if (currentUserID == tempPrivateMsg[i].pmReceiverUserID)
				{
					// if it matches, then we check if the message was NOT read (false)
					if (tempPrivateMsg[i].pmMessageRead == false)
					{
						// if the message was not read, it is added to the message list
						// to be displayed to the user
						tempReturnList.Add(tempPrivateMsg[i]);
					}
				}                
			};
			return tempReturnList;
		}

		/// <summary>
		/// Get Ad Title from Ad ID
		/// </summary>
		/// <param name="tempAdID"></param>
		/// <returns></returns>
		public string getAdTitle(int tempAdID)
		{
			AdvertisementControls AC = new AdvertisementControls();
			Advertisement currentAd = new Advertisement();
			currentAd = AC.getAd(tempAdID);
			string returnAddTitle = currentAd.advertisementTitle;
			return returnAddTitle;
		}

		/// <summary>
		/// Get Ad owner's Username from Ad ID
		/// </summary>
		/// <param name="tempUserID"></param>
		/// <returns></returns>
		public string getUsername(int tempUserID)
		{
			UserControls UC = new UserControls();
			Person currentUser = new Person();
			currentUser = UC.getUserByID(tempUserID);
			string returnUserName = currentUser.userName;
			return returnUserName;
		}
	}
}