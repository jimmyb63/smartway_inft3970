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
                                        </ul>
                                        <h4>Forum Description</h4>
                                        <p><%#:Item.forumDescription %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4>
                                    <img class="avatar" src="<%#:getPostersAvatar(Item.forumUserID) %>" />
                                    <%#:getPostersUsername(Item.forumUserID) %></h4>
                                <ul class="list-unstyled list-inline">
                                    <li class="list-inline-item pr-2 black-text">
                                        <p>Joined: <%#:getPostersRegoDate(Item.forumUserID)%></p>
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
                            <div class="col-lg-12">
                                <hr />
                                <!-- List View of Associated Tags -->
                                <asp:ListView
                                    ID="lvForumTags"
                                    runat="server"
                                    DataKeyNames="forumTagID"
                                    GroupItemCount="4"
                                    ItemType="SmartWay.BL.Models.ForumTag"
                                    SelectMethod="getForumTagsByForumID">
                                    <%-- Empty Data Template --%>
                                    <EmptyDataTemplate>
                                        <div class="card h-100">
                                            <div class="row">

                                                <div class="col-1 my-2"></div>
                                                <br />
                                                <hr />
                                                <br />
                                                <div class="col-10 my-2">
                                                    <br />
                                                    <p class="card-text">
                                                        <h1 class="text-center"><i class="fas fa-exclamation-triangle"></i>Empty!</h1>
                                                        <h4 class="text-center">No Forum Tags Selected.</h4>
                                                    </p>
                                                </div>
                                                <div class="col-1 my-2"></div>
                                            </div>
                                        </div>
                                    </EmptyDataTemplate>
                                    <%-- Empty Item Template --%>
                                    <EmptyItemTemplate>
                                        <td />
                                    </EmptyItemTemplate>
                                    <%-- Group Template --%>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>
                                    <%-- Item Template --%>
                                    <ItemTemplate>
                                        <!-- Forum Tag Badge -->
                                        <a href="#" class="badge badge-primary badge-pill mb-2 p-2"><%#: Item.forumTagName%></a>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <!--<div class="row">
                            <div class="col-lg-4 col-md-12 my-1">
                                <%--<asp:Button ID="btnContact" Text="Contact Seller" OnClick="ContactSeller" CssClass="btn btn-info btn-block" runat="server" />--%>
                            </div>
                            <div class="col-lg-4 col-md-0"></div>
                            <div class="col-lg-4 col-md-12 my-1">
                                <asp:Button ID="btnReplytoPost" Text="Reply to Post" CssClass="btn btn-danger btn-block" OnClick="ReportAd" runat="server" />
                            </div>
                        </div>
                        <br />-->
                </div>
            </ItemTemplate>
            <%--            <LayoutTemplate>
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
            </LayoutTemplate>--%>
        </asp:ListView>
        <br />
        <h5>Forum Comments:</h5>
        <div class="row">
            <asp:ListView
                ID="lvForumComments"
                runat="server"
                DataKeyNames="forumReplyID"
                GroupItemCount="4"
                ItemType="SmartWay.BL.Models.ForumReply"
                SelectMethod="getForumRepliedListbyID">
                <%-- Empty Data Template --%>
                <EmptyDataTemplate>
                    <div class="card h-100">
                        <div class="row">
                            <br />
                            <hr />
                            <br />
                            <div class="col-1 my-2"></div>
                            <div class="col-10 my-2">
                                <p class="card-text">
                                    <%-- TODO: Check when no messages are present if this place is default --%>
                                    <h1 class="text-center"><i class="fas fa-exclamation-triangle"></i>Empty!</h1>
                                    <h4 class="text-center">No messages to reply to.</h4>
                                </p>
                            </div>
                            <div class="col-1 my-2"></div>
                        </div>
                    </div>
                </EmptyDataTemplate>
                <%-- Empty Item Template --%>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <%-- Group Template --%>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <%-- Item Template --%>
                <ItemTemplate>
                    <div class="col-lg-12">
                        <div class="card mt-2 grey lighten-5">
                            <div class="row">
                                <div class="card-body">
                                    <!-- Repliers Img -->
                                    <div class="row">
                                        <div class="col-8">
                                            <img class="avatar" src="<%#:Item.forumReplyRepliersImgFilePath %>" />
                                            <%#:Item.forumReplyRepliersName %>
                                        </div>

                                        <div class="col-4 font-small information-content">
                                            <a><i class="far fa-calendar-alt mr-2"></i><%#:"Commented: "+(Item.forumReplyCreationDate).ToString("dd/MM/yyyy HH:mm")%></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <a><i class="fas fa-hand-holding-usd mr-2"></i><%#:": "+ Item.forumReplyComment%></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <% if (Session["currentUser"] != null)
            { %>
        <br />
        <!--Reply To Post Section   -->
        <div class="col-lg-12">
            <div class="card mt-2 grey lighten-5">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-body">
                            <!-- Reply To Post Text Section -->
                            <h4>Reply To Post:</h4>
                            <asp:TextBox
                                CssClass="form-control"
                                runat="server"
                                ID="txtReplyMessage"
                                TextMode="MultiLine"
                                Rows="5" />
                            <br />
                            <!-- Button Submit Section -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />       

        <div class="col-lg-12 col-md-12 my-1">
            <asp:Button ID="btnReplytoPost" Text="Reply to Post" CssClass="btn btn-danger btn-block" OnClick="PostReplyComment" runat="server" />
        </div>
        <% } %>
    </div>
</asp:Content>
