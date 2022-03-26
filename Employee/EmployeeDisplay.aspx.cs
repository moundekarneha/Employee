using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee
{
    public partial class EmployeeDisplay : System.Web.UI.Page
    {
        GlobalClass globalClass = new GlobalClass();
        DataSet dataSet = new DataSet();

        //function to send session while loading page
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["uname"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string username = Session["uname"].ToString();
                    string passwd = Session["password"].ToString();
                    if (username == "admin" && username == "admin")
                    {
                        dropDownShowEmp.Visible = false;
                        btnUpdate.Visible = false;
                        btnDropDown.Visible = false;
                        dataSet = globalClass.ShowAllEmpData();
                        GridView2.Visible = true;
                        GridView1.Visible = false;
                        GridView2.DataSource = dataSet.Tables["dt"];
                        GridView2.DataBind();
                        lblDisp.ForeColor = System.Drawing.Color.Black;
                        lblDisp.Text = "All employees details";
                    }
                }
            }
            catch (Exception ex)
            {
                lblDisp.Text = ex.Message;
            }
        }

        //function to go to the login page
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnDropDown_Click(object sender, EventArgs e)
        {
            
            string username = Session["uname"].ToString();
            string passwd = Session["password"].ToString();
            
                if (dropDownShowEmp.SelectedItem.Text == "Show my employee information")
                {
                    dataSet = globalClass.ShowEmpData(username, passwd);
                    GridView1.DataSource = dataSet.Tables["dt"];
                    GridView1.Visible = true;
                    GridView2.Visible = false;
                    GridView1.DataBind();
                    lblDisp.ForeColor = System.Drawing.Color.Black;
                    lblDisp.Text = "My employee details";
                }
                else if (dropDownShowEmp.SelectedItem.Text == "Show the employees information comes in my department")
                {
                    dataSet = globalClass.ShowEmpDataWithSameDept(Session["Dept"].ToString());
                    GridView2.Visible = true;
                    GridView1.Visible = false;
                    GridView2.DataSource = dataSet.Tables["dt"];
                    GridView2.DataBind();
                    lblDisp.ForeColor = System.Drawing.Color.Black;
                    lblDisp.Text = "Employees details that comes under my department";
                }
                else
                {
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    lblDisp.ForeColor = System.Drawing.Color.Red;
                    lblDisp.Text = "Please select item in dropdown list";
                }
        }

        //Update employee information
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeUpdate.aspx");
        }
    }
}