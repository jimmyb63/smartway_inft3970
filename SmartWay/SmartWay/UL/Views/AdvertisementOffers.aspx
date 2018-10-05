<%@ Page Title="SmartWay - My Advertisement Offers" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AdvertisementOffers.aspx.cs" Inherits="SmartWay.UL.Views.AdvertisementOffers" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
        <% AdvertisementControls AC = new AdvertisementControls(); %>
        <% List<Advertisement> ad = AC.getAdvertisement(adID); %>
        <div class="p-2 mb-2 bg-primary text-white">My Advertisements Offers</div>
        <div class="card">
            <div class="row">
                <div class="card-header">
                    <div class="col-4">Offer for ID: <%=ad[0].advertisementID %></div>
                    <div class="col-4">Title: <%=ad[0].advertisementTitle %></div>
                    <div class="col-4">Date: <%=ad[0].advertisementDatePosted %></div>
                </div>
            </div>
            <div class="row">
                <div class="card-body">
                    <asp:ListView ID="adList" runat="server"
                        DataKeyNames="advertisementID" GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.Offer" SelectMethod="GetOffers">
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
                                <div class="row">
                                    <div class="col-3">
                                        Buyer: <%#: getUsername(Item.offerBuyerID) %>        
                                    </div>
                                    <div class="col-3">
                                        Offer Amount: <%#: Item.offerAmountOffered %> 
                                    </div>
                                    <div class="col-3">
                                        Accept    
                                    </div>
                                    <div class="col-3">
                                        Decline  
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
            </div>
        </div>
    </div>
</asp:Content>
