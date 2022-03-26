using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        GlobalClass globalClass = new GlobalClass();

        //function to check login
        protected void btnLogin_Click(object sender, EventArgs e)
            {
            try
            {
                if (globalClass.CheckEmployeeLogin(txtUsername.Text,txtPassword.Text))
                {
                    Session["uname"] = txtUsername.Text.Trim();
                    Session["password"] = txtPassword.Text.Trim();
                    Session.Timeout = 1; //in min
                    Session["Empid"] = globalClass.GetEmpId(txtUsername.Text.Trim()); //requires while updating emp information
                    if (txtUsername.Text!="admin" && txtPassword.Text!="admin")
                    Session["Dept"] = globalClass.GetDeptName(Session["Empid"].ToString());
                    Response.Redirect("EmployeeDisplay.aspx");
                }
                else
                {
                    lblDisp.Text = "Login Failed";
                }
            }
            catch (Exception ex)
            {
                lblDisp.Text = ex.Message;
                
            }
        }

        //function to go to the registration page
        protected void btnGoToRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        //function to clear the text box
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPassword.Text = "";
            txtUsername.Text = "";
        }

        //function to go to the change password page
        protected void btnUpdatePasswd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
    }
}