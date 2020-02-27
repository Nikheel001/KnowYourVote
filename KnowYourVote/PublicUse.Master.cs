using System;
using System.Collections.Generic;
using System.Configuration;
using System.Xml;

namespace KnowYourVote
{
    public partial class PublicUse : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application["cs"] = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            Application["AL"] = create_admin_list();
        }

        private List<String> create_admin_list()
        {
            try
            {
                List<String> AL = new List<string>();
                XmlDocument doc = new XmlDocument();
                doc.Load("C:\\Users\\home\\Source\\Repos\\SDP\\KnowYourVote\\KnowYourVote\\App_Data\\Admin_id.xml");
                XmlNode node = doc.SelectSingleNode("Admin");
                foreach (XmlNode usr in node.ChildNodes) AL.Add(usr.InnerText);
                return AL;
            }
            catch (Exception ecd)
            {
                //Response.Write(ecd+"\n");
                Response.Write("Change path of XML FILE \n");
                return default(List<String>);
            }
        }
    }
}