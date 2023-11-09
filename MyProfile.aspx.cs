using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
namespace Student_InformationSystem
{
    public partial class _MyProfile : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT UserName, Email, Address, Gender, DateOfBirth FROM Student_Login WHERE UserName = '"+Session["User"].ToString()+"'";

                SqlCommand cmd = new SqlCommand(query, con);
               SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtUserName.Text = dr["UserName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                    txtGender.Text = dr["Gender"].ToString();
                    txtDateOfBirth.Text = dr["DateOfBirth"].ToString();
                }

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE Student_Login SET UserName='" + txtUserName.Text + "', Email ='" + txtEmail.Text + "',"+
                    " Address = '"+txtAddress.Text+ "' WHERE UserName= '"+Session["User"]+"'";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                

            }
        }
    }
}