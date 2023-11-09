using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Student_InformationSystem.Common;
using System.Web.UI.WebControls;

namespace Student_InformationSystem
{
    public partial class StudentsDetails : Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        private SqlConnection con = new SqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
            else if (!Page.IsPostBack)
            {
                BindGridviewData();
            }

        }
        public void BindGridviewData()
        {
            try
            {
                string query = "Select Id, Name, Class, Grade, Marks, Attendance, ContactNumber FROM Student_Details";
                
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grdStudentsDetails.DataSource = ds;
                    grdStudentsDetails.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    grdStudentsDetails.DataSource = ds;
                    grdStudentsDetails.DataBind();
                    int columncount = grdStudentsDetails.Rows[0].Cells.Count;
                    grdStudentsDetails.Rows[0].Cells.Clear();
                    grdStudentsDetails.Rows[0].Cells.Add(new TableCell());
                    grdStudentsDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                    grdStudentsDetails.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
            catch (Exception ex)
            {
                ErroLogging.LogErrorDetails(ex.Message, ex.StackTrace, this.GetType().Name, Session["User"].ToString());
            }
        }
        protected void grdStudentsDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            int recordId = Convert.ToInt32(grdStudentsDetails.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)grdStudentsDetails.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("lblID");
           
            TextBox txtName = (TextBox)row.Cells[0].Controls[0];
            TextBox txtContactNumber = (TextBox)row.Cells[1].Controls[0];
            TextBox txtClass = (TextBox)row.Cells[2].Controls[0];
            TextBox txtGrade = (TextBox)row.Cells[3].Controls[0];
            TextBox txtAttendance = (TextBox)row.Cells[4].Controls[0];

            grdStudentsDetails.EditIndex = -1;
            con.Open();

            SqlCommand cmd = new SqlCommand("UPDATE Student_Details SET name='" + txtName.Text + "',Class='" + txtClass.Text + "'" +
                ",ContactNumber='" + txtContactNumber.Text + "','" + txtGrade.Text + "','" + txtAttendance.Text + "'"+
                "'WHERE Id='" + recordId + "'", con) ;
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridviewData();
        }
        protected void grdStudentsDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)grdStudentsDetails.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM detail where id='" + Convert.ToInt32(grdStudentsDetails.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridviewData();
        }
        protected void grdStudentsDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void grdStudentsDetails_RowCancelingEditing(object sender, GridViewCancelEditEventArgs e)
        {
            grdStudentsDetails.EditIndex = -1;
            BindGridviewData();
        }
    }
}