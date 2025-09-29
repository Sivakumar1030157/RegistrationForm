<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="RegistrationForm.FormPages.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student registration Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="tblRegistration">
                <tr>
                    <td>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdnGender" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Value="1">M</asp:ListItem>
                            <asp:ListItem Value="2">F</asp:ListItem>
                            <asp:ListItem Value="3">T</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQualifiactions" runat="server" Text="Qualifiaction"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlQualifications" runat="server">
                            <asp:ListItem Value="">Select</asp:ListItem>
                            <asp:ListItem Value="1">BTECH</asp:ListItem>
                            <asp:ListItem Value="2">MTECH</asp:ListItem>
                            <asp:ListItem Value="3">MCA</asp:ListItem>
                            <asp:ListItem Value="4">MBA</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTechnology" runat="server" Text="Technology"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="chlTechnology" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Value="1">.Net</asp:ListItem>
                            <asp:ListItem Value="2">MVC</asp:ListItem>
                            <asp:ListItem Value="3">.Net Core</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GD" AutoGenerateColumns="false" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditRow" OnClick="gdEdit" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" OnClientClick="return confirm('Are you sure to delete this record?');" OnClick="gdDelete" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SNO" HeaderText="SNO" ReadOnly="true" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                <asp:BoundField DataField="Age" HeaderText="Age" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                                <asp:BoundField DataField="Technology" HeaderText="Technology" />
                            </Columns>
                        </asp:GridView>
                        <%-- OnRowCancelingEdit="Row_Cancel" OnRowUpdating="Row_Update" OnRowDeleting="Row_Delete"--%>
                    </td>
                </tr>
            </table>
        </div>
        <dev>
            <asp:HiddenField ID="hidSNO" runat="server" />
        </dev>
    </form>
</body>
</html>
