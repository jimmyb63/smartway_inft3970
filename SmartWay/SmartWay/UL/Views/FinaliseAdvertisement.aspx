<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="FinaliseAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.FinaliseAdvertisement" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
        <% int buyerID = Convert.ToInt32(Request.QueryString["buyerID"]); %>
        <% int offerID = Convert.ToInt32(Request.QueryString["offerID"]); %>
        <% decimal ammount = Convert.ToDecimal(Request.QueryString["ammount"]); %>
        <% AdvertisementControls AC = new AdvertisementControls(); %>
        <% List<Advertisement> ad = AC.getAdvertisement(adID); %>
        <% Offer offer = AC.getOffer(offerID); %>
        <% List<string> adImages = AC.getAdImages(adID); %>
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Offer Details: <%=ad[0].advertisementTitle %></h5>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="view overlay" style="background-color: #263238">
                        <div class="thumbnail">
                            <img class="img-responsive" style="width: 100%;" src="<%=adImages[0] %>" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 card-body">
                    <div class="card-text">
                        <p>Listed price: <%=String.Format("{0:c}", ad[0].advertisementPrice) %></p>
                        <p>Date Listed: <%=ad[0].advertisementDatePosted.ToString("dd/MM/yyyy") %></p>
                    </div>
                </div>
                <div class="col-lg-4 card-body">
                    <div class="card-text">
                        <p>Buyer: <%=getUsername(offer.offerBuyerID) %></p>
                        <p>Offered price: <%=String.Format("{0:c}", offer.offerAmountOffered) %></p>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-6 col-md-12 my-1">
                        <asp:Button ID="btnSold" Text="Sold" CssClass="btn btn-warning btn-block" OnClick="adSold" runat="server" />
                    </div>
                    <div class="col-lg-6 col-md-12 my-1">
                        <asp:Button ID="btnCancel" Text="Cancel Offer" CssClass="btn btn-danger btn-block" OnClick="cancelOffer" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
