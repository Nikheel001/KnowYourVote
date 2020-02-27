using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowYourVote
{
    public partial class ManageBooth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                r1.Visible = false;
                r2.Visible = false;
                r3.Visible = false;
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("GenrateReport.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Visible = true;
            Label3.Visible = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButton1.Visible = true;
            RadioButton2.Visible = true;
            RadioButton3.Visible = true;
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            r1.Visible = true;
            r2.Visible = false;
            r3.Visible = false;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            r1.Visible = false;
            r2.Visible = true;
            r3.Visible = false;
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            r1.Visible = false;
            r2.Visible = false;
            r3.Visible = true;
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            string qry = "insert into BOOTH(B_name,B_loc,BA_Id) values ('" + TextBox1.Text + "','" + TextBox2.Text + "'," + DropDownList2.SelectedValue.ToString() + ")";
            run_ins_del(qry);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Booth Added Successfully.')", true);
            Response.Redirect("ManageBooth.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string qry = "DELETE from BOOTH WHERE B_Id = " + DropDownList3.SelectedValue.ToString();
            run_ins_del(qry);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Booth Removed Successfully.')", true);
            Response.Redirect("ManageBooth.aspx");
        }

        private void run_ins_del(String query1)
        {
            try
            {
                SqlConnection myconn = new SqlConnection();
                myconn.ConnectionString = Application["cs"].ToString();
                myconn.Open();
                SqlCommand sqlcmd = new SqlCommand(query1, myconn);
                sqlcmd.ExecuteNonQuery();
                myconn.Close();
            }
            catch (Exception excc) { }
        }
    }
}