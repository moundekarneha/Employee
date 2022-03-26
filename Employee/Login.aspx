<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Employee.Login" %>

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
    <h1>Login Here</h1>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
        <div>
            <table name="Login">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" class="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Must" ForeColor="Red" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password" TextMode="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" class="textbox" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Must" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="button" OnClick="btnLogin_Click" />
                        <asp:Button ID="btnGoToRegistration" runat="server" class="button" Text="Registration" style="height: 26px" CausesValidation="false" OnClick="btnGoToRegistration_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="btnReset" runat="server" class="button" Text="Reset" OnClick="btnReset_Click" />
                        <asp:Button ID="btnUpdatePasswd" runat="server" class="button" Text="Change Password" OnClick="btnUpdatePasswd_Click" CausesValidation="false"/>
                    </td>
                </tr>
            </table>
             <asp:Label ID="lblDisp" runat="server" Text=""></asp:Label>      
        </div>
    </form>

    </center>

</body>
</html>
