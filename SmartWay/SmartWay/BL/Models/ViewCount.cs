using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartWay.BL.Models
{
    public class ViewCount
    {
        public int count { get; set; }
        public int adID { get; set; } 

        public ViewCount()
        {
            count = 0;
            adID = 0;
        }

        public ViewCount(int init_count, int init_adID)
        {
            count = init_count;
            adID = init_adID;
        }
    }
}