<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OfferConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.OfferConfirmation" %>

<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--New style sample for confirmation pages-->
    <div class="col-lg-9 mt-2">
        <div class="alert alert-warning text-center animated flipInX" role="alert">
            <h4 class="alert-heading">Your offer has been submitted</h4>
            <% string adID = Request.QueryString["advertisementID"]; %>
            <p>Click <a href="ViewAdvertisement.aspx?advertisementID=<%=adID %>">here</a> to return to Advertisement.</p>
            <p>Your browser will automatically take you there in <span id="countdown">10</span> seconds.</p>
        </div>
    </div>
    <%string query = Request.QueryString["advertisementID"]; %>
    <!-- JavaScript part -->
    <script type="text/javascript">
        var seconds = 10;
        function countdown() {
            seconds = seconds - 1;
            if (seconds < 0) {
                window.location = "ViewAdvertisement.aspx?advertisementID=".concat(<%=query %>);
            } else {
                document.getElementById("countdown").innerHTML = seconds;
                window.setTimeout("countdown()", 1000);
            }
        }
        countdown();
    </script>
</asp:Content>
