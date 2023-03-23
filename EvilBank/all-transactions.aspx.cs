using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EvilBank
{
    public partial class WebForm10 : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                // Bind the DataGrid to a data source
                TransactionsDataGrid.DataKeyField = "transaction_id"; // Ensure that the DataKeyField property is set to the correct primary key of your data

                string SelectCommand = "SELECT * FROM [transactions]";
                clientTransactionsDataSource.SelectCommand = SelectCommand;

                TransactionsDataGrid.DataBind();
            }
        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            DataGridItem row = (DataGridItem)btn.NamingContainer;
            int index = row.ItemIndex;
            string ID = TransactionsDataGrid.DataKeys[index].ToString();

            string transactionUrl = "transaction-details.aspx?id=" + ID;

            Response.Redirect(transactionUrl);
        }
    }
}