<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeUpdate.aspx.cs" Inherits="Employee.EmployeeUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employees Information System</title>
    <link href="CSS\EmpProject.css" rel="stylesheet" type="text/css" />
</head>
<body><center>
    <h1>
        Employee Information System
    </h1>
    
    <h1>Register Here</h1>
    <form id="form1" runat="server">
        <div>
                <table>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmpName" class="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Email ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" class="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Mobile"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobile" class="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile Number" ForeColor="Red" ControlToValidate="txtMobile" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Pan Card"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPanCard" class="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Age"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAge" class="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Department Id"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dropDownDept1" runat="server">
                            <asp:ListItem>Select Department</asp:ListItem>
                            <asp:ListItem>Sales</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                            <asp:ListItem>HR</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnUpdate" class="button" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnGoToLogin" class="button" runat="server" Text="Back" style="height: 26px" CausesValidation="false" OnClick="btnGoToLogin_Click"/>
                        <asp:Button ID="btnReset" class="button" runat="server" Text="Reset" OnClick="btnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            <asp:Label ID="lblDisp" runat="server" Text=""></asp:Label>
        </p>
    </form>
   </center>
</body>
</html>
