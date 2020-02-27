using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowYourVote
{
    public partial class Canpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page pg = PreviousPage;
            if (pg != null)
            {
                TextBox id = (TextBox)pg.FindControl("TextBox1");
                TextBox pwd = (TextBox)pg.FindControl("TextBox2");

                int rs = isvalid_info(id.Text, pwd.Text);
                if (rs == 0)
                {
                    Response.Redirect("Login.aspx?rbt=nmorpwd");
                }
                else
                {
                    Session["_id"] = id.Text;
                    Session["admin"] = Check_if_Admin(id.Text);
                    Response.Redirect("Admin_Choice.aspx");
                }
            }
            else
            {
                Response.Redirect("Home.aspx?wasnull=rr");
            }
        }

        public String Check_if_Admin(String email)
        {
            try
            {
                List<String> AL = (List<String>)Application["AL"];
                foreach (String x in AL)
                    if (email.Equals(x))
                        return email;
                return null;
            }
            catch (Exception exxx)
            {
                return null;
            }
        }

        private T run_select<T>(String query1)
        {
            try
            {
                SqlDataReader rdr;
                T idis;
                SqlConnection myconn = new SqlConnection();
                myconn.ConnectionString = Application["cs"].ToString();
                myconn.Open();
                SqlCommand sqlcmd = new SqlCommand(query1, myconn);
                rdr = sqlcmd.ExecuteReader();
                rdr.Read();
                idis = (T)Convert.ChangeType(rdr[0].ToString(), typeof(T));
                myconn.Close();
                return idis;
            }
            catch (Exception excc)
            {
                return default(T);
            }
        }
        public int isvalid_info(String email, String pwd)
        {
            String query1;
            query1 = String.Concat("select Id from USER_DATA where email='", email, "' and pwd ='", pwd, "'");
            return run_select<int>(query1);
        }
    }
}