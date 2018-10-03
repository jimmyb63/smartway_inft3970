<%@ Page Title="SmartWay - Admin Review Advertisements" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReviewAdvertisements.aspx.cs" Inherits="SmartWay.UL.Views.AdminReviewAdvertisements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 mt-2">
        <div class="p-2 mb-2 bg-info text-white">Review All Advertisements</div>
            <div class="table-responsive">
            <!-- just few comments for now -->
                  <asp:GridView ID="SearchResult" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CssClass="table table-bordered" CellPadding="4" HorizontalAlign="Center"
                    ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds" onrowcommand="SearchResult_RowCommand">
                <%-- set the content of each rows of the gridview (the list of data we need for each product) --%>
                 <%-- Code for gridview sourced from - https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart --%>
                    <Columns>
                        <asp:BoundField DataField="advertisementID" HeaderText="ID"/>
                        <asp:BoundField DataField="advertisementSellerID" HeaderText="Seller ID"/>
                        <asp:BoundField DataField="advertisementTitle" HeaderText="Title"/>
                        <asp:BoundField DataField="advertisementDatePosted" HeaderText="Date added"/>
                        <asp:BoundField DataField="advertisementActive" HeaderText="Status"/>
                        <asp:ButtonField buttontype="Button" Text="View Item" ControlStyle-CssClass="btn btn-block btn-info" commandname="AdvertisementDetail"/>
                    </Columns>
                </asp:GridView>
            </div>
    </div>
</asp:Content>
