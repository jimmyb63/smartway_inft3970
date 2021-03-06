﻿<%@ Page Title="SmartWay - My Account" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="SmartWay.UL.Views.Account" %>

<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if (Session["currentUser"] != null)
        {
            Person currentUser = new Person();
            currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;%>

    <!----------Page Content ---------->
    <div class="col-lg-9 mt-2">
        <div class=" mb-2 bg-primary text-white">
            <!----------Profile Navigation ---------->
            <ul class="nav nav-pills">
                <li class="nav-item pill-1"><a href="" data-target="#profile" data-toggle="tab" class="nav-link active">My profile</a> </li>
                <li class="nav-item pill-1"><a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a> </li>
                <%--<li class="nav-item pill-1"><a href="" data-target="#ForSaleItems" data-toggle="tab" class="nav-link">For Sale Items</a> </li>--%>
            </ul>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="container">
                    <div class="row my-2">
                        <div class="col-lg-12 order-lg-2">
                            <!---------- My Profile Tab Content ---------->
                            <div class="tab-content py-2">
                                <div class="tab-pane active" id="profile">
                                    <h5 class="mb-3">User Profile</h5>
                                    <hr />
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <% UserControls UC = new UserControls(); %>
                                            <% string filePath = UC.getProfileImage(currentUser.userID); %>
                                            <img src="<%=filePath %>" class="mx-auto img-fluid img-circle d-block mb-4" alt="avatar" />
                                            </div>
                                        <div class="col-md-4">
                                            <h6>Personal Details</h6>
                                            <hr />
                                            <div class="card-text">
                                                <b>Username: </b>
                                                <asp:Label ID="lblUserName" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>First Name: </b>
                                                <asp:Label ID="lblFName" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Last Name: </b>
                                                <asp:Label ID="lblLName" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Email: </b>
                                                <asp:Label ID="lblEmail" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Date of Birth: </b>
                                                <asp:Label ID="lblDOB" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Phone Number: </b>
                                                <asp:Label ID="lblPhoneNumber" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-4">
                                            <h6>Address Details</h6>
                                            <hr />
                                            <div class="card-text">
                                                <b>Unit Number: </b>
                                                <asp:Label ID="lblUnitNum" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Street Address: </b>
                                                <asp:Label ID="lblStreetNum" runat="server" Text="Label" />
                                                &nbsp
                                                <asp:Label ID="lblStreetName" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>City: </b>
                                                <asp:Label ID="lblCity" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>State: </b>
                                                <asp:Label ID="lblState" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Country: </b>
                                                <asp:Label ID="lblCountry" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                            <div class="card-text">
                                                <b>Postcode: </b>
                                                <asp:Label ID="lblPostcode" runat="server" Text="Label" />
                                            </div>
                                            <br />
                                        </div>
                                    </div>
                                </div>

                                <!---------- Edit Tab Content ---------->

                                <div class="tab-pane" id="edit">
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">First name:</label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxFName" 
                                                placeholder="First Name" 
                                                runat="server" 
                                                Text="First Name" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">Last name:</label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxLName" 
                                                placeholder="Last Name" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">Email:</label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                type="email" 
                                                ID="tbxEmail" 
                                                placeholder="Email" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">DOB:</label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                type="date" 
                                                ID="tbxDob" 
                                                placeholder="DOB" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">Phone Number:</label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxPhoneNumber" 
                                                placeholder="Last Name" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">Address:</label>
                                        <div class="col-lg-4 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxUnitNumber" 
                                                placeholder="Unit number" 
                                                runat="server" />
                                        </div>
                                        <div class="col-lg-5 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxStreetNumber" 
                                                placeholder="Street Number" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label"></label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxStreetName" 
                                                placeholder="Street Name" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label"></label>
                                        <div class="col-lg-6 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxCity" 
                                                placeholder="City" 
                                                runat="server" />
                                        </div>
                                        <div class="col-lg-3 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxState" 
                                                placeholder="State" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label"></label>
                                        <div class="col-lg-6 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxCountry" 
                                                placeholder="Country" 
                                                runat="server" />
                                        </div>
                                        <div class="col-lg-3 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxPostcode" 
                                                placeholder="Postcode" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">Username:</label>
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                ID="tbxUName" 
                                                placeholder="Username" 
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-12 col-form-label form-control-label">Password:</label><br />
                                        <div class="col-lg-9 col-12">
                                            <asp:TextBox 
                                                CssClass="form-control" 
                                                type="password" 
                                                ID="tbxPassword" 
                                                ReadOnly placeholder="Password" 
                                                runat="server" />
                                        </div>
                                        <!---------- Change Password Button ---------->
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6 offset-lg-3">
                                            <div class="imgUp">
                                                <div class="imagePreview"></div>
                                                <label class="btn btn-primary btn-block">
                                                    Select New Profile Image<asp:FileUpload
                                                        CssClass="uploadFile img"
                                                        ID="FileUpload1"
                                                        runat="server"
                                                        Style="width: 0px; height: 0px; overflow: hidden" />
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group row">
                                        <div class="col-lg-6">
                                            <button 
                                                type="button" 
                                                class="btn btn-primary btn-block mb-2" 
                                                data-toggle="modal" 
                                                data-target="#saveModal">
                                                Save Changes</button>
                                        </div>
                                        <div class="col-lg-6">
                                            <button 
                                                type="button" 
                                                class="btn btn-danger btn-block" 
                                                data-toggle="modal" 
                                                data-target="#passwordModal">
                                                Change Password</button>
                                        </div>
                                    </div>
                                </div>
                                <!---------- Sale Items Tab Content ---------->
                                <%--<div class="tab-pane" id="ForSaleItems">
                                    <h5 class="mb-3">For Sale Items</h5>
                                    <hr />
                                    <div class="row">
                                        <asp:GridView 
                                            ID="gvForsaleItems2" 
                                            runat="server" 
                                            AutoGenerateColumns="false" 
                                            GridLines="Horizontal" 
                                            CssClass="table table-bordered" 
                                            CellPadding="4" 
                                            HorizontalAlign="Center"
                                            ItemType="SmartWay.BL.Models.Advertisement" 
                                            SelectMethod="getAddSummary">
                                            <Columns>
                                                <asp:BoundField DataField="advertisementDatePosted" HeaderText="Date added" />
                                                <asp:BoundField DataField="advertisementTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="advertisementDescription" HeaderText="Decription" />
                                                <asp:BoundField DataField="advertisementActive" HeaderText="Status" />
                                            </Columns>
                                        </asp:GridView>
                                        <!----------<asp:GridView ID="gvForsaleItems" runat="server" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField DataField="advertisementTitle" HeaderText="Title"/>
                                                <asp:BoundField DataField="advertisementDatePosted" HeaderText="Date added"/>
                                                <asp:BoundField DataField="advertisementActive" HeaderText="Status"/>
                                            </Columns>
                                        </asp:GridView>----->
                                    </div>
                                </div>--%>
                            </div>

                            <!---------- Profile Picture and File Upload ---------->


                            <%--                        <div class="col-lg-3 order-lg-1 text-center">
                            <div class="col-lg-3 order-lg-1 text-center">
                            <% UserControls UC = new UserControls(); %>
                            <% string filePath = UC.getProfileImage(currentUser.userID); %>
                            <img src="<%=filePath %>" class="mx-auto img-fluid img-circle d-block" alt="avatar" />
                            <h6 class="mt-2">Upload a different photo</h6>
                            <label class="custom-file">
                                <input type="file" id="file" class="custom-file-input" />
                                <span class="custom-file-control">Choose file</span>
                            </label>
                        </div>--%>
                        </div>
                    </div>
                </div>
                <% }%>

                <!---------- Password Reset Modal ---------->

                <div class="modal fade" id="passwordModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Change Password</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-lg-5 col-form-label form-control-label">Current Password: </label>
                                    <div class="col-lg-7">
                                        <input class="form-control" type="password" value="" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-5 col-form-label form-control-label ">New Password: </label>
                                    <div class="col-lg-7">
                                        <input class="form-control" type="password" value="" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-5 col-form-label form-control-label ">Confirm New Password: </label>
                                    <div class="col-lg-7">
                                        <input class="form-control" type="password" value="" />
                                    </div>
                                </div>
                                <hr />
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button 
                                        type="button" 
                                        class="btn btn-primary" 
                                        data-toggle="modal" 
                                        data-target="#confirmationModal" 
                                        data-dismiss="modal">
                                        Save Password</button>
                                    <button 
                                        type="button" 
                                        class="btn btn-warning" 
                                        data-toggle="modal" 
                                        data-target="#passwordResetModal" 
                                        data-dismiss="modal" 
                                        pull-left>
                                        Forgot Password</button>
                                    <button 
                                        type="button" 
                                        class="btn btn-danger" 
                                        data-dismiss="modal">
                                        Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!---------- Save Changes Modal ---------->

                <div class="modal fade" id="saveModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Confirm Changes</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                Are you sure you want to update your account information?
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Save Changes</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

                <!---------- Password Save Confirmation Modal ---------->

                <div class="modal fade" id="confirmationModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Password Saved</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                Your password has been updated.
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

                <!---------- Password Reset Modal ---------->

                <div class="modal fade" id="passwordResetModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Password Reset</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-lg-12 col-form-label form-control-label ">Enter the email address you used to register your SmartWay account, we will send you a password reset email.</label>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label ">Email: </label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="">
                                    </div>
                                </div>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#passwordResetConfirmationModal" data-dismiss="modal" pull-left>Send Password Reset</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!---------- Password Reset Confirmation Modal ---------->

                <div class="modal fade" id="passwordResetConfirmationModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Password Reset</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                An email has been sent to your designated email address
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
