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
    public partial class WebForm2 : System.Web.UI.Page
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
                DataTable data = new DataTable();
                data = GetDataFromDatabase();
                DataGrid1.DataKeyField = "user_id"; // Ensure that the DataKeyField property is set to the correct primary key of your data
                DataGrid1.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Get the button that was clicked
            Button btn = (Button)sender;
            // Get the row that contains the button
            DataGridItem row = (DataGridItem)btn.NamingContainer;
            // Get the index of the row
            int index = row.ItemIndex;
            int ID = Convert.ToInt32(DataGrid1.DataKeys[row.ItemIndex]);

            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string sql = "DELETE FROM credentials WHERE user_id = @ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            using (SqlConnection conn2 = new SqlConnection(connectionString))
            {
                conn2.Open();
                string sql = "DELETE FROM users WHERE user_id = @ID";
                SqlCommand cmd = new SqlCommand(sql, conn2);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.ExecuteNonQuery();
                conn2.Close();
            }
            DataGrid1.DataBind();
        }
        public DataTable GetDataFromDatabase()
        {
            DataTable data = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["bankdbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM users", conn))
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Get the button that was clicked
            Button btn = (Button)sender;
            // Get the row that contains the button
            DataGridItem row = (DataGridItem)btn.NamingContainer;
            // Get the index of the row
            int index = row.ItemIndex;
            int ID = Convert.ToInt32(DataGrid1.DataKeys[row.ItemIndex]);

            string redirectUrl = "edit.aspx?id=";
            redirectUrl += ID;
            Response.Redirect(redirectUrl);
        }
    }
}