<%@ Page Title="SmartWay - Logout" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LogoutConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.LogoutConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="col-lg-9 order-lg-2">
                <div class="p-2 my-2 bg-success text-white">Logout Successful</div>
                <div class="jumbotron text-center mt-2">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h2>Thankyou for using SmartWay</h2><br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-8">
                                <a href="login.aspx" class="btn btn-block btn-info">Click Here to Login</a><br />
                            </div>
                            <div class="col-lg-2">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
