﻿<%@ Page Title="Content Review Successful" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ContentReviewSuccessful.aspx.cs" Inherits="SmartWay.UL.Views.ContentReviewSuccessful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Contact Us</div>
        <div class="card">
            <div class="card-body">
                Request Successfully Submitted
                <br />
                <br />
                ReqID # Blah Blah Blah
                <br />
                <br />

                <asp:Button ID="Button1" runat="server" Text="Return to HomeScreen" OnClick="Button1_Click" />

            </div>
        </div>
    </div>
    
    
</asp:Content>
