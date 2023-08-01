<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repeater.aspx.cs" Inherits="CrudOps_2.Repeater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" GridLines="None" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Image ID="imgEmployee" ImageUrl='<%# Eval("PhotoPath") %>' runat="server" Height="150px" Width="150px" />
                                                </td>

                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <b>Employee ID:</b>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("Emp_ID") %>'>
                                                                </asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Name: </b>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Emp_Name") %>'>
                                                                </asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Address:</b>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'>
                                                                </asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <b>Contact:</b>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblContact" runat="server" Text='<%# Eval("Contact") %>'>
                                                                </asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </td>

                    <td class="auto-style1">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgEmployee" ImageUrl='<%# Eval("PhotoPath") %>' runat="server" Height="150px" Width="150px" />
                                        </td>

                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <b>Employee ID:</b>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("Emp_ID") %>'>
                                                        </asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Name: </b>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Emp_Name") %>'>
                                                        </asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Address:</b>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'>
                                                        </asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <b>Contact:</b>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblContact" runat="server" Text='<%# Eval("Contact") %>'>
                                                        </asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
