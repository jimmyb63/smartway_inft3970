<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AccountVerification.aspx.cs" Inherits="SmartWay.UL.Views.AccountVerification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Account Verfifcation</h2>
    <p>An 8 digit verficiation code has been emailed to you</p>
    <p>Please enter code to verify account</p>
    <asp:TextBox ID="txtVerficiationCode" placeholder="Enter Code" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtVerficiationCode" runat="server" />
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
    <asp:Button Text="Submit" runat="server" OnClick="VerifyUser" />
</asp:Content>
