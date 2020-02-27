using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace KnowYourVote
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            TextBox13.Visible = false;
            if (IsPostBack)
                if (TextBox8.Text.Length == 0)
                    TextBox13.Visible = false;
        }

        private String get_mail_id(String qry)
        {
            try
            {
                String m = null;
                SqlDataReader rdr;
                SqlConnection myconn = new SqlConnection();
                myconn.ConnectionString = Application["cs"].ToString();
                myconn.Open();
                SqlCommand sqlcmd = new SqlCommand(qry, myconn);
                rdr = sqlcmd.ExecuteReader();
                rdr.Read();
                m = rdr.GetValue(0).ToString();
                myconn.Close();
                return m;
            }
            catch (Exception exx)
            {
                Console.WriteLine(exx);
                return "NO";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String eml = get_mail_id("select email from USER_DATA where email='" + TextBox5.Text + "'");

            if (eml.Length > 3)
            {
                Label2.Text = "Client already exists";
                Label2.Visible = true;
            }
            else
            {
                String str = "insert into USER_DATA (fname,";
                if (TextBox2.Text.Length != 0)
                    str += "mname,";
                str += "lname,pwd,email,address,U_BId,cell_no1,";
                if (TextBox7.Text.Length != 0)
                    str += "cell_no2,";
                if (TextBox7.Text.Length != 0)
                    str += "birth_date,";
                str += "aadharno,Voter_id) values ('";
                str += TextBox1.Text;
                str += "','";
                if (TextBox2.Text.Length != 0)
                {
                    str += TextBox2.Text;
                    str += "','";
                }
                str += TextBox3.Text;
                str += "','";
                str += TextBox4.Text;
                str += "','";
                str += TextBox5.Text;
                str += "','";
                str += TextBox11.Text;
                str += "',";
                str += TextBox12.Text;
                str += ",'";
                str += TextBox6.Text;
                str += "',";
                if (TextBox7.Text.Length != 0)
                {
                    str += "'"+TextBox7.Text;
                    str += "',";
                }
                if (TextBox8.Text.Length != 0)
                {
                    str += "'"+TextBox7.Text;
                    str += "',";
                }
                
                str += TextBox9.Text;
                str += ",'";
                str += TextBox14.Text;
                str += "')";
                Label2.Text = str;
                SqlConnection myconn = new SqlConnection();
                myconn.ConnectionString = Application["cs"].ToString();
                myconn.Open();
                SqlCommand sqlcmd = new SqlCommand(str, myconn);
                int rss = sqlcmd.ExecuteNonQuery();
                Label2.Text = rss.ToString();
                myconn.Close();
                Response.Redirect("Home.aspx?ssu=done");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Visible = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList3.Visible = true;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox12.Text = DropDownList3.SelectedValue.ToString();
        }
    }
}