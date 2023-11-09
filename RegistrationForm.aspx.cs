using System;
using System.Data.SqlClient;
using Student_InformationSystem.Common;
using System.Configuration;
namespace Student_InformationSystem
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connectionString = "Server=VIGNASH\\SQLEXPRESS;Initial Catalog=Siddhartha_DB;uid=sa;pwd=Siva@123;";
            
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {

                    con.Open();
                    string query="INSERT INTO Student_Login (UserName,Password,Email,Address,Gender,DateOfBirth) "+
                        "VALUES('"+txtUserName.Text+"','"+Encrypt_Decrypt.Encrypt(txtPwd.Text)+"','"+txtEmail.Text+"','"+txtAddress.Text+"','"+txtGender.Text+"','"+txtDateOfBirth.Text+"')";
                   
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();

                }
                ClearTextboxes();
            }
            catch (Exception ex)
            { }
            finally
            { }
        }
        void ClearTextboxes()
        {
            txtAddress.Text = "";
            txtUserName.Text = "";
            txtPwd.Text = "";
            txtAddress.Text = "";
            txtGender.Text = "";
        }
    }
}