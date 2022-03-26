<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Employee.Registration" %>

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
                        <asp:Label ID="Label3" runat="server" Text="Confirm Password" TextMode="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" class="textbox" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmpName" class="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Name Must" ForeColor="Red" ControlToValidate="txtEmpName"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email ID Must" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Mobile Must" ForeColor="Red" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
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
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Pan Card Number Must" ForeColor="Red" ControlToValidate="txtPanCard"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Pan Card Number" ValidationExpression="[A-Z]{5}[0-9]{4}[A-Z]{1}" ForeColor="Red" ControlToValidate="txtPanCard"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Age"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAge" class="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Age Must" ForeColor="Red" ControlToValidate="txtAge"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid" ValidationExpression=" ^100|[1-9]?\d$" ForeColor="Red" ControlToValidate="txtAge"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Department Id"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dropDownDept" runat="server">
                            <asp:ListItem>Select Department</asp:ListItem>
                            <asp:ListItem>Sales</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                            <asp:ListItem>HR</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Dept Must" ForeColor="Red" ControlToValidate="dropDownDept"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnRegistration" class="button" runat="server" Text="Registration" OnClick="btnRegistration_Click" />
                        <asp:Button ID="btnGoToLogin" class="button" runat="server" Text="Login" OnClick="btnGoToLogin_Click" style="height: 26px" CausesValidation="false"/>
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
