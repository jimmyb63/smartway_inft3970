﻿<%@ Page Title="SmartWay - Forum Post List" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewForumPostList.aspx.cs" Inherits="SmartWay.UL.Views.ViewForumPostList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <% string value = ""; %>
        <% if (Request.QueryString["search"] != null)
            { %>
        <% value = Request.QueryString["search"];
            }%>
        <div class="row p-2 bg-primary text-white align-content-center align-items-center align">
                <div class="col-lg-4 d-none d-lg-block">
                    <h6 class="mt-2">Forum Posts</h6>
                </div>
                <div class="col-lg-4"></div>
                <div class="col-lg-4"></div>
            </div>
        <div class="row">
            <%--<asp:HiddenField ID="ID" runat="server" />--%>
            <asp:ListView ID="forumList" runat="server"
                DataKeyNames="forumID" GroupItemCount="4"
                ItemType="SmartWay.BL.Models.ForumThread" OnPagePropertiesChanging="onPageChange">
                <EmptyDataTemplate>
                    <div class="col-12 my-2" runat="server">
                        <% if (Request.QueryString["search"] != null) %>
                        <% { %>
                        <div class="card h-100">
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text">
                                        <h1 class="text-center"><i class="far fa-frown"></i> Not Found...</h1>
                                        <h4 class="text-center">No results were found for "<%=Request.QueryString["search"] %>"</h4>
                                    </p>
                                </div>
                                <div class="col-1 my-2"></div>
                            </div>
                        </div>
                        <% } %>
                        <% else %>
                        <% { %>
                        <div class="card h-100">
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text">
                                        <h1 class="text-center"><i class="fas fa-exclamation-triangle"></i> Empty!</h1>
                                        <h4 class="text-center">Be the first to list an item in this section!</h4>
                                    </p>
                                </div>
                                <div class="col-1 my-2"></div>
                            </div>
                            <div class="row">
                                <div class="col-3 my-2"></div>
                                <div class="col-6 my-2">
                                    <div class="list-group my-2">
                                        <a href="PostAdvertisement.aspx" class="btn btn-success">Post New Ad</a>
                                    </div>
                                </div>
                                <div class="col-3 my-2"></div>
                            </div>
                        </div>
                        <% } %>
                    </div>
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
                    <div class="col-lg-12">
                        <div class="card mt-2 grey lighten-5 zoom hoverable z-depth-3">
                            <div class="row">
                                <!-- Card image -->
                                <div class="col-lg-5 col-md-12">
                                    <div class="view overlay zoom" style="background-color: #263238">
                                        <div class="thumbnail">
                                            <a href="ViewForumPost.aspx?forumID=<%#:Item.forumID%>">
                                                <img class="img-responsive" src="<%#:getForumThumbnail(Item.forumID)%>" alt="" /></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card content -->
                                <div class="col-lg-7 col-md-12">
                                    <div class="card-body">
                                        <!-- Title -->
                                        <h5 class="card-title"><a href="ViewForumPost.aspx?forumID=<%#:Item.forumID%>"><%#:Item.forumTitle%></a></h5>
                                        <p>
                                            <div class="card-text align-items-center d-none d-lg-block"><%#: Item.forumDescription %></div>
                                        </p>
                                        <ul class="list-unstyled list-inline font-small information-content">
                                            <li class="list-inline-item pr-2 black-text"><i class="far fa-calendar-alt mr-2"></i><%#:(Item.forumCreationDate).ToString("dd/MM/yyyy")%></li>
   
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <%--<table>
                        <tbody>
                            <tr>
                                <td>--%>
                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                        <tr id="groupPlaceholder"></tr>
                    </table>
                    <%--</td>
                            </tr>
                        </tbody>
                    </table>--%>
                </LayoutTemplate>
            </asp:ListView>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:DataPager ID="DataPagerForum" runat="server" class="btn-group d-flex" PagedControlID="forumList" PageSize="5" >
                    <Fields>
                        <asp:NextPreviousPagerField PreviousPageText="Back" ShowPreviousPageButton="true"
                            ShowFirstPageButton="false" ShowNextPageButton="false" ShowLastPageButton="false"
                            ButtonCssClass="btn btn-blue w-100" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                        <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-blue w-100 disabled d-none d-lg-block"  RenderNonBreakingSpacesBetweenControls="false"
                            NumericButtonCssClass="btn btn-blue w-100 d-none d-lg-block" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-blue" />
                        <asp:NextPreviousPagerField NextPageText="Next" ShowNextPageButton="true"
                            ShowLastPageButton="false" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                            ButtonCssClass="btn btn-blue w-100" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false"/>
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>



</asp:Content>
