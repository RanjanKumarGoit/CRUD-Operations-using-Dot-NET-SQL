<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CrudOps_2.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div>  
           Full Name :<asp:TextBox ID="txtName" placeholder="Enter Full Name" runat="server"></asp:TextBox>  
  
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>  
  
           <br />  
           Email :<asp:TextBox ID="txtEmail" placeholder="Enter Email" runat="server"></asp:TextBox>  
  
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email cannot be blank" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>  
  
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
  
           <br />  
           Mobile :<asp:TextBox ID="txtMobile" placeholder="Enter Mobile" runat="server"></asp:TextBox>  
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile cannot be blank" ControlToValidate="txtMobile" ForeColor="Red"></asp:RequiredFieldValidator>  
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>  
           <br />  
           Password :<asp:TextBox ID="txtPassword" placeholder="Enter Password" runat="server"></asp:TextBox>  
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password cannot be blank" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>  
           <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password and confiem password must be same" ForeColor="Red"></asp:CompareValidator>  
           <br />  
           Confirm Password :<asp:TextBox ID="txtConfirmPassword" placeholder="Confirm Password" runat="server"></asp:TextBox>  
           <br />  
           Age :<asp:TextBox ID="txtAge" placeholder="Enter Age" runat="server"></asp:TextBox>  
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Age cannot be blank" ControlToValidate="txtAge" ForeColor="Red"></asp:RequiredFieldValidator>  
           <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must be between 18 to 40" ControlToValidate="txtAge" ForeColor="Red" MaximumValue="40" MinimumValue="18"></asp:RangeValidator>  
           <br />  
  
           <asp:Button ID="btnSubmit" runat="server" Text="Submit"  
               OnClick="btnSubmit_Click" />  
       </div>  
    </form>
</body>
</html>
