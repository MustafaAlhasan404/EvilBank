using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EvilBank
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["UserInfo"];
            if (userCookie == null || userCookie["user_type"] == "client")
            {
                Response.Redirect("login.aspx");
            }

            string firstName = userCookie["first_name"];
            string lastName = userCookie["last_name"];
            fullNameLabel.InnerText = firstName + " " + lastName;
        }
    }
}