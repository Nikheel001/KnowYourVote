using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowYourVote
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String str;
            if (Session["_id"] != null)
            {
                Label1.Text = Session["_id"].ToString();
                Label1.Visible = true;
                Response.Redirect("~/TrendingNow.aspx?ali=im_in");
            }
            else
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                Label1.Visible = false;
                str = Request.QueryString["rbt"];
                if (str != null)
                {
                    if (str.Equals("nmorpwd"))
                    {
                        Label1.Text = "Username or Password is incorrect";
                        Label1.Visible = true;
                    }
                }
            }
        }
    }
}