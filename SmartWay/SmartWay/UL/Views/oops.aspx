<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="oops.aspx.cs" Inherits="SmartWay.UL.Views.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
    <div class="card text-center">
        <h1 class="mt-4" style="font-family:'Courgette', cursive;">oops!</h1>
        <h2 style="font-family:'Courgette', cursive;">Something went wrong</h2>
        <br />
        <a href="contact.aspx">CLick here to contact one of our friendly staff.</a>
        <br />
        <a href="index.aspx">Click here to go home.</a>
        <br />
        <p>Your browser will automatically take you home in <span id="countdown">20</span> seconds.</p>
        
        </div>
    </div>
        <script type="text/javascript">
        var seconds = 20;
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
