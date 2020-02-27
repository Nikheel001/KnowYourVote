using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowYourVote
{
    public partial class BoothJobPost : System.Web.UI.Page
    {
        private static bool[] note = new bool[6] { false, false, false, false, false, false };
        private static List<string> lst;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length == TextBox2.Text.Length && TextBox3.Text.Length == TextBox4.Text.Length && TextBox5.Text.Length == TextBox6.Text.Length && TextBox5.Text.Length == TextBox4.Text.Length && TextBox2.Text.Length == TextBox3.Text.Length && TextBox1.Text.Length == 0)
                return;
            string qry, get_email;
            string msg = "You are selected for next election's Electoral committy member.";
            string msg2 = "We are kindly informing you that you are relived from duty of election's Electoral committy member.";
            if (TextBox1.Text.Length != 0)
            {
                if (note[0])    // note shows before empty or not.
                {
                    if (TextBox1.Text.Equals(lst[0])) { }
                    else
                    {
                        get_email = "select email from USER_DATA where Id=" + lst[0];
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "", msg2);
                        qry = "update BOOTH set BLO =" + TextBox1.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                        run_ins_del(qry);
                        get_email = "select email from USER_DATA where Id=" + TextBox1.Text;
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "BoothLevelOfficer", msg);
                    }
                }
                else
                {
                    qry = "update BOOTH set BLO =" + TextBox1.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                    run_ins_del(qry);
                    get_email = "select email from USER_DATA where Id=" + TextBox1.Text;
                    get_email = run_select<string>(get_email);
                    Mail_Send_try(get_email, "BoothLevelOfficer", msg);
                }
            }
            else if (note[0])
            {
                qry = "update BOOTH set BLO =NULL where B_Id=" + DropDownList3.SelectedValue.ToString();
                run_ins_del(qry);
                get_email = "select email from USER_DATA where Id=" + lst[0];
                get_email = run_select<string>(get_email);
                Mail_Send_try(get_email, "", msg2);
            }
            if (TextBox2.Text.Length != 0)
            {
                if (note[1])
                {
                    if (TextBox2.Text.Equals(lst[1])) { }
                    else
                    {
                        get_email = "select email from USER_DATA where Id=" + lst[1];
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "", msg2);
                        qry = "update BOOTH set CampusAmbassador = " + TextBox2.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                        run_ins_del(qry);
                        get_email = "select email from USER_DATA where Id=" + TextBox2.Text;
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "CampusAmbassador", msg);
                    }
                }
                else
                {
                    qry = "update BOOTH set CampusAmbassador = " + TextBox2.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                    run_ins_del(qry);
                    get_email = "select email from USER_DATA where Id=" + TextBox2.Text;
                    get_email = run_select<string>(get_email);
                    Mail_Send_try(get_email, "CampusAmbassador", msg);
                }
            }
            else if (note[1])
            {
                qry = "update BOOTH set CampusAmbassador =NULL where B_Id=" + DropDownList3.SelectedValue.ToString();
                run_ins_del(qry);
                get_email = "select email from USER_DATA where Id=" + lst[1];
                get_email = run_select<string>(get_email);
                Mail_Send_try(get_email, "", msg2);
            }
            if (TextBox3.Text.Length != 0)
            {
                if (note[2])
                {
                    if (TextBox3.Text.Equals(lst[2])) { }
                    else
                    {
                        get_email = "select email from USER_DATA where Id=" + lst[2];
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "", msg2);
                        qry = "update BOOTH set ElectionAgent = " + TextBox3.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                        run_ins_del(qry);
                        get_email = "select email from USER_DATA where Id=" + TextBox3.Text;
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "ElectionAgent", msg);
                    }
                }
                else
                {
                    qry = "update BOOTH set ElectionAgent = " + TextBox3.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                    run_ins_del(qry);
                    get_email = "select email from USER_DATA where Id=" + TextBox3.Text;
                    get_email = run_select<string>(get_email);
                    Mail_Send_try(get_email, "ElectionAgent", msg);
                }
            }
            else if (note[2])
            {
                qry = "update BOOTH set ElectionAgent=NULL where B_Id=" + DropDownList3.SelectedValue.ToString();
                run_ins_del(qry);
                get_email = "select email from USER_DATA where Id=" + lst[2];
                get_email = run_select<string>(get_email);
                Mail_Send_try(get_email, "", msg2);
            }
            if (TextBox4.Text.Length != 0)
            {
                if (note[3])
                {
                    if (TextBox4.Text.Equals(lst[3])) { }
                    else
                    {
                        get_email = "select email from USER_DATA where Id=" + lst[3];
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "", msg2);
                        qry = "update BOOTH set PoolingAgent = " + TextBox4.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                        run_ins_del(qry);
                        get_email = "select email from USER_DATA where Id=" + TextBox4.Text;
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "PoolingAgent", msg);
                    }
                }
                else
                {
                    qry = "update BOOTH set PoolingAgent = " + TextBox4.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                    run_ins_del(qry);
                    get_email = "select email from USER_DATA where Id=" + TextBox4.Text;
                    get_email = run_select<string>(get_email);
                    Mail_Send_try(get_email, "PoolingAgent", msg);
                }
            }
            else if (note[3])
            {
                qry = "update BOOTH set PoolingAgent =NULL where B_Id=" + DropDownList3.SelectedValue.ToString();
                run_ins_del(qry);
                get_email = "select email from USER_DATA where Id=" + lst[3];
                get_email = run_select<string>(get_email);
                Mail_Send_try(get_email, "", msg2);
            }
            if (TextBox5.Text.Length != 0)
            {
                if (note[4])
                {
                    if (TextBox5.Text.Equals(lst[4])) { }
                    else
                    {
                        get_email = "select email from USER_DATA where Id=" + lst[4];
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "", msg2);
                        qry = "update BOOTH set CountingAgent = " + TextBox5.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                        run_ins_del(qry);
                        get_email = "select email from USER_DATA where Id=" + TextBox5.Text;
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "CountingAgent", msg);
                    }
                }
                else
                {
                    qry = "update BOOTH set CountingAgent = " + TextBox5.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                    run_ins_del(qry);
                    get_email = "select email from USER_DATA where Id=" + TextBox5.Text;
                    get_email = run_select<string>(get_email);
                    Mail_Send_try(get_email, "CountingAgent", msg);
                }
            }
            else if (note[4])
            {
                qry = "update BOOTH set CountingAgent =NULL where B_Id=" + DropDownList3.SelectedValue.ToString();
                run_ins_del(qry);
                get_email = "select email from USER_DATA where Id=" + lst[4];
                get_email = run_select<string>(get_email);
                Mail_Send_try(get_email, "", msg2);
            }
            if (TextBox6.Text.Length != 0)
            {
                if (note[5])
                {
                    if (TextBox6.Text.Equals(lst[5])) { }
                    else
                    {
                        get_email = "select email from USER_DATA where Id=" + lst[5];
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "", msg2);
                        qry = "update BOOTH set DistrictAssembly = " + TextBox6.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                        run_ins_del(qry);
                        get_email = "select email from USER_DATA where Id=" + TextBox6.Text;
                        get_email = run_select<string>(get_email);
                        Mail_Send_try(get_email, "DistrictAssembly", msg);
                    }
                }
                else
                {
                    qry = "update BOOTH set DistrictAssembly = " + TextBox6.Text + " where B_Id=" + DropDownList3.SelectedValue.ToString();
                    run_ins_del(qry);
                    get_email = "select email from USER_DATA where Id=" + TextBox6.Text;
                    get_email = run_select<string>(get_email);
                    Mail_Send_try(get_email, "DistrictAssembly", msg);
                }
            }
            else if (note[5])
            {
                qry = "update BOOTH set DistrictAssembly =NULL where B_Id=" + DropDownList3.SelectedValue.ToString();
                run_ins_del(qry);
                get_email = "select email from USER_DATA where Id=" + lst[5];
                get_email = run_select<string>(get_email);
                Mail_Send_try(get_email, "", msg2);
            }
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Data Updated Successfully.')", true);
            Response.Redirect("BoothJobPost.aspx");
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            lst = run_select_row("select BLO,CampusAmbassador,ElectionAgent,PoolingAgent,CountingAgent,DistrictAssembly from BOOTH where B_Id=" + DropDownList3.SelectedValue.ToString());
            TextBox1.Text = lst[0];
            TextBox2.Text = lst[1];
            TextBox3.Text = lst[2];
            TextBox4.Text = lst[3];
            TextBox5.Text = lst[4];
            TextBox6.Text = lst[5];
            if (lst[0].Length != 0)
                note[0] = true;
            if (lst[1].Length != 0)
                note[1] = true;
            if (lst[2].Length != 0)
                note[2] = true;
            if (lst[3].Length != 0)
                note[3] = true;
            if (lst[4].Length != 0)
                note[4] = true;
            if (lst[5].Length != 0)
                note[5] = true;
        }
        private List<string> run_select_row(String query1)
        {
            try
            {
                SqlDataReader rdr;
                List<string> idis = new List<string>();
                SqlConnection myconn = new SqlConnection();
                myconn.ConnectionString = Application["cs"].ToString();
                myconn.Open();
                SqlCommand sqlcmd = new SqlCommand(query1, myconn);
                rdr = sqlcmd.ExecuteReader();
                rdr.Read();
                idis.Add(rdr[0].ToString());
                idis.Add(rdr[1].ToString());
                idis.Add(rdr[2].ToString());
                idis.Add(rdr[3].ToString());
                idis.Add(rdr[4].ToString());
                idis.Add(rdr[5].ToString());
                myconn.Close();
                return idis;
            }
            catch (Exception excc)
            {
                return default(List<string>);
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

        public void Mail_Send_try(string to, string sub, string msg)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient sc = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("nikheel.patel0007@gmail.com");
                mail.To.Add(to);
                mail.Subject = "Electoral Committy Decision";
                if (sub.Length != 0)
                    mail.Body = msg + " Your Duty will be as " + sub;
                else
                    mail.Body = msg;
                sc.Port = 587;
                sc.Credentials = new System.Net.NetworkCredential("nikheel.patel0007@gmail.com", "----");
                sc.EnableSsl = true;
                sc.Send(mail);
                Console.WriteLine("Message send successfully.");
            }
            catch (Exception exc) { Console.WriteLine(exc); }
        }
    }
}