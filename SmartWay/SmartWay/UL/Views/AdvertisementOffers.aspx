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
        <div class="p-2 mb-2 bg-primary text-white">My Advertisements Offers - <%=ad[0].advertisementTitle %></div>
        <div class="card">
            <div class="card-header d-none d-lg-block">
                <div class="row">
                    <div class="col-3"><p class="font-weight-bold">Username</p></div>
                    <div class="col-2"><p class="font-weight-bold">Amount</p></div>
                    <div class="col-2"><p class="font-weight-bold">Status</p></div>
                    <div class="col-4"></div>
                </div>
            </div>
            <div class="row">
                <div class="card-body">
                    <asp:ListView ID="offerList" runat="server"
                        DataKeyNames="offerID" GroupItemCount="4"
                        ItemType="SmartWay.BL.Models.Offer" OnItemCommand="offerList_ItemCommand" SelectMethod="GetOffers">
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
                            <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted != 0 %>'>
                            <div class="col-lg-12 my-2" runat="server">
                                <div class="row">
                                    <div class="col-lg-3">
                                        Buyer: <%#: getUsername(Item.offerBuyerID) %>        
                                    </div>
                                    <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted == 1 %>'>
                                        <div class="col-lg-2">
                                            <%#:String.Format("{0:c}", Item.offerAmountOffered)%>
                                        </div>
                                        <div class="col-lg-2">
                                            <p class="text-success">Accepted</p> 
                                        </div>
                                        <div class="col-lg-2 mb-2">
                                            <asp:Button CssClass="btn btn-sm btn-block btn-info" Text="Message" runat="server" CommandName="message" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </div>
                                        <div class="col-lg-2 mb-2">
                                        <asp:Button CssClass="btn btn-sm btn-block btn-blue" Text="Finalise" CommandName="finalise" CommandArgument="<%# Container.DataItemIndex %>" runat="server" />
                                    </div>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted == 2 %>'>
                                        <div class="col-lg-2">
                                            <%#:String.Format("{0:c}", Item.offerAmountOffered)%> 
                                        </div>
                                        <div class="col-lg-2">
                                            <p>Pending</p> 
                                        </div>
                                        <div class="col-lg-2 mb-2">
                                            <asp:Button CssClass="btn btn-block btn-sm btn-success" Text="Accept" runat="server" CommandName="accept" CommandArgument="<%# Container.DataItemIndex %>"/>  
                                        </div>
                                        <div class="col-lg-2 mb-2">
                                            <asp:Button CssClass="btn btn-block btn-sm btn-danger" Text="Decline" runat="server" CommandName="decline" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </div>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" visible='<%# Item.offerOfferAccepted == 3 %>'>
                                        <div class="col-lg-2">
                                            <%#:String.Format("{0:c}", Item.offerAmountOffered)%> 
                                        </div>
                                        <div class="col-lg-2">
                                            <p>Other ofeer Accepted</p> 
                                        </div>
                                        <div class="col-lg-2 mb-2">
                                            <asp:Button CssClass="btn btn-block btn-sm btn-success" Text="Accept" runat="server" Enabled="false" />  
                                        </div>
                                        <div class="col-lg-2 mb-2">
                                            <asp:Button CssClass="btn btn-block btn-sm btn-danger" Text="Decline" runat="server" Enabled="false" />
                                        </div>
                                    </asp:PlaceHolder>
                                </div>
                            </div>
                            </asp:PlaceHolder>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                <tr id="groupPlaceholder"></tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
