<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OfferConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.OfferConfirmation" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <% int offerID = Convert.ToInt32(Request.QueryString["offerID"]); %>
        <div class="card">
            <div class="card-body">
                <div class="card-text"><p>Offer has been sucessfully submitted!</p></div>
            </div>
        </div>
    </div>
</asp:Content>
