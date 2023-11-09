using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data;
namespace Student_InformationSystem
{
    public partial class FacultyLogin : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
            clndrAttendacne.Visible = false;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "Select Id, Name, Class, Grade, Marks, Attendance, ContactNumber FROM Student_Details";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                System.Data.DataSet ds = new System.Data.DataSet();
                da.Fill(ds);
                //SqlDataReader dr = cmd.ExecuteReader();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                    lblName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    lblClass.Text = ds.Tables[0].Rows[0]["Class"].ToString();
                    lblContactNumber.Text = ds.Tables[0].Rows[0]["ContactNumber"].ToString();
                    lblGrade.Text = ds.Tables[0].Rows[0]["Grade"].ToString();
                    lblMarks.Text = ds.Tables[0].Rows[0]["Marks"].ToString();
                    lblAttendance.Text = ds.Tables[0].Rows[0]["Attendance"].ToString();

                    lblId1.Text = ds.Tables[0].Rows[1]["Id"].ToString();
                    lblName1.Text = ds.Tables[0].Rows[1]["Name"].ToString();
                    lblClass1.Text = ds.Tables[0].Rows[1]["Class"].ToString();
                    lblContactNumber1.Text = ds.Tables[0].Rows[1]["ContactNumber"].ToString();
                    lblGrade1.Text = ds.Tables[0].Rows[1]["Grade"].ToString();
                    lblMarks1.Text = ds.Tables[0].Rows[1]["Marks"].ToString();
                    lblAttendance1.Text = ds.Tables[0].Rows[1]["Attendance"].ToString();

                }

                ds.Dispose();

            }
            DisplayStudentDetails();
        }

        protected void InsertAttendane(int Id, char Attendace_Hour1, char Attendace_Hour2, char Attendace_Hour3, char Attendace_Hour4)
        {


            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {

                    con.Open();
                    string query = "INSERT INTO Studant_Attendance (StudentID,Date,Attendance_Hour1,Attendance_Hour2,Attendance_Hour3,Attendance_Hour4) " +
                        "VALUES('" + Id + "','" + clndrAttendacne.SelectedDate.ToShortDateString() + "','" + Attendace_Hour1 + "','" + Attendace_Hour2 + "','" + Attendace_Hour3 + "','" + Attendace_Hour4 + "')";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();

                }
                DisplayStudentDetails();
                ClearCheckBoxes();
            }
            catch (Exception ex)
            { }
            finally
            { }
        }
        void ClearCheckBoxes()
        {
            chkHour_1.Checked = false;
            chkHour_2.Checked = false;
            chkHour_3.Checked = false;
            chkHour_4.Checked = false;

            chkHour1_1.Checked = false;
            chkHour1_2.Checked = false;
            chkHour1_3.Checked = false;
            chkHour1_4.Checked = false;


        }
       public void DisplayStudentDetails()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "Select Id, Name, Class, Grade, Marks, Attendance, ContactNumber,Date,Attendance_Hour1,Attendance_Hour2,Attendance_Hour3,Attendance_Hour4 "+
                    "FROM Student_Details SD JOIN Studant_Attendance SA ON SD.Id = SA.StudentId";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grdStudentsDetails.DataSource = ds;
                    grdStudentsDetails.DataBind();
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertAttendane(Convert.ToInt32(lblId.Text), chkHour_1.Checked ? 'P' : 'A', chkHour_2.Checked ? 'P' : 'A', chkHour_3.Checked ? 'P' : 'A', chkHour_4.Checked ? 'P' : 'A');
        }

        protected void btnAttendance1_Click(object sender, EventArgs e)
        {
            InsertAttendane(Convert.ToInt32(lblId1.Text), chkHour1_1.Checked ? 'P' : 'A', chkHour1_2.Checked ? 'P' : 'A', chkHour1_3.Checked ? 'P' : 'A', chkHour1_4.Checked ? 'P' : 'A');
        }

        protected void clndrAttendacne_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = clndrAttendacne.SelectedDate.ToString();
            clndrAttendacne.Visible = false;
            if (clndrAttendacne.SelectedDate.DayOfWeek == DayOfWeek.Saturday || clndrAttendacne.SelectedDate.DayOfWeek == DayOfWeek.Sunday)
            {
                txtDate.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(),
                      "validateWeekDays();", true);
            }
        }
        protected void clndrAttendacne_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsWeekend)
            {
                e.Cell.Enabled = false; // Changes the Cells Enable Property
                e.Day.IsSelectable = false; // Disables the Cells Click Property
            }
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            clndrAttendacne.Visible = true;
        }

        protected void btnDate_Click(object sender, EventArgs e)
        {
            clndrAttendacne.Visible = true;
        }
    }
}