﻿<%@ Page Title="SmartWay - Admin View Advertisement" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminViewAdvertisementDetail.aspx.cs" Inherits="SmartWay.UL.Views.AdminViewAdvertisementDetail" %>
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
    <div class="col-lg-9 mt-2">
        <asp:HiddenField ID="adID" runat="server" />
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
                <td />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <div class="p-2 mb-2 bg-primary text-white"><%#:Item.advertisementTitle%></div>
                <div class="card">
                    <div id="adImages" class="carousel slide" data-ride="carousel" style="height: auto; background-color: grey">
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
                        <div class="carousel-inner" role="listbox" style="text-align: center">
                            <div class="carousel-item active" style="align-content: center">
                                <a href="<%=adImages[0]%>">
                                    <img src="<%=adImages[0]%>" height="800" alt="image"></a>
                            </div>
                            <% for (int i = 1; i < adImages.Count; i++)%>
                            <% { %>
                            <div class="carousel-item" style="align-content: center">
                                <a href="<%=adImages[i]%>">
                                    <img src="<%=adImages[i]%>" alt="image"></a>
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
                        <h4><b>Price: </b><%#:String.Format("{0:c}", Item.advertisementPrice)%></h4>
                        <p class="card-text">
                            <h4>Description</h4>
                            <p><%#:Item.advertisementDescription %></p>
                            <hr>
                            <asp:Button ID="btnContact" Text="Contact Seller" CssClass="btn btn-info" runat="server" /><asp:Button ID="btnDeactivate" Text="Deactivate Listing" CssClass="btn btn-danger float-md-right" OnClick="DeactivateAd" runat="server" />
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
