<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OfferCancel.aspx.cs" Inherits="SmartWay.UL.Views.OfferCancel" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <asp:HiddenField ID="offerID" runat="server" />
        <% int offerID = Convert.ToInt32(Request.QueryString["offerID"]); %>
        <% AdvertisementControls AC = new AdvertisementControls(); %>
        <div class="card text-center">
            <div class="row card-body text-center">
                <h5 class="card-title">Are you sure you want to cancel?</h5>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-12 my-1">
                        <asp:Button ID="btnCancel" Text="Yes, Cancel" CssClass="btn btn-warning btn-block" OnClick="cancelOffer" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 my-1">
                        <a href="MyOffers.aspx">No, go back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
