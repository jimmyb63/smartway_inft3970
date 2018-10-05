<%@ Page Title="SmartWay - My Advertisements" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyAdvertisements.aspx.cs" Inherits="SmartWay.UL.Views.MyAdvertisements" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">My Advertisements</div>
        <div class="row">
            <asp:ListView ID="adList" runat="server"
                DataKeyNames="advertisementID" GroupItemCount="4"
                ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds">
                <EmptyDataTemplate>
                    <div class="col-12 my-2" runat="server">
                        <div class="card h-100">
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text"><h4 class="text-center">Post your first Advertisement!</h4></p>
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
                    <div class="col-12 my-2" runat="server">
                        <div class="card h-100">
                            <div class="row">
                                <div class="col-3">
                                    <%--<a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">--%>
                                        <img class="card-img" src="<%#getAdThumbnail(Item.advertisementID)%>"
                                            style="border: solid; width: 100%" />
                                    <%--</a>--%>
                                </div>
                                <div class="col-9">
                                    <div class="card-body  align-items-center">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="row">
                                                            <h5 class="card-title">
                                                                <%--<a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a--%>
                                                                <%#:Item.advertisementTitle%>
                                                            </h5>
                                                        </div>
                                                        <div class="row">
                                                            <p class="card-text">
                                                                <%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-3 d-none d-lg-block">
                                                <div class="card-text align-items-center">Date Posted: <%#: Item.advertisementDatePosted %></div>
                                            </div>
                                            <div class="col-lg-3 col-md-6">
                                                <div class="card-text align-items-center">Offers: <a href="AdvertisementOffers.aspx?advertisementID=<%#: Item.advertisementID %>"><%#: getOfferCount(Item.advertisementID) %></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer"><small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> </div>
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
    </div>
</asp:Content>
