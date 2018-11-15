<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReviewForumPosts.aspx.cs" Inherits="SmartWay.UL.Views.AdminReviewForumPosts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 mt-2">
        <div class="p-2 mb-2 bg-info text-white">Review All Forum Posts</div>
            <div class="table-responsive">
            <!-- just few comments for now -->
                  <asp:GridView ID="SearchResult" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CssClass="table table-bordered" CellPadding="4" HorizontalAlign="Center"
                    ItemType="SmartWay.BL.Models.ForumThread" SelectMethod="GetForumPosts" onrowcommand="SearchResult_RowCommand">
                <%-- set the content of each rows of the gridview (the list of data we need for each product) --%>
                 <%-- Code for gridview sourced from - https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart --%>
                    <Columns>
                        <asp:BoundField DataField="forumUserID" HeaderText="ID"/>
                        <asp:BoundField DataField="forumTitle" HeaderText="Title"/>
                        <asp:BoundField DataField="forumCreationDate" HeaderText="Date Posted"/>
                        <asp:BoundField DataField="forumActive" HeaderText="Status"/>
                        <asp:ButtonField buttontype="Button" Text="View Item" ControlStyle-CssClass="btn btn-block btn-info" commandname="ForumPostDetail"/>
                    </Columns>
                </asp:GridView>
            </div>
    </div>
</asp:Content>
