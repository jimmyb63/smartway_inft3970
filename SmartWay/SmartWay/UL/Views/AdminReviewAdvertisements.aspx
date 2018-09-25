<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReviewAdvertisements.aspx.cs" Inherits="SmartWay.UL.Views.AdminReviewAdvertisements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- just few comments for now -->
      <asp:GridView ID="SearchResult" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CellPadding="4" HorizontalAlign="Center"
        ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds" onrowcommand="SearchResult_RowCommand">
    <%-- set the content of each rows of the gridview (the list of data we need for each product) --%>
     <%-- Code for gridview sourced from - https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart --%>
        <Columns>
            <asp:BoundField DataField="advertisementID" HeaderText="AdID"/>
            <asp:BoundField DataField="advertisementSellerID" HeaderText="SellerID"/>
            <asp:BoundField DataField="advertisementType" HeaderText="Type"/>
            <asp:BoundField DataField="advertisementTitle" HeaderText="Title"/>
            <asp:BoundField DataField="advertisementAddressID" HeaderText="Address"/>
            <asp:BoundField DataField="advertisementDatePosted" HeaderText="Date added"/>
            <asp:BoundField DataField="advertisementCategoryID" HeaderText="Category"/>
            <asp:BoundField DataField="advertisementPrice" HeaderText="Price"/>
            <asp:ButtonField buttontype="Button" Text="View Item" commandname="AdvertisementDetail"/>
        </Columns>
    </asp:GridView>
</asp:Content>
