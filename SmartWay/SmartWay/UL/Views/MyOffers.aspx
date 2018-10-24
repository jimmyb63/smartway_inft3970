<%@ Page Title="SmartWay - My Offers" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyOffers.aspx.cs" Inherits="SmartWay.UL.Views.MyOffers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">My Offers</div>
        <div class="row">
            <div class="col-12 my-2" runat="server">
                <div class="card h-100">
                    <div class="card-header">
                        <h5>Accepted:</h5>
                    </div>
                    <asp:ListView ID="adListAccepted" runat="server"
                        DataKeyNames="offerID" GroupItemCount="5"
                        ItemType="SmartWay.BL.Models.Offer" SelectMethod="getAcceptedOffers">
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text"><h4 class="text-center">No offers Accepted yet!</h4></p>
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
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="view overlay" style="background-color: #263238">
                                        <div class="thumbnail">
                                            <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>">
                                                <img class="img-responsive" src="<%#getAdImage(Item.offerAdID)%>" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="card-body  align-items-center">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="card-title">
                                                            <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>"><%#:getAdTitle(Item.offerAdID)%></a>
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                            <p class="card-text">
                                                                <%#:String.Format("{0:c}",getAdPrice(Item.offerAdID)) %>
                                                            </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card-text align-items-center">
                                                            <p>Amount Offered: <%#:String.Format("{0:c}", Item.offerAmountOffered)%></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card-text align-items-center">
                                                            <p>Status: <span class="text-success"><%#: getOfferStatus(Item.offerID) %></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <asp:PlaceHolder runat="server" visible='<%# adFinalised(Item.offerAdID) == false %>'>
                                                        <div class="col-lg-12">
                                                            <a href="PrivateMessage.aspx?advertisementID=<%#:Item.offerAdID %>&buyerID=<%#: Item.offerBuyerID%>">
                                                                <button type="button" class="btn btn-success btn-block">Message</button>
                                                            </a>
                                                        </div>
                                                    </asp:PlaceHolder>
                                                    <asp:PlaceHolder runat="server" visible='<%# adFinalised(Item.offerAdID) == true %>'>
                                                        <div class="col-lg-12">
                                                            <a href="PrivateMessage.aspx?advertisementID=<%#:Item.offerAdID %>&buyerID=<%#: Item.offerBuyerID%>">
                                                                <button type="button" class="btn btn-success btn-block">Message</button>
                                                            </a>
                                                        </div>
                                                    </asp:PlaceHolder>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                        <h5>Pending:</h5>
                    </div>
                    <asp:ListView ID="adListPending" runat="server"
                        DataKeyNames="offerID" GroupItemCount="5"
                        ItemType="SmartWay.BL.Models.Offer" SelectMethod="getPendingOffers">
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text"><h4 class="text-center">No offers Pending!</h4></p>
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
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="view overlay" style="background-color: #263238">
                                        <div class="thumbnail">
                                            <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>">
                                                <img class="img-responsive" src="<%#getAdImage(Item.offerAdID)%>" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="card-body  align-items-center">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="card-title">
                                                            <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>"><%#:getAdTitle(Item.offerAdID)%></a>
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                            <p class="card-text">
                                                                <%#:String.Format("{0:c}",getAdPrice(Item.offerAdID)) %>
                                                            </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card-text align-items-center">
                                                            <p>Amount Offered: <%#:String.Format("{0:c}", Item.offerAmountOffered)%></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card-text align-items-center">
                                                            <p>Status: <%#: getOfferStatus(Item.offerID) %></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <a href="OfferCancel.aspx?offerID=<%#:Item.offerID %>">
                                                            <button type="button" class="btn btn-danger btn-block">Cancel</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                        <h5>Not Accepted:</h5>
                    </div>
                    <asp:ListView ID="offerListNotAccepted" runat="server"
                        DataKeyNames="offerID" GroupItemCount="5"
                        ItemType="SmartWay.BL.Models.Offer" SelectMethod="getNotAcceptedOffers">
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-1 my-2"></div>
                                <div class="col-10 my-2">
                                    <p class="card-text"><h4 class="text-center">No offers Declined!</h4></p>
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
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="view overlay" style="background-color: #263238">
                                        <div class="thumbnail">
                                            <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>">
                                                <img class="img-responsive" src="<%#getAdImage(Item.offerAdID)%>" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="card-body  align-items-center">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="card-title">
                                                            <a href="ViewAdvertisement.aspx?advertisementID=<%#:Item.offerAdID%>"><%#:getAdTitle(Item.offerAdID)%></a>
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                            <p class="card-text">
                                                                <%#:String.Format("{0:c}",getAdPrice(Item.offerAdID)) %>
                                                            </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card-text align-items-center">
                                                            <p>Amount Offered: <%#:String.Format("{0:c}", Item.offerAmountOffered)%></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card-text align-items-center">
                                                            <p>Status: <span class="text-danger"><%#: getOfferStatus(Item.offerID) %></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <a href="Offer.aspx?advertisementID=<%#:Item.offerAdID %>">
                                                            <button type="button" class="btn btn-info btn-block">Make another Offer</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
