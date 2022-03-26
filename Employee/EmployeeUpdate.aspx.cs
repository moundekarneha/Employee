using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee
{
    public partial class EmployeeUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["uname"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {
                lblDisp.Text = ex.Message;
            }
        }

        GlobalClass globalClass = new GlobalClass();
        //update employee information
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                globalClass.UpdateEmpInfo(txtEmpName.Text.Trim(), txtEmail.Text.Trim(), txtMobile.Text.Trim(), txtPanCard.Text.Trim(), int.Parse(txtAge.Text.Trim()), dropDownDept1.SelectedItem.Text.Trim(),int.Parse(Session["Empid"].ToString()));
                lblDisp.Text = "Employee information updated";
                ClearInfo();
            }
            catch (Exception ex)
            {
                lblDisp.Text = ex.Message;
                ClearInfo();
            }
            
        }

        //clear all information
        private void ClearInfo()
        {
            txtAge.Text = "";
            txtEmail.Text = "";
            txtEmpName.Text = "";
            txtMobile.Text = "";
            txtPanCard.Text = "";
            dropDownDept1.SelectedValue = "Select Department";
        }
        //Go to login page
        protected void btnGoToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearInfo();
            lblDisp.Text = "Reseted";
        }
    }
}