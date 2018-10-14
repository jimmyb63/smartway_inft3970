<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewForumPost.aspx.cs" Inherits="SmartWay.UL.Views.ViewForumPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Page Content -->
    <div class="col-lg-9 mt-2">

        <asp:HiddenField ID="forumId" runat="server" />
        <asp:HiddenField ID="txtViewCount" runat="server" />
        <asp:ListView ID="displayAd" runat="server"
            DataKeyNames="forumID" GroupItemCount="3"
            ItemType="SmartWay.BL.Models.ForumThread" SelectMethod="getForumPost">
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
                    <div id="adImages" class="carousel slide container-fluid h-25" data-ride="carousel" style="background-color: grey">
                        <!-- Indicators -->
                        <% int forumID = Convert.ToInt32(Request.QueryString["forumID"]); %>
                        <% List<string> forumImages = getForumImages(forumID); %>
                        <ul class="carousel-indicators">
                            <li data-target="#adImages" data-slide-to="0" class="active"></li>
                            <% for (int i = 1; i < forumImages.Count; i++) %>
                            <% { %>
                            <li data-target="#adImages" data-slide-to="<%=i%>"></li>
                            <% } %>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner" role="listbox" style="text-align: center">
                            <div class="carousel-item thumbnail active" style="align-content: center">
                                <a href="<%=forumImages[0]%>">
                                    <img class="img-fluid" src="<%=forumImages[0]%>" alt="image"></a>
                            </div>
                            <% for (int i = 1; i < forumImages.Count; i++)%>
                            <% { %>
                            <div class="carousel-item thumbnail" style="align-content: center">
                                <a href="<%=forumImages[i]%>">
                                    <img class="img-fluid" src="<%=forumImages[i]%>" alt="image"></a>
                            </div>
                            <% } %>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#adImages" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#adImages" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <ul class="list-unstyled list-inline">
                                            <li class="list-inline-item pr-2 black-text">Views<i class="fas fa-eye m-2"></i> <%=txtViewCount.Value %></li>
                                        </ul> <h4>Forum Description</h4>
                                        <p><%#:Item.forumDescription %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4>
                                    <img class="avatar" src="<%#:getSellerAvatar(Item.forumUserID) %>" />
                                    <%#:getSellerUsername(Item.forumUserID) %></h4>
                                <ul class="list-unstyled list-inline">
                                    <li class="list-inline-item pr-2 black-text">
                                        <p>Joined: <%#:getSellerRegoDate(Item.forumUserID)%></p>
                                    </li>
                                    <li class="list-inline-item pr-2 black-text">
                                        <p>Rating: 5 <i class="fas fa-star"></i></p>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnContact" Text="Contact" OnClick="ContactSeller" CssClass="btn btn-info btn-block mt-2" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <hr />
                        
                        <div class="row">
                            <div class="col-lg-4 col-md-12 my-1">
                                <%--<asp:Button ID="btnContact" Text="Contact Seller" OnClick="ContactSeller" CssClass="btn btn-info btn-block" runat="server" />--%>
                            </div>
                            <div class="col-lg-4 col-md-0"></div>
                            <div class="col-lg-4 col-md-12 my-1">
                                <asp:Button ID="btnReplytoPost" Text="Reply to Post" CssClass="btn btn-danger btn-block" OnClick="ReportAd" runat="server" />
                            </div>
                        </div>
                        <br />
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
