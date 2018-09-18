<%@ Page Title="SmartWay - Login" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartWay.UL.Views.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <th>
                <h2>Login Form</h2>
            </th>
        </tr>
        <tr>
            <td>
                Email:
            </td>
            <td>
                <asp:TextBox 
                    ID="txtEmail" 
                    placeholder="Email Address" 
                    runat="server"/>
            </td>
            <td>
                <asp:RequiredFieldValidator
                    ErrorMessage="Required" 
                    Display="Dynamic" 
                    ForeColor="Red" 
                    ControlToValidate="txtEmail" 
                    runat="server" />
                <!--Regular expression to ensure that the email is valid, expression found courtesy of RegExlib.com-->
                <asp:RegularExpressionValidator 
                    runat="server" 
                    Display="Dynamic" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ControlToValidate="txtEmail" 
                    ForeColor="Red" 
                    ErrorMessage="Invalid email address." />
            </td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                <asp:TextBox 
                    ID="txtPassword" 
                    placeholder="Password" 
                    runat="server" 
                    TextMode="Password"/>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ErrorMessage="Required" 
                    ForeColor="Red" 
                    ControlToValidate="txtPassword" 
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="ForgotPassword.aspx">Forgot Password?</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button Text="Login" runat="server" OnClick="userLogin" />
            </td>
        </tr>
    </table>
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
</asp:Content>
