﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OfferConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.OfferConfirmation" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-success text-white">Offer Successful</div>
        <%--------Main Page Content Goes Here--------%>
        <div class="jumbotron text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Your offer has been sucessfully submitted</h1>
                        <% int offerID = Convert.ToInt32(Request.QueryString["offerID"]); %>
                        <p>Click <a href="index.aspx">here</a> to go to home.</p>
                        <p>Your browser will automatically take you there in <span id="countdown">10</span> seconds.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JavaScript part -->
    <script type="text/javascript">
        var seconds = 10;
        function countdown() {
            seconds = seconds - 1;
            if (seconds < 0) {
                window.location = "index.aspx";
            } else {
                document.getElementById("countdown").innerHTML = seconds;
                window.setTimeout("countdown()", 1000);
            }
        }
        countdown();
    </script>
</asp:Content>