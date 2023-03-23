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
	public partial class WebForm7 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void Button2_Click(object sender, EventArgs e)
		{
			String AccountType = Request["AccountType"];
			String amountString = Request["NumberAmount"];

			int amount;
			int.TryParse(amountString, out amount);

			string senderID = "";

			HttpCookie userCookie = Request.Cookies["userInfo"];
			if (userCookie != null)
			{
				senderID = userCookie["user_id"];
			}


			String reciverID = Request["Id_R"];
			String AccountNumber = Request["AccountNumber"];
			String AccountT = Request["AccountType"];
			String Notes = Request["Notes"];
			DateTime dateTimeNow = DateTime.Now;

			decimal senderBalance = 0;
			decimal recipientBalance = 0;

			string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
			SqlConnection connection = new SqlConnection(connectionString);


			if (validation(reciverID) == true)
			{

			string selectSql = "SELECT * FROM accounts WHERE user_id = @sender and account_type=@AccountType" +
								"OR user_id = @recipient and acount_id=@recipientAccNum";
			SqlCommand selectCommand = new SqlCommand(selectSql, connection);
			SqlDataReader reader = selectCommand.ExecuteReader();
			selectCommand.Parameters.AddWithValue("@sender", senderID);
			selectCommand.Parameters.AddWithValue("@recipient", reciverID);
			selectCommand.Parameters.AddWithValue("@recipientAccNum", AccountNumber);			
			selectCommand.Parameters.AddWithValue("@AccountType", AccountType);



				if (reader.Read())
				{
					senderBalance = (decimal)reader["balance"];
					string username = (string)reader["userid"];
					string ACCnum = (string)reader["account_id"];
					if (checkbalance(senderBalance, amount) == true)
					{
						if (username == senderID)
						{
							senderBalance -= amount;
						}
						else if (username == reciverID && ACCnum==AccountNumber)
						{
							recipientBalance = (decimal)reader["balance"];
							recipientBalance += amount;
						}

						reader.Close();
					}
			else
			Response.Write("Error: The recipient's user ID does not exist in the database.");
			
				}

			string updateSql = "UPDATE accounts SET balance = @balance WHERE user_id = @username1 and user_id = @username2 ";
			SqlCommand updateCommand = new SqlCommand(updateSql, connection);
			updateCommand.Parameters.AddWithValue("@balance", senderBalance);
			updateCommand.Parameters.AddWithValue("@username1", senderID);
			updateCommand.ExecuteNonQuery();

			updateCommand.Parameters.Clear();
			updateCommand.Parameters.AddWithValue("@balance", recipientBalance);
			updateCommand.Parameters.AddWithValue("@username2", reciverID);
			updateCommand.ExecuteNonQuery();

			InsertData(senderID, amount, dateTimeNow, AccountNumber);
			}

		}
		public void InsertData(String senderID, int amount,DateTime dateTimeNow, string AccountNumber)
		{
			string connectionString = "Your Connection String Here";
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string sql = "INSERT INTO transactions (account_id, amount,date,reciver_account_id) VALUES (@user_id, @amountTransfared,@date,@recipientAccNum)";
				using (SqlCommand command = new SqlCommand(sql, connection))
				{
					command.Parameters.AddWithValue("@user_id", senderID);
					command.Parameters.AddWithValue("@amountTransfared", amount);
					command.Parameters.AddWithValue("@date", dateTimeNow);
					command.Parameters.AddWithValue("@recipientAccNum", AccountNumber);

					command.ExecuteNonQuery();
				}
			}
		}
		protected Boolean validation(String reciverID)
		{
			Response.Write("Money transferred successfully!");
			string selectSql2 = "SELECT COUNT(*) FROM accounts WHERE user_id = @recipient";

			string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
			SqlConnection connection = new SqlConnection(connectionString);

			SqlCommand selectCommand2 = new SqlCommand(selectSql2, connection);
			selectCommand2.Parameters.AddWithValue("@recipient", reciverID);

			int count = (int)selectCommand2.ExecuteScalar();
			if (count == 0)
			{
				// The recipient's user ID does not exist in the database
				return false;
			}
			else
				return true;

		}
		protected Boolean checkbalance(decimal senderBalance, int amount)
		{
			if (senderBalance < amount)
			{
				Response.Write("Error: Insufficient balance to complete transfer.");
				return false;
			}
			return true;
		}


	}

}
//data base of transactions
//Account number for reciver should be in conditions done
//Account number for sender should be defined for his balance
//sender id from cookies reciver id (AccNum)from input
//in database account_id is now sederid because he needs to know how the account belong to not their account type