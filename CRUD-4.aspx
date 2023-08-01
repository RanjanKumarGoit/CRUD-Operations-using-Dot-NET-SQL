<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD-4.aspx.cs" Inherits="CrudOps_2.CRUD_4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <%--    Add a bootstrap for the styling of the UI page--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <title></title>
<%--    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 83.33333333%;
            left: 4px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>--%>
</head>
<body>
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="col-md-8 col-md-offset-2">
            <%--First name section begins here--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>First Name</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtfname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="a" ID="FirstName" runat="server" ErrorMessage="Firstname can't be empty!" ControlToValidate="txtfname" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--Last name section begins here--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>Last Name</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtlname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="a" ID="ValidateLastName" runat="server" ErrorMessage="Lastname can't be empty!" ControlToValidate="txtlname" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--Age section begins here--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>Age</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtage" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <%--Salary section begins here.--%>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>Salary</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="xtxtsalary" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <%--            Button section begins here--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2 col-md-offset-1">
                        <asp:Button runat="server" ValidationGroup="a" ID="btnsubmit" CssClass="btn btn-block btn-success" Text="Submit" ForeColor="White" OnClick="btnsubmit_Click" />
                        <%--this is Submit button--%>
                    </div>
                    <div class="col-md-2">
                        <asp:Button runat="server" ID="btnclear" CssClass="btn btn-block btn-clear" Text="Clear" OnClick="btnclear_Click" BackColor="Red" ForeColor="White" />
                        <%--this is Clear button--%>
                    </div>

                </div>
            </div>
            <div class="row">
                <hr />
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label Text="Search" CssClass="control-label col-md-4" runat="server" />
                        <div class="col-md-8">
                            <asp:TextBox ID="searchFirstName" CssClass="form-control" runat="server" placeholder="Enter First Name"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-success" Text="Search" OnClick="btnSearch_Click" />
                    <%--  this is Search Button--%>
                </div>
                <div class="col-md-2">
                    <asp:Button runat="server" ID="btnClear1" CssClass="btn btn-block btn-clear" Text="Clear" OnClick="btnClear1_Click" BackColor="Red" ForeColor="White" Width="70px"/>
                    <%--this is Clear button--%>
                </div>

            </div>
            <hr />
            <asp:Label runat="server" ID="lblmsg"></asp:Label>
            <div>
                <asp:GridView ID="empGrid" runat="server" CssClass="table"
                    OnRowDeleting="empgrid_RowDeleting"
                    OnRowEditing="empGrid_RowEditing"
                    OnRowCancelingEdit="empGrid_RowCancelingEdit"
                    OnRowUpdating="empGrid_RowUpdating"
                    DataKeyNames="EmpID"
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <%-- AutoGenerateColumns = false disable the automatic generated columns--%>
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <%-- Add columns according to your need.--%>
                        <asp:BoundField HeaderText="Employee ID" DataField="EmpID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFname1" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLname1" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAge1" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSalary1" runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" HeaderText="Remove Data" OnClientClick="return confirm('Are you sure to delete?');" />--%>


                        <asp:TemplateField HeaderText="Remove Data">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Delete" OnClientClick="return confirm('Are you sure to delete?');" />
                                <%--<asp:LinkButton runat="server" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" HeaderText="Update Data">

                            <ControlStyle CssClass="btn btn-primary"></ControlStyle>
                        </asp:CommandField>

                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
