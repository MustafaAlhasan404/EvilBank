using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EvilBank
{
	public partial class WebForm4 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            HttpCookie userCookie = Request.Cookies["UserInfo"];
            if (userCookie == null || userCookie["user_type"] == "admin")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string firstName = userCookie["first_name"];
                string lastName = userCookie["last_name"];

                // Use the values from the cookie
                fullNameLabel.InnerText = firstName + " " + lastName;

            }
        }
	}
}