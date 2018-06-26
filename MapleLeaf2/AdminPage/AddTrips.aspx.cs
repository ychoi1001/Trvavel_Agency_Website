using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;

namespace MapleLeaf2.AdminPage
{
    public partial class AddTrips : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //StartD.Visible = false;
            //EndD.Visible = false;
        }
        //protected void StartD_Change(object sender, EventArgs e)
        //{

        //    StartD.Text = EndDate.SelectedDate.ToShortDateString();
        //}
        //protected void EndDate_Change(object sender, EventArgs e)
        //{

        //    EndD.Text = EndDate.SelectedDate.ToShortDateString();
        //}

        protected void AddTrip_Click(object sender, EventArgs e)
        {
            // create the objects needed for CRUD
            SqlDataAdapter sqlDataAdapter = null;
            DataSet ds = null;
            SqlConnection connectFill = null;
            SqlConnection connectCmd = null;
            SqlCommand cmd = null;
            SqlCommand scmd = null;

            int count = 0;
            String userId = User.Identity.GetUserId();

            connectFill = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);


            connectFill.Open();

            if (StartDate.Text != "" && EndDdate.Text != "" && Maximum.Text != "")
            {
                try
                {
                    string sqlString = "INSERT INTO AspNetTripList  ( City, StartDate, EndDate, Quota ) VALUES ( @City, @StartDate, @EndDate, @Quota)";

                    cmd = new SqlCommand(sqlString, connectFill);

                    // map the parameters into the placeholders in the SQL string
                    cmd.Parameters.AddWithValue("@City", City.Text);
                    cmd.Parameters.AddWithValue("@StartDate", StartDate.Text);
                    cmd.Parameters.AddWithValue("@EndDate", EndDdate.Text);
                    cmd.Parameters.AddWithValue("@Quota", Maximum.Text);

                    // execute the query
                    count = cmd.ExecuteNonQuery();
                    Erro.Text = "Add trip success!";
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
                Erro.Text = "There is emptiy field";
            }
        }

        protected void ModifyTrip_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddTrips.aspx");
        }

        protected void AdminAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAccount.aspx");
        }

        protected void TripLists_Click(object sender, EventArgs e)
        {
            //MyFrame.Attributes.Add("src", "./PersonalPage/TripList.aspx");
            Response.Redirect("AdminTripList.aspx");
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
    }
}