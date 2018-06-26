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
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MapleLeaf2.PersonalPage
{
    public partial class AccountSetting : System.Web.UI.Page
    {

        //string dbConnect = @"data source=SQL5030.site4now.net;persist security info=False;initial catalog=DB_A372E4_kingkingpo2; User Id = DB_A372E4_kingkingpo2_admin; Password=zoskekWkd1;";


        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {

            String userId = User.Identity.GetUserId();


            SqlDataAdapter sqlDataAdapter = null;
            DataSet ds = null;
            SqlConnection connectFill = null;
            SqlConnection connectCmd = null;
            SqlCommand cmd = null;
            SqlCommand scmd = null;

            string confirmValue = Request.Form["confirm_value"];

            if (confirmValue == "Yes")
            {

                try
                {

                    connectFill = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                    connectFill.Open();




                    string sqlString = "DELETE FROM AspNetBookings WHERE UserId=@userId";
                    scmd = new SqlCommand(sqlString, connectFill);
                    scmd.Parameters.AddWithValue("@UserId", userId);
                    scmd.ExecuteNonQuery();

                    sqlString = "DELETE FROM AspNetUsers WHERE Id=@userId";
                    scmd = new SqlCommand(sqlString, connectFill);
                    scmd.Parameters.AddWithValue("@UserId", userId);
                    scmd.ExecuteNonQuery();

                    connectFill.Close();


                    //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Deletion completed')", true);

                    Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);



                }


                catch (Exception ex)
                {
                    Erro.Text = ex.Message;
                    DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
                }

                // release all database resources (memory)
                DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);

            }

            else
            {
                Response.Redirect("./AccountSetting.aspx");
            }

        }




        private static void DisposeResources(ref SqlDataAdapter sqlDataAdapter,
            ref DataSet ds,
            ref SqlConnection connectFill,
            ref SqlConnection connectCmd,
            ref SqlCommand cmd,
            ref SqlCommand scmd)
        {
            if (sqlDataAdapter != null)
                sqlDataAdapter.Dispose();
            if (ds != null)
                ds.Dispose();
            if (connectFill != null)
                connectFill.Dispose();
            if (connectCmd != null)
                connectCmd.Dispose();
            if (cmd != null)
                cmd.Dispose();
            if (scmd != null)
                scmd.Dispose();
        }

        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }



        protected void Page_Load()
        {
            // YS 2018-03-25 Confirmation of deleting a user account
            /*if (!IsPostBack)
            {
                //Defines the property on client click to this button
                DeletingAccount.OnClientClick = "if (confirm('Are you sure you want to delete your account?') == false) return false;";
            }*/


            if (User.Identity.IsAuthenticated)
            {

                ResetAccount.Visible = true;
                UserName.Text = User.Identity.Name;
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

                // JH - 2018-03-21 COMMENT THE BELOW LINE DUE TO A DB ERROR
                // HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

                // Enable this after setting up two-factor authentientication
                //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

                TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

                LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

                if (!IsPostBack)
                {
                    // Determine the sections to render
                    if (HasPassword(manager))
                    {
                        ChangePassword.Visible = true;
                    }
                    else
                    {
                        CreatePassword.Visible = true;
                        ChangePassword.Visible = false;
                    }

                    // Render success message
                    var message = Request.QueryString["m"];
                    if (message != null)
                    {
                        // Strip the query string from action
                        Form.Action = ResolveUrl("~/PersonalPage/ManageAccount");

                        SuccessMessage =
                            message == "ChangePwdSuccess" ? "Your password has been changed."
                            : message == "SetPwdSuccess" ? "Your password has been set."
                            : message == "RemoveLoginSuccess" ? "The account was removed."
                            : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                            : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                            : String.Empty;
                        successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                    }
                }
            }
            else
            {
                FailureText.Text = "<h3>Please log in first</h3>";
                ErrorLoginPlz.Visible = true;
            }

        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/PersonalPage/ManageAccount?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/PersonalPage/ManageAccount");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/PersonalPage/ManageAccount");
        }

        protected void MyTrips_Click(object sender, EventArgs e)
        {
            MyFrame.Visible = true;
            MyFrame.Attributes.Add("src", "./TripList.aspx");
        }

        //protected void MyPostings_Click(object sender, EventArgs e)
        //{
        //    MyFrame.Visible = true;
        //    MyFrame.Attributes.Add("src", "./PostingList.aspx");
        //}

        protected void MyProfile_Click(object sender, EventArgs e)
        {
            MyFrame.Visible = true;
            MyFrame.Attributes.Add("src", "./MyProfile.aspx");
        }

        protected void AccountSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("./AccountSetting.aspx");
        }
    }
}