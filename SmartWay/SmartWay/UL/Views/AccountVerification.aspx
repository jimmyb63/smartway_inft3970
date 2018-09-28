<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AccountVerification.aspx.cs" Inherits="SmartWay.UL.Views.AccountVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Account Verification</div>
        <div class="card">
            <div class="card-body">
                <%--------Main Page Content Goes Here--------%>

                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Account Verfifcation</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <p>An 8 digit verficiation code has been emailed to you</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>Please enter code to verify account</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:TextBox ID="txtVerficiationCode" placeholder="Enter Code" runat="server"></asp:TextBox>
                            <asp:Button CssClass="btn btn-outline-dark" Text="Resend Code" runat="server" OnClick="resendVerificationCode" />
                        </div>
                    </div>
                    <div class="warning">
                        <asp:Label Text="" ID="errorMessage" runat="server" />
                    </div>
                    <asp:Button CssClass="btn btn-success" Text="Verify" runat="server" OnClick="VerifyUser" />
                    <a href="Contact.aspx">Contact Admin</a>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
