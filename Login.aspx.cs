using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Student_InformationSystem.Common;
namespace Student_InformationSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {            

            UserLogin(txtUserName.Text, txtPwd.Text);
        }

        void UserLogin(string userName,string pwd)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT UserName,Password,Role From Student_Login WHERE UserName='" + userName + "' AND Password='" + Encrypt_Decrypt.Encrypt(pwd) + "'";

                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "StudentLogin");
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        string UserName = ds.Tables[0].Rows[0]["UserName"].ToString();
                        string Pwd = ds.Tables[0].Rows[0]["Password"].ToString();
                        Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                        if (UserName == userName && Encrypt_Decrypt.Decrypt(Pwd) == pwd)
                        {
                            Session["User"] = txtUserName.Text.Trim();
                            Response.Redirect("MyProfile.aspx");
                        }
                    }
                    else {
                        lblMsg.Text = "Invalid UserName/Password!";
                    }
                }
                catch (Exception ex)
                {
                    ErroLogging.LogErrorDetails(ex.Message, ex.StackTrace, this.GetType().Name, (Session["User"]!=null?Session["User"].ToString():null));
                }
                finally
                { 
                }


            }
        }
    }
}