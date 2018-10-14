<%@ Page Title="SmartWay - My Offers" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyOffers.aspx.cs" Inherits="SmartWay.UL.Views.MyOffers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">My Offers</div>
        <div class="row">
            <asp:ListView ID="adList" runat="server"
                DataKeyNames="offerID" GroupItemCount="5"
                ItemType="SmartWay.BL.Models.Offer" SelectMethod="getOffers">
                <EmptyDataTemplate>
                    <div class="col-12 my-2" runat="server">
                        <div class="card h-100">
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text"><h4 class="text-center">No offers yet!</h4></p>
                                </div>
                                <div class="col-1 my-2"></div>
                            </div>
                            <div class="row">
                                <div class="col-3 my-2"></div>
                                <div class="col-6 my-2">
                                    <div class="list-group my-2"> 
                                        <a href="Index.aspx" class="btn btn-success">View Advertisements</a>
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
                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>">
                                        <img class="card-img" src="<%#getAdThumbnail(Item.offerAdID, Item.offerSellerID)%>"
                                            style="border: solid; width: 100%" />
                                    </a>
                                </div>
                                <div class="col-9">
                                    <div class="card-body  align-items-center">
                                        <div class="row">
                                            <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted == 2 %>'>
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="row">
                                                                <h5 class="card-title">
                                                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>"><%#:getAdTitle(Item.offerAdID)%></a>
                                                                </h5>
                                                            </div>
                                                            <div class="row">
                                                                <p class="card-text">
                                                                    <%#:String.Format("{0:c}",getAdPrice(Item.offerAdID)) %>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4 d-none d-lg-block">
                                                    <div class="card-text align-items-center">
                                                        <p>Amount Offered: <%#:String.Format("{0:c}", Item.offerAmountOffered)%></p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="row">
                                                        <div class="card-text align-items-center">
                                                            <p>Status: <%#: getOfferStatus(Item.offerID) %></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <a href="OfferCancel.aspx?offerID=<%#:Item.offerID %>">
                                                            <button type="button" class="btn btn-danger btn-block">Cancel</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted == 1 %>'>
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="row">
                                                                <h5 class="card-title">
                                                                    <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>"><%#:getAdTitle(Item.offerAdID)%></a>
                                                                </h5>
                                                            </div>
                                                            <div class="row">
                                                                <p class="card-text">
                                                                    <%#:String.Format("{0:c}",getAdPrice(Item.offerAdID)) %>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4 d-none d-lg-block">
                                                    <div class="card-text align-items-center">
                                                        <p>Amount Offered: <%#:String.Format("{0:c}", Item.offerAmountOffered)%></p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="row">
                                                        <div class="card-text align-items-center">
                                                            <p>Status: <span class="text-success"><%#: getOfferStatus(Item.offerID) %></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <a href="Payment.aspx?advertisementID=<%#:Item.offerAdID %>">
                                                            <button type="button" class="btn btn-success btn-block">Pay Now</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted == 0 %>'>
                                                <div class="col-lg-4 col-md-6">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <div class="row">
                                                                    <h5 class="card-title">
                                                                        <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>"><%#:getAdTitle(Item.offerAdID)%></a>
                                                                    </h5>
                                                                </div>
                                                                <div class="row">
                                                                    <p class="card-text">
                                                                        <%#:String.Format("{0:c}",getAdPrice(Item.offerAdID)) %>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <div class="col-4 d-none d-lg-block">
                                                    <div class="card-text align-items-center">
                                                        <p>Amount Offered: <%#:String.Format("{0:c}", Item.offerAmountOffered)%></p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="row">
                                                        <div class="card-text align-items-center">
                                                            <p>Status: <span class="text-danger"><%#: getOfferStatus(Item.offerID) %></span></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <a href="Offer.aspx?advertisementID=<%#:Item.offerAdID %>">
                                                            <button type="button" class="btn btn-info btn-block">Make another Offer</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </asp:PlaceHolder>
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
