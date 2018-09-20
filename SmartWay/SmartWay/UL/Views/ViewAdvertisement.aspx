<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.ViewAdvertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style>
      /* Make the image fully responsive */
      .carousel-inner img {
          width: 80%;
          text-align: center;
      }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<% string value = Request.QueryString["advertisementID"]; %>--%>
    <asp:HiddenField ID="adID" runat="server"/>
    <asp:ListView ID="displayAd" runat="server" 
                DataKeyNames="advertisementID" GroupItemCount="3"
                ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAd">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <div id="adImages" class="carousel slide" data-ride="carousel" style="height:30%; background-color: grey">
                          <!-- Indicators -->
                          <% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
                          <% List<string> adImages = getAdImages(adID); %>
                          <ul class="carousel-indicators">
                            <li data-target="#adImages" data-slide-to="0" class="active"></li>
                            <% for (int i = 1; i < adImages.Count; i++) %>
                              <% { %>
                            <li data-target="#adImages" data-slide-to="<%=i%>"></li>
                              <% } %>
                          </ul>
  
                          <!-- The slideshow -->
                          <div class="carousel-inner" role="listbox" style="text-align:center">
                            <div class="carousel-item active" style="align-content:center">
                              <img src="<%=adImages[0]%>" alt="image" height="400">
                            </div>
                            <% for (int i = 1; i < adImages.Count; i++)%>
                              <% { %>
                                <div class="carousel-item" style="align-content:center">
                                    <img src="<%=adImages[i]%>" alt="image" height="400">
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
                        <table>
                            <tr>
                                <td>
                                    <%--<% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
                                    <% List<string> adImages = getAdImages(adID); %>
                                    <% for (int i = 0; i < adImages.Count; i++)%>
                                    <% { %>
                                    <img src="<%=adImages[i]%>" style="border: solid" /></a>
                                    <% } %>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                        <span>
                                            <%#:Item.advertisementTitle%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                    </span>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
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
</asp:Content>
