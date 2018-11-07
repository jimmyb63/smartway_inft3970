<%@ Page Title="SmartWay - Account Verification" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AccountVerification.aspx.cs" Inherits="SmartWay.UL.Views.AccountVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-lg-9 mt-2">
        <%--<div class="p-2 mb-2 bg-primary text-white">Account Verification</div>--%>
        <div class="card text-center">
            <div class="card-header">
                <h2>Account Verfifcation</h2>
                <hr />
                <p>An 8 digit verficiation code has been sent to you via SMS and email. If you do not receive the email within a few minutes, please check your Spam or Bulk E-Mail folder just in case the verification email got delivered there instead of your inbox.</p>
            </div>
            <div class="card-body">
                <p>Please enter the code to verify your account</p>
                <div class="row my-2">
                    <div class="col-lg-2 col-md-0"></div>
                    <div class="col-lg-4 col-md-6 mb-2">
                        <asp:TextBox ID="txtVerficiationCode" CssClass="form-control text-center" placeholder="Enter Code" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <asp:Button CssClass="btn btn-sm btn-info btn-block mt-1" Text="Resend Code" runat="server" OnClick="resendVerificationCode" />
                    </div>
                    <div class="col-lg-2 col-md-0"></div>
                </div>
                <div class="warning">
                    <asp:Label Text="" ID="errorMessage" runat="server" />
                </div>
                <div class="d-lg-block d-none">
                <hr />
                </div>
                <div class="row my-2">
                    <div class="col-lg-3 col-md-0"></div>
                    <div class="col-lg-6">
                        <asp:Button CssClass="btn btn-success btn-block btn-sm" Text="Verify" runat="server" OnClick="VerifyUser" />
                    </div>
                    <div class="col-lg-3 col-md-0"></div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
