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

namespace MapleLeaf2.PersonalPage
{
    public partial class MyProfile : System.Web.UI.Page
    {
        // Connection string: containing information about how to open and “connect” to the database
        //string dbConnect = @"integrated security=True;data source=(localdb)\MSSQLLocalDB;persist security info=False;initial catalog=aspnet-MapleLeaf2-20180224093718";

        string dbConnect = @"Data Source=SQL5039.site4now.net;Initial Catalog=DB_A372E4_kingkingpo2;User Id=DB_A372E4_kingkingpo2_admin;Password=zoskekWkd1;";
       
        //connectionString="Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-MapleLeaf2-20180224093718.mdf;Initial Catalog=aspnet-MapleLeaf2-20180224093718;Integrated Security=True

        //public static int cusID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                // if the user is authenticated
                // then show the current profile
                initPanel.Visible = true;
                txtEmail.Text = User.Identity.Name;
                UserName2.Text = User.Identity.Name;
                lblMessages.Text = "";
                ShowProfile();
            }
            else
            {
                FailureText.Text = "<h3>Please log in first</h3>";
                ErrorLoginPlz.Visible = true;
            }

            //if (!IsPostBack)
            //{
            //    btnUpdateCustomer.Visible = false;
            //    lblMessages.Visible = false;
            //} else
            //{
            //    btnUpdateCustomer.Visible = true;
            //    lblMessages.Visible = true;
            //}

        }

        //*******************************************
        protected void ShowProfile()
        {
            //btnUpdateCustomer.Visible = true;
            //lblMessages.Visible = true;

            // create the objects needed for CRUD
            SqlDataAdapter sqlDataAdapter = null;
            DataSet ds = null;
            SqlConnection connectFill = null;
            SqlConnection connectCmd = null;
            SqlCommand cmd = null;
            SqlCommand scmd = null;

            try
            {
                // create a new data set object called ds
                ds = new DataSet();

                // create a connection to the database called connectFill
                connectFill = new SqlConnection(dbConnect);

                // create SQL string to select product record
                string sqlString = "SELECT City, Province, PostalCode, NickName FROM AspNetUsers WHERE Email=@Email2";

                // create new SQL command object based on SQL string and connection
                scmd = new SqlCommand(sqlString, connectFill);

                // add the parameter to SQL string and validate
                scmd.Parameters.AddWithValue("@Email2", UserName2.Text);
               
                // create a new SQL data adapter to retrieve the data, and fill the data set
                sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = scmd;
                sqlDataAdapter.Fill(ds, "currentProfile");
            }
            catch (Exception ex)
            {
                lblMessages.Text = ex.Message;
                DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
            }

            if (ds.Tables["currentProfile"].Rows.Count == 1)
            {
                initCityLbl.Text = ds.Tables["currentProfile"].Rows[0]["City"].ToString();
                initProvLbl.Text = ds.Tables["currentProfile"].Rows[0]["Province"].ToString();
                initPostalLbl.Text = ds.Tables["currentProfile"].Rows[0]["PostalCode"].ToString();
                initNickLbl.Text = ds.Tables["currentProfile"].Rows[0]["NickName"].ToString();

                //btnUpdateCustomer.Visible = true;
                lblMessages.Visible = true;
                lblMessages.Text = "This is your current profile. Click to the update button.";

            }
            else
            {
                lblMessages.Text = "No profile information not found!";
            }

            // release all database resources (memory)
            DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
        }


        //*******************************************
        protected void btnUpdateCustomer_Click(object sender, EventArgs e)
        {
            initPanel.Visible = false; // hide the current profile panel
            Panel1.Visible = true; // show profile edit panel
            btnUpdateCustomer.Visible = false;
            btnSave.Visible = true;
           
        }

        //*******************************************
        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMessages.Text = "";

            // check for blank customer number
            if (txtEmail.Text != "")
            {
                // create the objects needed for CRUD
                SqlDataAdapter sqlDataAdapter = null;
                DataSet ds = null;
                SqlConnection connectFill = null;
                SqlConnection connectCmd = null;
                SqlCommand cmd = null;
                SqlCommand scmd = null;

                // open a connection to the database
                connectCmd = new SqlConnection(dbConnect);
                connectCmd.Open();

                // JH: 03-21 DB security stamp 문제 해결
                string SecurityStamp = Guid.NewGuid().ToString();

                string sqlString = "UPDATE AspNetUsers SET SecurityStamp=@SecurityStamp, NickName=@NickName, City=@City, Province=@Province, PostalCode=@PostalCode WHERE Email=@Email";

                int count = 0;
                try
                {
                    // create a SQL command object
                    cmd = new SqlCommand(sqlString, connectCmd);

                    // map the parameters into the placeholders in the SQL string
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@NickName", txtNickName.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@Province", txtProvince.Text);
                    cmd.Parameters.AddWithValue("@PostalCode", txtPostal.Text);
                    cmd.Parameters.AddWithValue("@SecurityStamp", SecurityStamp); // update SecurityStamp file in MSSQL

                    // execute the query
                    count = cmd.ExecuteNonQuery();
                    initPanel.Visible = true; // show current profile panel
                    Panel1.Visible = false; // hide profile edit panel
                    ShowProfile();
                    lblMessages.Text = "Your profile is successfully updated!";
                    btnUpdateCustomer.Visible = true;
                    btnSave.Visible = false;
                }
                catch (Exception ex)
                {
                    // if the query fails for any reason record the error message and release all resources
                    lblMessages.Text = ex.Message;
                    DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
                }

                // release all database resources (memory)
                DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
            }
        }



        // **************************************************************
        // method releases all database resources that have been assigned
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

    } // end 'MyProfile' class

} // end Namespace