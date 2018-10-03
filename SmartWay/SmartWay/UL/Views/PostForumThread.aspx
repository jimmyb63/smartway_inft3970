﻿<%@ Page Title="SmartWay - Post a Forum Thread" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostForumThread.aspx.cs" Inherits="SmartWay.UL.Views.PostForumThread" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <!------- Page Content -------->
        <div class="col-lg-9 mt-2">
            <div class="p-2 mb-2 bg-primary text-white">Post a Forum Thread</div>
            <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">
                <h5>Forum Thread Title</h5>
                <asp:TextBox CssClass="form-control" ID="txtTitle" placeholder="Eg. Resuse items as Plant Pots" runat="server" />
                <hr />
                <h5>Type of Forum Thread</h5>
                <asp:RadioButtonList CssClass="form-group" ID="rbAdType" runat="server">
                    <asp:ListItem Text=" Recycle" Value="recycle"/>
                    <asp:ListItem Text=" Reuse" Value="reuse"/>
                    <asp:ListItem Text=" Repurpose" Value="repurpose"/>
                </asp:RadioButtonList>
                <hr />
                <h5>Select Tags that Best Apply</h5>
                <asp:ListBox ID="lbRecycleTags" runat="server">
                    <asp:ListItem Text="Reuse Household goods" Value="red"></asp:ListItem>
                    <asp:ListItem Text="Repurpose Household good" Value="blue"></asp:ListItem>
                    <asp:ListItem Text="Compsite" Value="green"></asp:ListItem>
                    <asp:ListItem Text="Trash To Treasure" Value="green"></asp:ListItem>
                </asp:ListBox>
                <hr />
           
                <div class="form-group">
                <h5>Forum Thread Description</h5>
                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="txtDescription" rows="8" runat="server"/>
                </div>
                <hr />
                <h5>Upload photos</h5>
                <div class="row">
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload1" runat="server"/>
                        <label class="custom-file-label" for="FileUpload1">Choose file</label>
                    </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload2" runat="server"/>
                        <label class="custom-file-label" for="FileUpload2">Choose file</label>
                    </div>
                    </div>
                </div>
                </div>
                
                <br />
                <hr />
                <asp:Button CssClass="btn btn-block btn-success" Text="Submit" runat="server" OnClick="postAd" />
                <hr />
            </div>
        </div>
            
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
    </div>

</asp:Content>
