using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
namespace Student_InformationSystem.Common
{
    public class ErroLogging
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        public static void LogErrorDetails(string exception, string exceptionStack, string pageName, string userSession)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand("USP_ERRORLOGGING", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@ErrorMessage", SqlDbType.VarChar).Value = exception;
                        cmd.Parameters.Add("@ErrorStack", SqlDbType.VarChar).Value = exceptionStack;
                        cmd.Parameters.Add("@ErrorPage", SqlDbType.VarChar).Value = pageName;
                        cmd.Parameters.Add("@UserSession", SqlDbType.VarChar).Value = userSession;

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}