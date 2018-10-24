<%@ Page Title="SmartWay - My Advertisements" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyAdvertisements.aspx.cs" Inherits="SmartWay.UL.Views.MyAdvertisements" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">My Advertisements</div>
        <div class="row">
            <div class="col-12 my-2" runat="server">
                <div class="card h-100">
                    <div class="card-header">
                        <h5>Active Ads</h5>
                    </div>
                    <asp:ListView ID="adListActive" runat="server"
                        DataKeyNames="advertisementID" GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetAds">
                        <EmptyDataTemplate>
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
                            <asp:PlaceHolder runat="server" visible='<%# Item.advertisementBuyerID == 0 %>'>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="view overlay" style="background-color: #263238">
                                            <div class="thumbnail">
                                                <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                                    <img class="img-responsive" src="<%#getAdImage(Item.advertisementID)%>" alt="" />
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="card-body align-items-center">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-6">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                <h5 class="card-title">
                                                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a>
                                                                </h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                <p class="card-text">
                                                                    <%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                                                </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3 d-none d-lg-block">
                                                    <div class="card-text align-items-center">Date Posted: <%#: Item.advertisementDatePosted.ToString("dd/MM/yyyy") %></div>
                                                </div>
                                                <div class="col-lg-2 col-md-6">
                                                        <div class="card-text align-items-center">
                                                            <p>Offers: <%#: getOfferCount(Item.advertisementID) %></p>
                                                        </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6">
                                                    <asp:PlaceHolder runat="server" visible='<%# getOfferCount(Item.advertisementID) > 0 %>'>
                                                        <%--<asp:LinkButton CssClass="btn btn-block blue darken-3" Text="Offers" PostBackUrl="AdvertisementOffers.aspx?advertisementID=<%#: Item.advertisementID %>" runat="server" />--%>
                                                        <a href="AdvertisementOffers.aspx?advertisementID=<%#: Item.advertisementID %>">
                                                            <button type="button" class="btn btn-sm btn-block blue darken-3 mb-2">Offers</button>
                                                        </a>
                                                    </asp:PlaceHolder>
                                                    <asp:PlaceHolder runat="server" visible='<%# getOfferCount(Item.advertisementID) == 0 %>'>
                                                        <asp:Button CssClass="btn btn-sm btn-block blue darken-3 mb-2" Text="Offers" Enabled="false" runat="server" />
                                                    </asp:PlaceHolder>
                                                    <a href="CancelAdvertisement.aspx?advertisementID=<%#: Item.advertisementID %>">
                                                        <button type="button" class="btn btn-sm btn-block btn-danger">Cancel Ad</button>
                                                    </a>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </asp:PlaceHolder>
                            <hr />
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
        </div>
        <div class="row">
            <div class="col-12 my-2" runat="server">
                <div class="card h-100">
                    <div class="card-header">
                        <h5>Sold Ads</h5>
                    </div>
                    <asp:ListView ID="adListSold" runat="server"
                        DataKeyNames="advertisementID" GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.Advertisement" SelectMethod="GetSoldAds">
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text"><h4 class="text-center">No Ads sold yet!</h4></p>
                                </div>
                                <div class="col-1 my-2"></div>
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
                            <asp:PlaceHolder runat="server" visible='<%# Item.advertisementBuyerID != 0 %>'>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="view overlay" style="background-color: #263238">
                                            <div class="thumbnail">
                                                <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>">
                                                    <img class="img-responsive" src="<%#getAdImage(Item.advertisementID)%>" />
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="card-body align-items-center">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-12">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                <h5 class="card-title">
                                                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.advertisementID%>"><%#:Item.advertisementTitle%></a>
                                                                </h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                <p class="card-text text-danger">
                                                                    Sold Price: <%#:String.Format("{0:c}", Item.advertisementPrice)%>
                                                                </p>
                                                           </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-12">
                                                    <div class="card-text align-items-center">Date Sold: <%#: Item.advertisementDateComplete %></div>
                                                </div>
                                                <div class="col-lg-4 col-md-12">
                                                    <div class="card-text align-items-center">Buyer: <%#: getBuyerUsername(Item.advertisementBuyerID) %></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            <hr />
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
        </div>
    </div>
</asp:Content>
