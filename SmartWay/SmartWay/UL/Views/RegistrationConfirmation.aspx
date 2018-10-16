<%@ Page Title="SmartWay - Registration Confirmation" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="RegistrationConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.RegistrationConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--New style sample for confirmation pages-->
    <div class="col-lg-9 mt-2">
        <div class="alert alert-success text-center animated flipInX" role="alert">
            <h4 class="alert-heading">Thank you - Your account has been verified</h4>
                        <p>Click <a href="Login.aspx">here</a> to Login.</p>
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
