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
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MapleLeaf2.PersonalPage
{
    public partial class TripList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String userId = User.Identity.GetUserId();

          if(userId!=null)
          {
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
                    connectFill = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                    // create SQL string to select product record
                    string sqlString = "";
                    // string sqlString = "Select * from AspNetBookings";

                    if(userId== "d167f113-34de-46d0-a05a-fa7ae701c8ad") //admin
                    {
                        sqlString = "Select distinct City, StartDate, EndDate  from AspNetBookings";
                    }
                    else  //others
                    {
                        sqlString = "Select * from AspNetBookings where UserId=@UserId order by StartDate";
                    }

                    // create new SQL command object based on SQL string and connection
                    scmd = new SqlCommand(sqlString, connectFill);

                    // add the parameter to SQL string and validate
                    scmd.Parameters.AddWithValue("@UserId", userId);

                    // create a new SQL data adapter to retrieve the data, and fill the data set
                    sqlDataAdapter = new SqlDataAdapter();
                    sqlDataAdapter.SelectCommand = scmd;
                    sqlDataAdapter.Fill(ds, "TripList");
                }
                catch (Exception ex)
                {
                    Erro.Text = ex.Message;
                    DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
                }


                if (ds.Tables["TripList"].Rows.Count > 0)
                {
                    TableRow row = new TableRow();
                    tripTable.Rows.Add(row);

                    TableCell City = new TableCell();
                    TableCell startDate = new TableCell();
                    TableCell endDate = new TableCell();

                    City.Text = "Where to go";
                    startDate.Text = "Start date";
                    endDate.Text = "End date";
                    for (int i = 0; i < ds.Tables["TripList"].Rows.Count; i++)
                    {
                        row = new TableRow();
                        tripTable.Rows.Add(row);

                         City = new TableCell();
                         startDate = new TableCell();
                         endDate = new TableCell();

                        City.Text = ds.Tables["TripList"].Rows[i]["City"].ToString();
                        startDate.Text = ds.Tables["TripList"].Rows[i]["StartDate"].ToString();
                        endDate.Text = ds.Tables["TripList"].Rows[i]["EndDate"].ToString();

                        row.Cells.Add(City);
                        row.Cells.Add(endDate);
                        if (userId == "d167f113-34de-46d0-a05a-fa7ae701c8ad") //admin
                        {
                            TableCell btnCell = new TableCell();

                            Button btn = new Button();
                            btn.Text = "booked customer list";
                            
                            btn.Click += new EventHandler(CustoerList);
                            btn.CommandArgument = "1";
                            btnCell.Controls.Add(btn);

                            row.Cells.Add(btnCell);
                        }

                        

                        
                        
                    }

                }
                else
                {
                    Erro.Text = "No profile information not found!";
                }

                //    int count = 0;

                //    connectFill.Open();
                //    try
                //    {
                //        string sqlString = "INSERT INTO AspNetBookings  ( City, StartDate,EndDate, UserId) VALUES ( 'QuebecCity', @StartDate, @EndDate, @UserId)";

                //        cmd = new SqlCommand(sqlString, connectFill);

                //        // map the parameters into the placeholders in the SQL string
                //        // cmd.Parameters.AddWithValue("@City", bookingDate.Text);
                //        cmd.Parameters.AddWithValue("@StartDate", startDate);
                //        cmd.Parameters.AddWithValue("@EndDate", endDate);
                //        cmd.Parameters.AddWithValue("@UserId", userId);

                //        // execute the query
                //        count = cmd.ExecuteNonQuery();
                //    }
                //    catch (Exception ex)
                //    {
                //        bookingErro.Text = ex.Message;
                //        DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);
                //    }

                // release all database resources (memory)
                DisposeResources(ref sqlDataAdapter, ref ds, ref connectFill, ref connectCmd, ref cmd, ref scmd);

            }
            
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            // Confirms that an HtmlForm control is rendered for the specified ASP.NET server control at run time.
        }
        public void CustoerList(object sender, EventArgs e)
        {
            if("1" == "1")
            {
                Erro.Text = "good";
            }
            Erro.Text = "CustoerList";



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
