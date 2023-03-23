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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["UserInfo"];

            string userId = "";

            if (userCookie == null || userCookie["user_type"] == "admin")
            {
                Response.Redirect("login.aspx");
            }
            else if (userCookie != null)
            {
                userId = userCookie["user_id"];
                string firstName = userCookie["first_name"];
                string lastName = userCookie["last_name"];
                fullNameLabel.InnerText = firstName + " " + lastName;
            }

            string SelectCommand = "SELECT transaction_id, account_type, transaction_type, amount, date, notes FROM [accounts],[transactions] WHERE accounts.account_id = transactions.account_id AND accounts.user_id = ";
            SelectCommand += userId;

            if (!IsPostBack)
            {
                transferAccountSelect.Items.Add(new ListItem("-", "-"));
                withdrawAccountSelect.Items.Add(new ListItem("-", "-"));
                depositAccountSelect.Items.Add(new ListItem("-", "-"));
                // Connect to the database and retrieve the accounts for the user
                string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string selectSql = "SELECT account_id, account_type FROM accounts WHERE user_id = @userId";
                    using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                    {
                        selectCommand.Parameters.AddWithValue("@userId", userId);
                        using (SqlDataReader reader = selectCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Create an <option> element for each account and add it to the <select> element
                                int accountId = (int)reader["account_id"];
                                string accountType = (string)reader["account_type"];
                                transferAccountSelect.Items.Add(new ListItem(accountType, accountId.ToString()));
                                withdrawAccountSelect.Items.Add(new ListItem(accountType, accountId.ToString()));
                                depositAccountSelect.Items.Add(new ListItem(accountType, accountId.ToString()));
                            }
                        }
                    }
                }

                // Bind the DataGrid to a data source
                clientTransactionsDataSource.SelectCommand = SelectCommand;
                TransactionsDataGrid.DataKeyField = "transaction_id";
                TransactionsDataGrid.DataBind();
            }

            transferButton.Visible = false;
        }

        protected void transferAccountSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Retrieve the selected account ID
            string selectedAccountId = transferAccountSelect.SelectedValue;

            if (selectedAccountId == "-")
            {
                transferBalanceLabel.Text = "";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectSql = "SELECT balance FROM accounts WHERE account_id = @accountId";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", selectedAccountId);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display the balance on the Label control
                            transferBalanceLabel.Text = reader["balance"].ToString();
                        }
                    }
                }
            }
        }

        protected void withdrawAccountSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Retrieve the selected account ID
            string selectedAccountId = withdrawAccountSelect.SelectedValue;

            if (selectedAccountId == "-")
            {
                withdrawBalanceLabel.Text = "";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectSql = "SELECT balance FROM accounts WHERE account_id = @accountId";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", selectedAccountId);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display the balance on the Label control
                            withdrawBalanceLabel.Text = reader["balance"].ToString();
                        }
                    }
                }
            }
        }

        protected void depositAccountSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Retrieve the selected account ID
            string selectedAccountId = depositAccountSelect.SelectedValue;

            if (selectedAccountId == "-")
            {
                depositBalanceLabel.Text = "";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectSql = "SELECT balance FROM accounts WHERE account_id = @accountId";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", selectedAccountId);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display the balance on the Label control
                            depositBalanceLabel.Text = reader["balance"].ToString();
                        }
                    }
                }
            }
        }

        protected void withdrawButton_Click(object sender, EventArgs e)
        {
            string withdrawAmount = withdrawAmountInput.Value;
            int amount = int.Parse(withdrawAmount);
            int balance = 0;
            string notes = withdrawNotesInput.Value;

            // Retrieve the selected account ID
            string accountIdStr = withdrawAccountSelect.SelectedValue;
            if (accountIdStr == "-")
            {
                withdrawErrorLabel.Text = "Please choose an account";
                return;
            }
            int accountId = int.Parse(accountIdStr);

            balance = getBalance(accountId);
            if (amount > balance)
            {
                withdrawErrorLabel.Text = "Funds unavailable, you can try withdrawing less";
                return;
            }

            withdraw(accountId, amount);

            //Insert transaction into DB
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "INSERT INTO transactions (account_id, transaction_type, amount, date, receiver_account_id, notes) VALUES (@accountId, @transactionType, @amount, @date, @receiverAccountId, @notes)";
                using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@accountId", accountId);
                    insertCommand.Parameters.AddWithValue("@transactionType", "WITHDRAW");
                    insertCommand.Parameters.AddWithValue("@amount", amount);
                    insertCommand.Parameters.AddWithValue("@date", DateTime.Now);
                    insertCommand.Parameters.AddWithValue("@receiverAccountId", DBNull.Value);
                    insertCommand.Parameters.AddWithValue("@notes", notes);
                    insertCommand.ExecuteNonQuery();
                }
                string selectSql = "SELECT transaction_id FROM transactions WHERE account_id = @accountId AND amount = @amount AND notes = @notes";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", accountId);
                    selectCommand.Parameters.AddWithValue("@amount", amount);
                    selectCommand.Parameters.AddWithValue("@notes", notes);
                    SqlDataReader reader = selectCommand.ExecuteReader();
                    reader.Read();
                    string transactionId = reader["transaction_id"].ToString();
                    string transactionUrl = "transaction.aspx?id=" + transactionId;

                    TransactionsDataGrid.DataBind();
                    Response.Redirect(transactionUrl);
                    reader.Close();
                }
            }
        }

        protected void depositButton_Click(object sender, EventArgs e)
        {
            string depositAmount = depositAmountInput.Value;
            int amount = int.Parse(depositAmount);
            int balance = 0;
            string notes = depositNotesInput.Value;

            // Retrieve the selected account ID
            string accountIdStr = depositAccountSelect.SelectedValue;

            if (accountIdStr == "-")
            {
                depositErrorLabel.Text = "Please choose an account";
                return;
            }
            if (amount <= 0)
            {
                withdrawErrorLabel.Text = "What you depositing bro?";
                return;
            }

            int accountId = int.Parse(accountIdStr);

            balance = getBalance(accountId);

            deposit(accountId, amount);


            // Insert transaction into DB
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "INSERT INTO transactions (account_id, transaction_type, amount, date, receiver_account_id, notes) VALUES (@accountId, @transactionType, @amount, @date, @receiverAccountId, @notes)";
                using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@accountId", accountId);
                    insertCommand.Parameters.AddWithValue("@transactionType", "DEPOSIT");
                    insertCommand.Parameters.AddWithValue("@amount", amount);
                    insertCommand.Parameters.AddWithValue("@date", DateTime.Now);
                    insertCommand.Parameters.AddWithValue("@receiverAccountId", DBNull.Value);
                    insertCommand.Parameters.AddWithValue("@notes", notes);
                    insertCommand.ExecuteNonQuery();
                }
                string selectSql = "SELECT transaction_id FROM transactions WHERE account_id = @accountId AND amount = @amount AND notes = @notes";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", accountId);
                    selectCommand.Parameters.AddWithValue("@amount", amount);
                    selectCommand.Parameters.AddWithValue("@notes", notes);
                    SqlDataReader reader = selectCommand.ExecuteReader();
                    reader.Read();
                    string transactionId = reader["transaction_id"].ToString();
                    string transactionUrl = "transaction.aspx?id=" + transactionId;

                    TransactionsDataGrid.DataBind();
                    Response.Redirect(transactionUrl);
                    reader.Close();
                }
            }
            TransactionsDataGrid.DataBind();
        }

        protected void selectButton_Click(object sender, EventArgs e)
        {
            string receiverAccountIdStr = recipientAccountIdInput.Value;
            int receiverAccountId = int.Parse(receiverAccountIdStr);

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "SELECT * FROM users,accounts WHERE users.user_id = accounts.user_id AND accounts.account_id = @RecieverAccountId";
                using (SqlCommand selectCommand = new SqlCommand(insertSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@RecieverAccountId", receiverAccountId);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // set values of appropriate Labels
                            recipientIdLabel.Text = reader["account_id"].ToString() + ", " + reader["account_type"].ToString();
                            recipientNameLabel.Text = reader["first_name"].ToString() + " " + reader["last_name"].ToString();
                            recipientAddressLabel.Text = reader["address"].ToString();
                            recipientPhoneLabel.Text = reader["phone"].ToString();

                            transferButton.Visible = true;
                            return;
                        }
                        else
                        {
                            // Account not found
                            transferErrorLabel.Text = "Account not found";
                            return;
                        }
                    }
                }
            }

        }

        protected void transferButton_Click(object sender, EventArgs e)
        {
            /*
             * get both perties info
             * check blance of sender
             * if valid
             *  withdraw from sender
             *  deposit into receiver
             *  record data in db
            */

            string transferAmount = transferAmountInput.Value;
            int amount = int.Parse(transferAmount);
            string notes = transferNotesInput.Value;

            // Retrieve the selected account ID
            string accountIdStr = transferAccountSelect.SelectedValue;

            if (accountIdStr == "-")
            {
                transferErrorLabel.Text = "Please choose an account";
                return;
            }
            if (amount <= 0)
            {
                transferErrorLabel.Text = "What you transfering bro?";
                return;
            }

            int accountId = int.Parse(accountIdStr);
            int balance = getBalance(accountId);

            if (amount > balance)
            {
                transferErrorLabel.Text = "What you transfering bro?";
                return;
            }


            string receiverAccountIdStr = recipientAccountIdInput.Value;
            int receiverAccountId = int.Parse(receiverAccountIdStr);

            withdraw(accountId, amount);
            deposit(receiverAccountId, amount);

            // Insert transaction into DB
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "INSERT INTO transactions (account_id, transaction_type, amount, date, receiver_account_id, notes) VALUES (@accountId, @transactionType, @amount, @date, @receiverAccountId, @notes)";
                using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@accountId", accountId);
                    insertCommand.Parameters.AddWithValue("@transactionType", "TRANSFER");
                    insertCommand.Parameters.AddWithValue("@amount", amount);
                    insertCommand.Parameters.AddWithValue("@date", DateTime.Now);
                    insertCommand.Parameters.AddWithValue("@receiverAccountId", receiverAccountId);
                    insertCommand.Parameters.AddWithValue("@notes", notes);
                    insertCommand.ExecuteNonQuery();
                }
                string selectSql = "SELECT transaction_id FROM transactions WHERE account_id = @accountId AND amount = @amount AND notes = @notes";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", accountId);
                    selectCommand.Parameters.AddWithValue("@amount", amount);
                    selectCommand.Parameters.AddWithValue("@notes", notes);
                    SqlDataReader reader = selectCommand.ExecuteReader();
                    reader.Read();
                    string transactionId = reader["transaction_id"].ToString();
                    string transactionUrl = "transaction.aspx?id=" + transactionId;

                    TransactionsDataGrid.DataBind();
                    Response.Redirect(transactionUrl);
                    reader.Close();
                }
            }
            TransactionsDataGrid.DataBind();
        }

        protected int getBalance(int accountId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectSql = "SELECT balance FROM accounts WHERE account_id = @accountId";
                using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                {
                    selectCommand.Parameters.AddWithValue("@accountId", accountId);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Return the balance
                            return reader.GetInt32(0);
                        }
                        else
                        {
                            return 0;
                        }
                    }
                }
            }
        }

        protected void withdraw(int accountId, int amount)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "UPDATE accounts SET balance = balance - @amount WHERE account_id = @accountId";
                using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@accountId", accountId);
                    insertCommand.Parameters.AddWithValue("@amount", amount);
                    insertCommand.ExecuteNonQuery();
                }
            }
        }

        protected void deposit(int accountId, int amount)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertSql = "UPDATE accounts SET balance = balance + @amount WHERE account_id = @accountId";
                using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                {
                    insertCommand.Parameters.AddWithValue("@accountId", accountId);
                    insertCommand.Parameters.AddWithValue("@amount", amount);
                    insertCommand.ExecuteNonQuery();
                }
            }
        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            DataGridItem row = (DataGridItem)btn.NamingContainer;
            int index = row.ItemIndex;
            string ID = TransactionsDataGrid.DataKeys[index].ToString();

            string transactionUrl = "transaction.aspx?id=" + ID;

            Response.Redirect(transactionUrl);
        }

        public DataTable GetDataFromDatabase()
        {
            HttpCookie userCookie = Request.Cookies["UserInfo"];
            string userId = userCookie["user_id"];
            string SelectCommand = "SELECT transaction_id, account_type, transaction_type, amount, date, notes FROM [accounts],[transactions] WHERE accounts.account_id = transactions.account_id AND accounts.user_id = ";
            SelectCommand += userId;

            DataTable data = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(SelectCommand, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(data);
                    }
                }
                conn.Close();
            }
            return data;
        }
    }
}