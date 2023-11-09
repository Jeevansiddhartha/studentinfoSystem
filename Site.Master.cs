using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_InformationSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null && Session["User"].ToString() != "")
            {
                lblUserName.Text = Session["User"].ToString();
                aLogOut.Visible = true;
            }
            if (Session["Role"] != null && Session["Role"].ToString() == "Faculty")
            {
                aFacultyLogin.Visible = true;
            }
            if (Session["User"] == null)
            {
                aLogOut.Visible = false;
                lblUserName.Text = "";
            }
        }

        protected void aLogOut_Click(object sender, EventArgs e)
        {
            aLogOut.Visible = false;
            lblUserName.Text = "";
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
            
        }
    }
}