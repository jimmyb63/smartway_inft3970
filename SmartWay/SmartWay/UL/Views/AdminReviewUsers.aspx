<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReviewUsers.aspx.cs" Inherits="SmartWay.UL.Views.AdminReviewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- just few comments for now -->
      <asp:GridView ID="SearchResult" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CellPadding="4" HorizontalAlign="Center"
        ItemType="SmartWay.BL.Models.User" SelectMethod="GetUsers" onrowcommand="SearchResult_RowCommand">
    <%-- set the content of each rows of the gridview (the list of data we need for each product) --%>
     <%-- Code for gridview sourced from - https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart --%>
        <Columns>
            <asp:BoundField DataField="userID" HeaderText="User ID"/>
            <asp:BoundField DataField="userFirstName" HeaderText="First Name"/>
            <asp:BoundField DataField="userLastName" HeaderText="Last Name"/>
            <asp:BoundField DataField="userEmail" HeaderText="Email"/>
            <asp:BoundField DataField="userDOB" HeaderText="DOB"/>
            <asp:BoundField DataField="userPhoneID" HeaderText="Phone ID"/>
            <asp:BoundField DataField="userAddressID" HeaderText="Address ID"/>
            <asp:BoundField DataField="userPaypalID" HeaderText="Paypal ID"/>
            <asp:BoundField DataField="userUsername" HeaderText="Username"/>
            <asp:BoundField DataField="userPassword" HeaderText="Password"/>
            <asp:BoundField DataField="userVerDate" HeaderText="Verification Date"/>
            <asp:BoundField DataField="userCreateDate" HeaderText="Creation Date"/>
            <asp:BoundField DataField="userActive" HeaderText="Active"/>
            <asp:ButtonField buttontype="Button" Text="View Item" commandname="UserDetail"/>
        </Columns>
    </asp:GridView>
</asp:Content>
