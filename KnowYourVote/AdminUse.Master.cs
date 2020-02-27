using System;

namespace KnowYourVote
{
    public partial class AdminUse : System.Web.UI.MasterPage
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
                    Response.Redirect("Home.aspx");
            }
            catch (NullReferenceException exc) { Response.Redirect("Home.aspx"); }
        }
    }
}