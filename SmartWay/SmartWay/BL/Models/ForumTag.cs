using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*	
	FileName	=	ForumTag.cs
	SmartWay - Major Project
	Authors - Ashley Ballinger, James Bailey, Brock Buttsworth, Gabriele Urbonaite, Graham Johnstone, and Zac Skoumbourdis.
	Created October 2018
	Purpose of the File-
		To Create Class called ForumTag and include Methods related to this class
*/

namespace SmartWay.BL.Models
{
	public class ForumTag
	{
		private int ID;
		private string tagName;

		//Constructors
		public ForumTag()
		{
			ID = 0;
			tagName = "";
		}

		public ForumTag(int tempID, string tempTagname)
		{
			ID = tempID;
			tagName = tempTagname;
		}

		//Getter and Setters
		public int forumTagID
		{
			get
			{
				return ID;
			}
			set
			{
				ID = value;
			}
		}

		public string forumTagName
		{
			get
			{
				return tagName;
			}
			set
			{
				tagName = value;
			}
		}

	}
}