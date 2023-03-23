using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace EvilBank
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            String username = Request["usernameInput"];
            String password = Request["passwordInput"];

            // Check if the entered username and password are valid
            if (IsValidCredentials(username, password))
            {
                // If the login is successful, find the type of the user
                string userType = GetUserType(username);

                // Store user info in a cookie
                CreateCookie(username);

                // Redirect the user to the appropriate page based on the user type
                if (userType == "client")
                {
                    Response.Redirect("client_home.aspx");
                }
                else if (userType == "admin")
                {
                    Response.Redirect("admin_home.aspx");
                }
            }
            else
            {
                // If the login is not successful, display an error message
                lblError.Text = "Invalid username or password";
            }
        }

        private bool IsValidCredentials(string username, string password)
        {
            // Set up the connection to the database
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            // Set up the command to query the database
            string query = "SELECT COUNT(*) FROM credentials WHERE username = @username AND password = @password";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@username", username);
            command.Parameters.AddWithValue("@password", password);

            // Open the connection, execute the command, and close the connection
            connection.Open();
            int count = (int)command.ExecuteScalar();
            connection.Close();

            // If the count is 1, the username and password are valid. Otherwise, they are invalid.
            return count == 1;
        }

        private string GetUserType(string username)
        {
            // Set up the connection to the database
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            // Set up the command to query the database
            string query = "SELECT name FROM user_types, credentials WHERE credentials.user_type = user_types.user_type_id AND username = @username";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@username", username);

            // Open the connection, execute the command, and close the connection
            connection.Open();
            string userType = (string)command.ExecuteScalar();
            connection.Close();

            // Return the user type
            return userType;
        }

        private void CreateCookie(string username)
        {
            Response.Cookies.Remove("UserInfo");
            string userType = GetUserType(username);
            // Set up the connection to the database
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            // Set up the command to query the database
            string selectSql = "SELECT * FROM credentials, users WHERE credentials.user_id = users.user_id AND credentials.username = @user_id";
            SqlCommand selectCommand = new SqlCommand(selectSql, connection);
            selectCommand.Parameters.AddWithValue("@user_id", username);

            // Open the connection, execute the command, store info in the cookie, and close the connection
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();

            if (reader.Read())
            {
                HttpCookie userCookie = new HttpCookie("UserInfo");
                userCookie["user_id"] = reader["user_id"].ToString();
                userCookie["first_name"] = reader["first_name"].ToString();
                userCookie["last_name"] = reader["last_name"].ToString();
                userCookie["email"] = reader["email"].ToString();
                userCookie["phone"] = reader["phone"].ToString();
                userCookie["address"] = reader["address"].ToString();
                userCookie["birthdate"] = reader["birthdate"].ToString();
                userCookie["gender"] = reader["gender"].ToString();
                userCookie["city"] = reader["city"].ToString();
                userCookie["user_type"] = userType;
                userCookie["username"] = username;

                Response.Cookies.Add(userCookie);
            }

            reader.Close();
            connection.Close();

            return;
        }
    }
}