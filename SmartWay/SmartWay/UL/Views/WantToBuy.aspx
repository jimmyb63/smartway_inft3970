<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="WantToBuy.aspx.cs" Inherits="SmartWay.UL.Views.WantToBuy" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <% int adID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
        <% AdvertisementControls AC = new AdvertisementControls(); %>
        <% List<Advertisement> ad = AC.getAdvertisement(adID); %>
        <% List<string> adImages = AC.getAdImages(adID); %>
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Item Details:</h5>
            </div>
            <div class="row card-body">
                <div class="col-lg-3"><img class="card-img" src="<%=adImages[0] %>" width="20%" /></div>
                <div class="col-lg-6"><div class="card-text"><%=ad[0].advertisementTitle %></div></div>
                <div class="col-lg-3"><div class="card-text"><%=String.Format("{0:c}", ad[0].advertisementPrice) %></div></div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-6 col-md-12 my-1">
                        <asp:Button ID="btnBuyNow" Text="Buy it Now" CssClass="btn btn-warning btn-block" OnClick="BuyNow" runat="server" />
                    </div>
                    <div class="col-lg-6 col-md-12 my-1">
                        <asp:Button ID="btnMakeOffer" Text="Make an offer" CssClass="btn btn-danger btn-block" OnClick="MakeOffer" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
