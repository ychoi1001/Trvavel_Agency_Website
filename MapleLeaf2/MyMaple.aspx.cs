using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MapleLeaf2
{
    public partial class MyMaple : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyFrame.Attributes.Add("src", "./PersonalPage/TripList.aspx");
            }
        }

        protected void MyTrips_Click(object sender, EventArgs e)
        {
            MyFrame.Attributes.Add("src", "./PersonalPage/TripList.aspx");
        }


        protected void MyProfile_Click(object sender, EventArgs e)
        {
            MyFrame.Attributes.Add("src", "./PersonalPage/MyProfile.aspx");
        }

        protected void AccountSetting_Click(object sender, EventArgs e)
        {
            //MyFrame.Attributes.Add("src", "./PersonalPage/AccountSetting.aspx");
            Response.Redirect("./PersonalPage/AccountSetting.aspx");
            //MyFrame.Attributes.Add("src", "./PersonalPage/DeleteAccount.aspx");
        }

    }
}