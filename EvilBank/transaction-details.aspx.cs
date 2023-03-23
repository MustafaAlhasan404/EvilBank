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
    public partial class WebForm13 : System.Web.UI.Page
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

            string id = Request.Params["id"];
            int transactionId = int.Parse(id);
            string receiverAccountIdStr = "";

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection2 = new SqlConnection(connectionString))
            {
                connection2.Open();
                string sqlselect = "SELECT * FROM transactions WHERE transaction_id=@id";
                using (SqlCommand command = new SqlCommand(sqlselect, connection2))
                {
                    command.Parameters.AddWithValue("@id", transactionId);
                    SqlDataReader reader = command.ExecuteReader();
                    reader.Read();
                    transactionIdLabel.Text = reader["transaction_id"].ToString();
                    accountIdLabel.Text = reader["account_id"].ToString();
                    transactionTypeLabel.Text = reader["transaction_type"].ToString();
                    amoountLabel.Text = reader["amount"].ToString();
                    dateLabel.Text = reader["date"].ToString();
                    receiverAccountIdLabel.Text = reader["receiver_account_id"].ToString();
                    receiverAccountIdStr = reader["receiver_account_id"].ToString();
                    notesLabel.Text = reader["notes"].ToString();
                    reader.Close();
                }
            }
            if (receiverAccountIdStr != "")
            {
                int receiverAccountID = int.Parse(receiverAccountIdStr);
                using (SqlConnection connection3 = new SqlConnection(connectionString))
                {
                    connection3.Open();
                    string sqlselect = "SELECT * FROM accounts,users WHERE accounts.user_id = users.user_id AND accounts.account_id=@receiverId";
                    using (SqlCommand command = new SqlCommand(sqlselect, connection3))
                    {
                        command.Parameters.AddWithValue("@receiverId", receiverAccountID);
                        SqlDataReader reader = command.ExecuteReader();
                        reader.Read();
                        receiverAccountTypeLabel.Text = reader["account_type"].ToString();
                        receiverNameLabel.Text = reader["first_name"].ToString() + " " + reader["last_name"].ToString();
                        reader.Close();
                    }
                }
            }
        }
    }
}