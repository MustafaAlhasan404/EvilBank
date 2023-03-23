using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EvilBank
{
	public partial class WebForm3 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			HttpCookie userCookie = Request.Cookies["UserInfo"];

			if (userCookie == null)
			{
				Response.Redirect("login.aspx");
			}
		}
	}
}