<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUD-1.aspx.cs" Inherits="CrudOps_2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <div style="font-size:x-large" align="center">Student Info Management Form</div>
        <table class="nav-justified">
            
            <tr>
                <td style="width: 307px; height: 20px"></td>
                <td style="width: 185px; height: 20px">Student Name</td>
                <td style="height: 20px">
                    <asp:TextBox ID="StudentName" runat="server" Font-Size="Medium"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="ValidateName" runat="server" ErrorMessage="Student Name can't be blank." ControlToValidate="StudentName" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 307px">&nbsp;</td>
                <td style="width: 185px">Email</td>
                <td style="height:20px">
                    <asp:textbox id="Email" runat="server" font-size="medium" validaterequestmode="enabled"></asp:textbox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--                    <asp:RequiredFieldValidator ID="ValidateAge" runat="server" ErrorMessage="Age can't be blank!" ControlToValidate="Age" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="ValidateValidEmail" runat="server" ErrorMessage="Please enter a valid gmail" ControlToValidate="Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 307px">&nbsp;</td>
                <td style="width: 185px">Address</td>
                <td style="height:20px">
                    <asp:TextBox ID="Address" runat="server" Font-Size="Medium"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--<asp:RequiredFieldValidator ID="ValidateContact" runat="server" ErrorMessage="Contact can't be blank!" ControlToValidate="Contact" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td style="width: 307px">&nbsp;</td>
                <td style="width: 185px">Age</td>
                <td style="height:20px">
                    <asp:TextBox ID="Age" runat="server" Font-Size="Medium"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--                    <asp:RequiredFieldValidator ID="ValidateAge" runat="server" ErrorMessage="Age can't be blank!" ControlToValidate="Age" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td style="width: 307px">&nbsp;</td>
                <td style="width: 185px">Contact</td>
                <td style="height:20px">
                    <asp:TextBox ID="Contact" runat="server" Font-Size="Medium"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--<asp:RequiredFieldValidator ID="ValidateContact" runat="server" ErrorMessage="Contact can't be blank!" ControlToValidate="Contact" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="ValidateValidContact" runat="server" ErrorMessage="Enter a valid contact number!" ControlToValidate="Contact" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 307px; height: 129px;"></td>
                <td style="width: 185px; height: 129px;"></td>
                <td style="height: 129px">
                    <asp:Button ID="Insert" runat="server" BackColor="Lime" Font-Bold="True" Font-Size="Medium" OnClick="Insert_values" Text="Insert" Height="30px" style="margin-left: 0; margin-top: 15px" Width="80px" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Update" runat="server" BackColor="White" Font-Bold="True" Font-Size="Medium" OnClick="Update_Values" Text="Update" Height="30px" style="margin-left: 0px; margin-right: 0; margin-top: 0" Width="80px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Button ID="Delete" runat="server" BackColor="#CC0000" Font-Bold="True" Font-Size="Medium" OnClick="Delete_Values" Text="Delete" OnClientClick="return confirm('Are you sure to delete?');" ForeColor="White" Height="30px" style="margin-left: 0px; margin-right: 0; margin-top: 15px" Width="80px" />
                    <asp:Button ID="Search" runat="server" BackColor="#000099" Font-Bold="True" Font-Size="Medium" OnClick="Search_Values" Text="Search" ForeColor="White" Height="30px" style="margin-left: 13px; margin-right: 0; margin-top: 15px" Width="80px" />
                    <br />
                    <br />
                    <asp:Button ID="Clear" runat="server" BackColor="#FF0066" BorderColor="#666699" Font-Bold="True" OnClick="Clear_Labels" Text="Clear" ForeColor="White" Width="80px" Height="30px" />
                    <br />
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" style="margin-left: 250px" Width="700px">
        </asp:GridView>
        <br />

    </div>

</asp:Content>
