<%@ Page Title="SmartWay - Make an Offer" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Offer.aspx.cs" Inherits="SmartWay.UL.Views.Offer" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
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
                <h5 class="card-title">Make an Offer:</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3">
                        <div class="card-text">
                            <p>Asking Price:</p>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card-text"><%=String.Format("{0:c}", ad[0].advertisementPrice) %></div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3">
                        <div class="card-text">
                            <p>Offer Amount:</p>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtOfferAmount" PlaceHolder="Offer Amount" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <asp:Button ID="btnMakeOffer" Text="Submit Offer" CssClass="btn btn-success btn-block" OnClick="MakeOffer" runat="server" />
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
