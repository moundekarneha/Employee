<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDisplay.aspx.cs" Inherits="Employee.EmployeeDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS\EmpProject.css" rel="stylesheet" type="text/css" />
</head>
<body><center>
    <h1>
        Employee Information System
    </h1>
    
        <h1>Employee Details</h1>
    <form id="form1" runat="server">
        <div>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblDisp" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                 <asp:DropDownList ID="dropDownShowEmp" runat="server">
                <asp:ListItem Value="">Please select</asp:ListItem>
                <asp:ListItem>Show my employee information</asp:ListItem>
                <asp:ListItem>Show the employees information comes in my department</asp:ListItem>
                </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnDropDown" runat="server" Text="Show" OnClick="btnDropDown_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    </td>
                </tr>
                <tr>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true">
                   </asp:GridView>
                </tr>
            </table>
            <table>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField  HeaderText="Department ID" DataField="DeptId"/>
                        <asp:BoundField HeaderText="Department Name" DataField="DeptName" />
                        <asp:BoundField HeaderText="Employee ID" DataField="EmpID" />
                        <asp:BoundField HeaderText="Employee Name" DataField="EmpName" />
                        <asp:BoundField HeaderText="Email ID" DataField="EmailID" />
                        <asp:BoundField HeaderText="Mobile" DataField="Mobile" />
                        <asp:BoundField HeaderText="Pan Card" DataField="PanCard" />
                        <asp:BoundField HeaderText="Age" DataField="Age" />
                    </Columns>
                </asp:GridView>
            </table>
        </div>
    </form>
    </center>
</body>
</html>
