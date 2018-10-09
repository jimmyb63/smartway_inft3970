<%@ Page Title="SmartWay - Forgot password" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SmartWay.UL.Views.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
        <div class="card mt-2">
            <div class="card-header">
                <div class="row my-2">
                    <div class="col-lg-12 text-center">
                        <h5>Forgot Password?</h5>
                        <p>Enter your email address below to reset your password</p>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row mt-2">
                    <div class="col-lg-6 text-center offset-lg-3">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" placeholder="Email address" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtEmail" runat="server" />
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row mt-2">
                    <div class="col-lg-12 text-center">
                        <asp:Button CssClass="btn btn-success btn-block" Text="Submit" runat="server" OnClick="forgotPassword" />
                    </div>
                </div>
            </div>
            <div class="warning">
                <asp:Label Text="" ID="errorMessage" runat="server" />
            </div>
            <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
</asp:Content>
