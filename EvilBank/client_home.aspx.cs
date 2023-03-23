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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["UserInfo"];
            if (userCookie == null || userCookie["user_type"] == "admin")
            {
                Response.Redirect("login.aspx");
            } else
            {
                int userId = Convert.ToInt32(userCookie["user_id"]);
                string firstName = userCookie["first_name"];
                string lastName = userCookie["last_name"];

                // Use the values from the cookie
                fullNameLabel.InnerText = firstName + " " + lastName;
                firstNameLabel.InnerText = firstName;

                string SelectCommand = "SELECT * FROM [accounts],[transactions] WHERE accounts.account_id = transactions.account_id AND accounts.user_id = ";
                SelectCommand += userId;
                clientTransactionsDataSource.SelectCommand = SelectCommand;

                SelectCommand = "SELECT * FROM [accounts] WHERE user_id = ";
                SelectCommand += userId;
                ClientAccountsDataSource.SelectCommand = SelectCommand;

            }
        }

        protected void createAccountButton_Click(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["UserInfo"];
            int userId = Convert.ToInt32(userCookie["user_id"]);

            string accountType = accountTypeInput.Value;

            string balanceStr = startingBalanceInput.Value;
            int balance = int.Parse(balanceStr);

            if (balance < 0)
            {
                createAccountErrorLabel.Text = "Starting Balance cannot be below 0!";
                return;
            }

            //Insert transaction into DB
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "INSERT INTO accounts (user_id, account_type, balance) VALUES (@userId, @accountType, @balance)";
                using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@userId", userId);
                    insertCommand.Parameters.AddWithValue("@accountType", accountType);
                    insertCommand.Parameters.AddWithValue("@balance", balance);
                    insertCommand.ExecuteNonQuery();
                }
            }
            GridView2.DataBind();
        }
    }
}