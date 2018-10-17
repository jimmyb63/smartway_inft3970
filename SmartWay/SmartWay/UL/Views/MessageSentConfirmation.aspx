<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MessageSentConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.MessageSentConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--New style sample for confirmation pages-->
    <div class="col-lg-9 mt-2">
        <div class="alert alert-success text-center animated flipInX" role="alert">
            <h4 class="alert-heading">Your Message Has Been Sent. Good Luck!</h4>
                        <%-- After successful verification, user is redirected to homepage --%>
                        <p>Click <a href="Index.aspx">here</a> to go to Home</p>
                        <p>Your browser will automatically take you there in <span id="countdown">10</span> seconds.
        </div> </div>
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
