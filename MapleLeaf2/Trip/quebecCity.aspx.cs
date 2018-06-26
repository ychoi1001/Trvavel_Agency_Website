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

namespace MapleLeaf2.Trip
{
    public partial class QuebecCity : System.Web.UI.Page
    {
        protected string json;

        protected class Trip
        {
            public string StartDate = "";
            public string EndDate = "";
            public string Quota = "";

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            // Booking button show up after login
            bookingDate.Style.Add("display", "none");

            if (User.Identity.IsAuthenticated)
            {
                bookingButton.Visible = true;

            }
            else
            {
                bookingButton.Visible = false;
            }


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

                connectFill = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                // create SQL string to check available dates. 
                string sqlString = "SELECT * FROM AspNetTripList WHERE City=@City ORDER BY StartDate";

                cmd = new SqlCommand(sqlString, connectFill);

                cmd.Parameters.AddWithValue("@City", "QuebecCity");

                // create a new SQL data adapter to retrieve the data, and fill the data set
                sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = cmd;
                sqlDataAdapter.Fill(ds, "trips");


                if (ds.Tables["trips"].Rows.Count > 0)
                {
                    json = "{";
                    //Trip[] trip = new Trip[ds.Tables["trips"].Rows.Count];
                    for (int i = 0; i < ds.Tables["trips"].Rows.Count; i++)
                    {
                        DateTime startDate = (DateTime)ds.Tables["trips"].Rows[i]["StartDate"];
                        DateTime endDate = (DateTime)ds.Tables["trips"].Rows[i]["EndDate"];

                        json += "\"Trip " + (i + 1) + "\":[\"";
                        json += String.Format("{0:MM/dd/yyyy}", startDate) + "\",\"";
                        json += endDate.ToString("MM/dd/yyyy") + "\"]";
                        if (i < ds.Tables["trips"].Rows.Count - 1)
                        {
                            json += ',';
                        }
                    }
                    json += "}";



                }
                else
                {
                    bookingErro.Text = "No trips in QuebecCity";
                }


            }
            catch (Exception ex)
            {
                //lblMessages.Text = ex.Message;
                DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
            }


        }

        public void SaveBooking(object sender, EventArgs e)
        {
            String startDate=bookingDate.Text.Substring(0, 10);
            String endDate = bookingDate.Text.Substring(14);
            
            // create the objects needed for CRUD
            SqlDataAdapter sqlDataAdapter = null;
            DataSet ds = null;
            SqlConnection connectFill = null;
            SqlConnection connectCmd = null;
            SqlCommand cmd = null;
            SqlCommand scmd = null;

            String userId = User.Identity.GetUserId();
            int count = 0;

            connectFill = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            // create SQL string to check available dates. 
            string sqlString = "SELECT * FROM AspNetBookings WHERE UserId =@UserId and((StartDate <= @StartDate and EndDate >= @StartDate) or(StartDate <= @EndDate and EndDate >= @EndDate)) ";

            cmd = new SqlCommand(sqlString, connectFill);

            // map the parameters into the placeholders in the SQL string
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@StartDate", startDate);
            cmd.Parameters.AddWithValue("@EndDate", endDate);

            connectFill.Open();

            // count how many SQL string returned
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(String.Format("{0}", reader[0]));
                count++;
            }
            reader.Close();
            if (count == 0)
            {
                try
                {
                    sqlString = "INSERT INTO AspNetBookings  ( City, StartDate,EndDate, UserId) VALUES ( 'QuebecCity', @StartDate, @EndDate, @UserId)";

                    cmd = new SqlCommand(sqlString, connectFill);

                    // map the parameters into the placeholders in the SQL string
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    // execute the query
                    count = cmd.ExecuteNonQuery();
                    bookingErro.Text = "Booking success. Quebec City: " + bookingDate.Text;
                }
                catch (Exception ex)
                {
                    bookingErro.Text = ex.Message;
                    DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
                }

                // release all database resources (memory)
                DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);

            }
            else
            {
                bookingErro.Text = "You can't book that day, check your trip list";
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

    }
}