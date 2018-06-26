using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MapleLeaf2
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void TripLists_Click(object sender, EventArgs e)
        {
            //MyFrame.Attributes.Add("src", "./PersonalPage/TripList.aspx");
            Response.Redirect("./AdminPage/AdminTripList.aspx");
        }
        protected void ModifyTrip_Click(object sender, EventArgs e)
        {
            //MyFrame.Visible = true;
            //MyFrame.Attributes.Add("src", "./AdminPage/AddTrips.aspx");
            Response.Redirect("./AdminPage/AddTrips.aspx");
        }

        protected void AdminAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("./AdminPage/AdminAccount.aspx");
        }
    }
}