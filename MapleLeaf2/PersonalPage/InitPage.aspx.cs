using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using MapleLeaf2.Models;

namespace MapleLeaf2.PersonalPage
{
    public partial class InitPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                UserName.Text = "<p>Hello, " + User.Identity.Name + "!<br /> This is the one-stop personal page for you.";
            }
            else
            {
                FailureText.Text = "<h3>Please log in first</h3>";
                ErrorLoginPlz.Visible = true;
                btnLink.Visible = true;
            }
        }

    }
}