<%@ Page Title="SmartWay - Contact us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SmartWay.UL.Views.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--A form that emails the admin--%>
    <table>
            <tr>
                <th colspan="3">
                    <h2>Contact us</h2>
                    <p>Please fill out the below form to contact admin</p>
                </th>
            </tr>
            <!-- First name textbox with validators -->
            <tr>
                <td>
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" placeholder="First Name" runat="server"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFirstName"
                        runat="server" />
                </td>
            </tr>
            <!-- Last name textbox with validators -->
            <tr>
                <td>
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" placeholder="Last Name" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLastName"
                          runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="3"><hr /></td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <!-- Email address textbox with validators -->
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" placeholder="Email address" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                        ControlToValidate="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                </td>
            </tr>
            <tr>
                <td>
                    Message content:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine" Rows="10" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <!-- Submit button to send email to admin -->
                <td>
                    <asp:Button Text="Submit" runat="server" OnClick="contactAdmin" />
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
        <br />
</asp:Content>
