<%@ Page Title="SmartWay - Forgot password" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SmartWay.UL.Views.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
            <tr>
                <th colspan="3">
                    <h2>Forgot Password?</h2>
                </th>
            </tr>
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" placeholder="Email address" runat="server"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                </td>
            </tr>
            <tr>
            <td>
                <asp:Button Text="Submit" runat="server" OnClick="forgotPassword" />
            </td>
        </tr>
        </table>
        <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
</asp:Content>
