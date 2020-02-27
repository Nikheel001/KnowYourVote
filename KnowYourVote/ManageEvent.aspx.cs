using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowYourVote
{
    public partial class ManageEvent : System.Web.UI.Page
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
            string qry = "insert into EVENT_SCHEDULE(ename,stime,incity,description) values('" + TextBox1.Text + "','" + TextBox2.Text + " 00:00:00'," + DropDownList1.SelectedValue.ToString() + ",'" + TextBox3.Text + "')";
            run_ins_del(qry);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Booth Added Successfully.')", true);
            Response.Redirect("ManageEvent.aspx");
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            string qry = "DELETE from EVENT_SCHEDULE WHERE Event_Id = " + DropDownList2.SelectedValue.ToString();
            run_ins_del(qry);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Booth Removed Successfully.')", true);
            Response.Redirect("ManageEvent.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Schedule.aspx");
        }
    }
}