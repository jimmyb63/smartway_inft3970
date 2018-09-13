<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="SmartWay.UL.Views.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <iframe id="myIframe" src="MapPage.aspx" runat="server" width="100%" height="100%"></iframe>
    </div>
</asp:Content>
