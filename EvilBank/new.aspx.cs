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
    public partial class WebForm5 : System.Web.UI.Page
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

        protected void create_Click(object sender, EventArgs e)
        {
            /*
           ageInput;
           genderSelect;
           */
            String userID = "";
            String age = Request["ageInput"];
            String firstName = Request["firstNameInput"];
            String lastName = Request["lastNameInput"];
            String Name = firstName + " " + lastName;
            String phone = Request["phoneInput"];
            String email = Request["emailInput"];
            string gender = Request.Form["genderSelect"];

            /*
			 Not sure if the date thing works for the db schema, is it yyyy-mm-dd?
			*/

            int birthYear = 2023 - int.Parse(Request["ageInput"]);
            string birthdate = birthYear + "-01-01";

            string city = Request["cityInput"];
            string address = Request["addressInput"];
            String username = Request["usernameInput"];
            String password = Request["passwordInput"];


            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;

            if (IsEmpty(firstName, lastName, phone, email, gender, birthdate, city, address, username, password) == true
                && validNumber(phone) == true
                && IsValidName(Name) == true
                && IsValidAge(age) == true)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "INSERT INTO users (first_name, last_name,email,phone,address,birthdate,gender,city)" +
                        " VALUES (@FirstName, @LastName,@Email,@Phone,@Address,@BirthDate,@Gender,@City)";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Phone", phone);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@BirthDate", birthdate);
                        command.Parameters.AddWithValue("@Gender", gender);
                        command.Parameters.AddWithValue("@City", city);
                        command.ExecuteNonQuery();
                    }
                }

                using (SqlConnection connection2 = new SqlConnection(connectionString))
                {
                    connection2.Open();
                    //maybe just like this
                    string sqlselect = "SELECT * FROM users WHERE first_name=@FirstName AND last_name=@LastName AND address=@Address";
                    using (SqlCommand command = new SqlCommand(sqlselect, connection2))
                    {
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Address", address);
                        SqlDataReader reader = command.ExecuteReader();
                        reader.Read();
                        userID = (string)reader["user_id"].ToString();
                        reader.Close();
                    }

                    string sqlinsert = "INSERT INTO credentials (user_id,username,password,user_type)" +
                        " VALUES (@user_id,@UserName,@Password,0)";
                    using (SqlCommand command = new SqlCommand(sqlinsert, connection2))
                    {
                        command.Parameters.AddWithValue("@user_id", userID);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@UserName", username);
                        command.ExecuteNonQuery();
                    }
                }
                Response.Redirect("clients.aspx");
            }
            //+ make sure none of the values are empty (!="") and then make sure that they are in the form we want
            //+ i.e. no numbers in name, no letters in phone number, etc...


            //+ perform query to insert into both tables (users & credentials)
            //+ in this form the 4th parameter of credentials is always 0 (for "Client")

            /* done
			 this is the only step left
             * Perform the insert on 'users' first,
             * get the user_id,
             * then insert into the 'credentials' table using the newly obtained ID
            */

            //used in functions / If you want to display the error message
            //lblError.Text = "error goes here (if any)";
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
