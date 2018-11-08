<%@ Page Title="SmartWay - Content Review Successful" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ContentReviewSuccessful.aspx.cs" Inherits="SmartWay.UL.Views.ContentReviewSuccessful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Request Submitted</div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 text-center">
                    <h4>Request Successfully Submitted</h4>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Thank you. We will review your submission as soon as possible.</p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12 text-center">
                <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Return to HomeScreen" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>