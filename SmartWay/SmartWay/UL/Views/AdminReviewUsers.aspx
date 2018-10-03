<%@ Page Title="SmartWay - Admin Review Users" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReviewUsers.aspx.cs" Inherits="SmartWay.UL.Views.AdminReviewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 mt-2">
        <div class="p-2 mb-2 bg-info text-white">Review All Users</div>
		<!--Featured Carousel -->

    
    <!-- just few comments for now -->
        <div class="table-responsive">
            <asp:GridView ID="SearchResult" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CssClass="table table-bordered" CellPadding="4" HorizontalAlign="Center"
            ItemType="SmartWay.BL.Models.Person" SelectMethod="GetUsers" onrowcommand="SearchResult_RowCommand">
        <%-- set the content of each rows of the gridview (the list of data we need for each product) --%>
         <%-- Code for gridview sourced from - https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart --%>
                <Columns>
                    <asp:BoundField DataField="userID" HeaderText="ID"/>
                    <asp:BoundField DataField="userEmail" HeaderText="Email"/>
                    <asp:BoundField DataField="userName" HeaderText="Username"/>
                    <asp:ButtonField buttontype="Button" ControlStyle-CssClass="btn btn-block btn-info" Text="View Details" commandname="UserDetail"/>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
