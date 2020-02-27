using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowYourVote
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin();
        }

        protected void isAdmin()
        {
            try
            {
                String pl = Session["admin"].ToString();
                if (pl.Equals(null))
                {
                    mydiv2.Visible = false;
                    mydiv.Visible = true;
                }
                else
                {
                    mydiv2.Visible = true;
                    mydiv.Visible = false;
                }
            }
            catch (NullReferenceException exc) { mydiv.Visible = true; mydiv2.Visible = false; }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection myconn = new SqlConnection();
            myconn.ConnectionString = Application["cs"].ToString();
            myconn.Open();
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.Connection = myconn;
            sqlcmd.CommandText="select * from USER_DATA where Voter_id='"+TextBox2.Text+"'";
            SqlDataReader rdr = sqlcmd.ExecuteReader();
            if (rdr.Read())
            {
                Label3.Text = rdr["fname"].ToString() + rdr["mname"].ToString() + rdr["lname"].ToString() + ", you are registered";
            }
            else
            {
                Label3.Text = "Sorry! You are not registered";
            }
            myconn.Close();
        }
    }
}