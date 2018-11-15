<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminViewForumPostDetail.aspx.cs" Inherits="SmartWay.UL.Views.AdminViewForumPostDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 80%;
            height: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="forumID" runat="server" />
    <div class="col-lg-9 mt-2">
        <asp:ListView ID="displayForumPost" runat="server"
            DataKeyNames="forumID" GroupItemCount="3"
            ItemType="SmartWay.BL.Models.ForumThread" SelectMethod="GetForumPost">
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <div class="p-2 mb-2 bg-primary text-white"><%#:Item.forumTitle%></div>
                <div class="card">
                    <div id="adImages" class="carousel slide" data-ride="carousel" style="height: auto; background-color: grey">
                        <!-- Indicators -->
                        <% int forumID = Convert.ToInt32(Request.QueryString["forumID"]); %>
                        <% List<string> forumImages = getForumImages(forumID); %>
                        <ul class="carousel-indicators">
                            <li data-target="#forumImages" data-slide-to="0" class="active"></li>
                            <% for (int i = 1; i < forumImages.Count; i++) %>
                            <% { %>
                            <li data-target="#forumImages" data-slide-to="<%=i%>"></li>
                            <% } %>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner" role="listbox" style="text-align: center">
                            <div class="carousel-item active" style="align-content: center">
                                <a href="<%=forumImages[0]%>">
                                    <img src="<%=forumImages[0]%>" height="800" alt="image"></a>
                            </div>
                            <% for (int i = 1; i < forumImages.Count; i++)%>
                            <% { %>
                            <div class="carousel-item" style="align-content: center">
                                <a href="<%=forumImages[i]%>">
                                    <img src="<%=forumImages[i]%>" alt="image"></a>
                            </div>
                            <% } %>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#forumImages" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#forumImages" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            <h4>Description</h4>
                            <p><%#:Item.forumDescription %></p>
                            <hr>
                            <asp:Button ID="btnContact" Text="Contact User" CssClass="btn btn-info" runat="server" /><asp:Button ID="btnDeactivate" Text="Deactivate Thread" CssClass="btn btn-danger float-md-right" runat="server" />
                            <br>
                    </div>
                </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table style="width: 100%;">
                    <tbody>
                        <tr>
                            <td>
                                <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                    <tr id="groupPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr></tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </div>
</asp:Content>
