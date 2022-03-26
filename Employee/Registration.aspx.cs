using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        GlobalClass globalClass = new GlobalClass();
        
        //function to clear text
        private void ClearData()
        {
            txtAge.Text = "";
            txtConfirmPassword.Text = "";
            dropDownDept.Text = "Select Department";
            txtEmail.Text = "";
            txtEmpName.Text = "";
            txtMobile.Text = "";
            txtPanCard.Text = "";
            txtUsername.Text = ""; //no need to clear psswd its automatically clear - due to - TextMode="password"
        }

        //function to register user
        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            try
            {
                if (globalClass.CheckPresentUserToRegister(txtUsername.Text.Trim())) //Check for already present user- will true if not present
                {
                    if (globalClass.InsertEmpData(txtUsername.Text.Trim(), txtPassword.Text.Trim(), txtEmpName.Text.Trim(), txtEmail.Text.Trim(), txtMobile.Text.Trim(), txtPanCard.Text.Trim(), int.Parse(txtAge.Text.Trim()), dropDownDept.SelectedItem.Text.Trim()))
                    {
                        lblDisp.Text = "Employee registered";
                        ClearData();
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        lblDisp.Text = "Please provide your pancard number";
                        ClearData();
                    }
                }
                else
                {
                    lblDisp.Text = "Username already present";
                    ClearData();
                }
            }
            catch (Exception ex)
            {
                lblDisp.Text = ex.Message;
                ClearData();
            }
              
        }

        //function to go to the login page
        protected void btnGoToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        
        //function to reseting information
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearData();
        }
    }
}