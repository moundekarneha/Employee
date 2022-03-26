using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        GlobalClass globalClass = new GlobalClass();
        
        //function for updating password
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {
                if (globalClass.UpdatePassword(txtUsername.Text.Trim(), txtPassword.Text.Trim(), txtNewPassword.Text.Trim()))
                {
                    lblResult.Text = "Password updated successfully";
                    TextClear();
                }
                else
                {
                    lblResult.Text = "Password update failed";
                    TextClear();
                }
            }
            catch(Exception ex)
            {
                lblResult.Text = ex.Message;
                TextClear();
            }

        }

        //function to clear information
        private void TextClear()
        {
            txtUsername.Text = ""; //no need to clear passwd field it will automatically clear text 
        }

        //function to go to the login page
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}