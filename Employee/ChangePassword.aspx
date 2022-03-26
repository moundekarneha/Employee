<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Employee.ChangePassword" %>

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
    <h1>Change Your Password Here</h1>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtUsername" runat="server" ErrorMessage="Username required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassword" txtNewPassword="txtPassword" runat="server" ErrorMessage="Password required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="New Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtNewPassword" runat="server" ErrorMessage="New password required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtConfirmPassword" runat="server" ErrorMessage="Confirm password required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnChangePassword" class="button" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                        <asp:Button ID="btnBack" runat="server" class="button" Text="Back" CausesValidation="false" OnClick="btnBack_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
    </center>
</body>
</html>
