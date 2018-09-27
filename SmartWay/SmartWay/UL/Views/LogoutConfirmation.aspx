<%@ Page Title="SmartWay - Logout" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LogoutConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.LogoutConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-9 my-2" runat="server">
        <div class="card h-100">
            <div class="row">
                <div class="col-1 my-2"></div>
                <div class="col-10 my-2">
                    <div class="card-text">
                        <h4 class="text-center">You,ve successfully logged out!</h4>
                        <br />
                        <p class="text-center">See You next time</p>
                    </div>
                </div>
                <div class="col-1 my-2"></div>
            </div>
        </div>
    </div>
</asp:Content>
