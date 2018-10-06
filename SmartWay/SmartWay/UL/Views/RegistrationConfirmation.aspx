<%@ Page Title="SmartWay - Registration Confirmation" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="RegistrationConfirmation.aspx.cs" Inherits="SmartWay.UL.Views.RegistrationConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Registration Confirmed!</div>
                <%--------Main Page Content Goes Here--------%>
                <div class="jumbotron text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Thank you - Your account has been verified</h1>
                                <%-- After successful verification, user is redirected to login page --%>
                                <p>Click <a href="Login.aspx">here</a> to login</p>
                                <p>You will be automatically redirected in 10 seconds</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
