﻿<%@ Page Title="SmartWay - Login" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartWay.UL.Views.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../../Content/LoginRegStyle.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="col-lg-9">
        <%--  Main Page Content Goes Here--%>
         <div class="card mt-2">
            <%--<div class="card-body">--%>
                <%--<div class="container">--%>
                    <div class="card-header">
                        <div class="row my-2">
                            <div class="col-lg-12 text-center">
                                <h4>Login</h4>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg-12 text-center">
                                <h6><a href="Registration.aspx">Don't have an account?</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mt-2">
                            <div class="col-lg-6 text-center mb-3">
                                <asp:TextBox
                                ID="txtEmail"
                                placeholder="Email Address"
                                runat="server"
                                CssClass="form-control" />

                                <asp:RequiredFieldValidator
                                ErrorMessage="Required"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="txtEmail"
                                runat="server" />

                                <!--Regular expression to ensure that the email is valid, expression found courtesy of RegExlib.com-->
                                <asp:RegularExpressionValidator
                                runat="server"
                                Display="Dynamic"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtEmail"
                                ForeColor="Red"
                                ErrorMessage="Invalid email address." />
                            </div>
                            <div class="col-lg-6 text-center">
                                    <asp:TextBox
                                    ID="txtPassword"
                                    placeholder="Password"
                                    runat="server"
                                    TextMode="Password"
                                    CssClass="form-control" /><br />
                                    <asp:RequiredFieldValidator
                                    ErrorMessage="Required"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ControlToValidate="txtPassword"
                                    runat="server" />
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg-12 text-center">
                                <h6><a href="ForgotPassword.aspx">Forgot Password?</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row mt-2">
                            <div class="col-lg-12 text-center">
                                <asp:Button Text="Login" 
                                    runat="server" 
                                    OnClick="userLogin" 
                                    CssClass="btn btn-primary btn-block" />
                                <div class="warning">
                                    <asp:Label 
                                        Text="" 
                                        ID="errorMessage" 
                                        runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
</asp:Content>
