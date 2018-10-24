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
   <div class="alert alert-danger text-center" role="alert">
            <h4 class="alert-heading">Are you sure you want to cancel?</h4>
                       <div class="row">
                    <div class="col-6 my-1">
                        <asp:Button ID="btnCancel" Text="Yes, Cancel" CssClass="btn btn-success btn-block" OnClick="cancelOffer" runat="server" />
                    </div>
                                        <div class="col-6 my-1">
                        <a class="btn btn-block btn-danger" href="MyOffers.aspx">No, go back</a>
                </div>
        </div> 
        </div>





</asp:Content>
