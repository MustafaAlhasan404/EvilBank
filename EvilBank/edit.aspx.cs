using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EvilBank
{
    public partial class WebForm11 : System.Web.UI.Page
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
            int editId = int.Parse(id);

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection connection2 = new SqlConnection(connectionString))
            {
                connection2.Open();
                string sqlselect = "SELECT * FROM users,credentials WHERE users.user_id = credentials.user_id AND users.user_id=@id";
                using (SqlCommand command = new SqlCommand(sqlselect, connection2))
                {
                    command.Parameters.AddWithValue("@id", editId);
                    SqlDataReader reader = command.ExecuteReader();
                    reader.Read();
                    firstNameInput.Value = reader["first_name"].ToString();
                    lastNameInput.Value = reader["last_name"].ToString();
                    emailInput.Value = reader["email"].ToString();
                    phoneInput.Value = reader["phone"].ToString();
                    // Age is empty because I want to use it as a de facto confirmation
                    addressInput.Value = reader["address"].ToString();
                    genderSelect.Value = reader["gender"].ToString();
                    cityInput.Value = reader["city"].ToString();
                    usernameInput.Value = reader["username"].ToString();
                    passwordInput.Value = reader["password"].ToString();
                    reader.Close();
                }
            }
        }

        protected void create_Click(object sender, EventArgs e)
        {
            String userID = "";
            String age = Request["ageInput"];
            String firstName = Request["firstNameInput"];
            String lastName = Request["lastNameInput"];
            String Name = firstName + " " + lastName;
            String phone = Request["phoneInput"];
            String email = Request["emailInput"];
            string gender = Request.Form["genderSelect"];

            int birthYear = 2023 - int.Parse(Request["ageInput"]);
            string birthdate = birthYear + "-01-01";

            string city = Request["cityInput"];
            string address = Request["addressInput"];
            String username = Request["usernameInput"];
            String password = Request["passwordInput"];

            string id = Request.Params["id"];
            int editId = int.Parse(id);

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;

            if (IsEmpty(firstName, lastName, phone, email, gender, birthdate, city, address, username, password) == true
                && validNumber(phone) == true
                && IsValidName(Name) == true
                && IsValidAge(age) == true)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateUsers = "UPDATE users SET first_name=@FirstName, last_name=@LastName,email=@Email,phone=@Phone,address=@Address,birthdate=@BirthDate,gender=@Gender,city=@City WHERE user_id=@id";
                    using (SqlCommand command = new SqlCommand(updateUsers, connection))
                    {
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Phone", phone);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@BirthDate", birthdate);
                        command.Parameters.AddWithValue("@Gender", gender);
                        command.Parameters.AddWithValue("@City", city);
                        command.Parameters.AddWithValue("@id", editId);
                        command.ExecuteNonQuery();
                    }

                    string updateCredentials = "UPDATE credentials SET username=@Username, password=@Password WHERE user_id=@id";
                    using (SqlCommand command = new SqlCommand(updateCredentials, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@id", editId);
                        command.ExecuteNonQuery();
                    }
                }

                Response.Redirect("clients.aspx");
            }
        }

        protected Boolean IsEmpty(String firstName, String lastName, String phone,
            String email, string gender, string birthdate,
            string city, string address, String username, String password)
        {
            if (firstName == "" || lastName == "" || lastName == "" || lastName == ""
                || phone == "" || email == "" || gender == ""
                || birthdate == "" || city == "" || address == ""
                || username == "" || password == "")
            {
                lblError.Text = "some values are left empty";
                return false;
            }
            else
                return true;
        }
        protected Boolean validNumber(String phone)
        {
            Regex regex = new Regex(@"^09\d{8}$");
            Boolean value = regex.IsMatch(phone);
            if (value == false)
            {
                lblError.Text = "phone number is longer than 10 digits or include a charechter";
                return false;
            }
            else
                return value;
        }
        public Boolean IsValidName(string name)
        {
            Boolean value = !name.Any(char.IsDigit);
            if (value == false)
            {
                lblError.Text = "name include a number";
                return false;
            }
            else
            {
                return value;
            }
        }
        public Boolean IsValidAge(string age)
        {
            int ageValue = Int32.Parse(age);
            Boolean value = age.Any(char.IsDigit);
            if (value == false)
            {
                lblError.Text = "name include a number";
                return false;
            }
            else if (ageValue > 100)
            {
                lblError.Text = "Age can't be higher than 100 years";
                return false;
            }
            else
                return value;
        }
    }
}