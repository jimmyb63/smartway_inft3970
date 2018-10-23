<%@ Page Title="SmartWay - Post a Forum Thread" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostForumThread.aspx.cs" Inherits="SmartWay.UL.Views.PostForumThread" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <!------- Page Content -------->
    <asp:HiddenField ID="hfSelectedForumTags" runat="server" />    
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Post a Forum Thread</div>
            <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">
                <%-- Error Summary --%>
                <asp:ValidationSummary
                    ID="ValidationSummaryForumPost"
                    runat="server"
                    ForeColor="Red"
                    HeaderText="Please fix these entries:" />
                <h5>Forum Thread Title*</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtTitle" 
                    placeholder="Eg. Re-use items as Plant Pots" 
                    runat="server" />
                <asp:RequiredFieldValidator
                    ID="RequiredTitle"
                    runat="server"
                    ForeColor="Red"
                    ErrorMessage="Title is required."
                    ControlToValidate="txtTitle">
                </asp:RequiredFieldValidator>
                <hr />
                <h5>Select Tags that Best Apply</h5>
                <asp:CheckBoxList 
                    ID="cblForumTags"
                    oninit="getForumTags"
                    AutoPostBack="true"
                    CssClass="form-group"
                    RepeatLayout="Table" 
                    RepeatColumns = "3" 
                    RepeatDirection="Horizontal" 
                    runat="server" OnSelectedIndexChanged="cblForumTags_SelectedIndexChanged1">
                    <asp:ListItem>Item 1</asp:ListItem>
                </asp:CheckBoxList>

                <asp:Button 
                    ID="btnAddforumTag" 
                    CssClass="btn btn-block btn-info" 
                    Text="Add a Forum Tag To The List" 
                    runat="server" 
                    OnClick="btnAddforumTag_Click" />
                <hr />
                <asp:Label ID="lblTestData" runat="server" Text="Selected are:"></asp:Label>
                <hr />           
                <div class="form-group">
                    <%-- TEXTBOX --%>
                <h5>Forum Thread Description*</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    TextMode="MultiLine" 
                    ID="txtDescription" 
                    rows="8" 
                    runat="server"/>
                    <%-- VALIDATION for TEXTBOX --%>
                <asp:RequiredFieldValidator
                    ID="RequiredDescription"
                    runat="server"
                    ControlToValidate="txtDescription"
                    ErrorMessage="Description is required."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>
                <hr />
                <h5>Upload photos</h5>
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 1
                                        <asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload1"
                                            runat="server"
                                            Style="width: 0px;
                                                   height: 0px;
                                                   overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block">
                                        Select Image 2
                                        <asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload2"
                                            runat="server"
                                            Style="width: 0px;
                                                   height: 0px;
                                                   overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div> 
                <br />
                <hr />
                <asp:Button 
                    CssClass="btn btn-block btn-success" 
                    Text="Submit" 
                    runat="server" 
                    OnClick="postAd" />
                <hr />
            </div>
        </div>            
    <div class="warning">
        <asp:Label 
            Text="" ID="errorMessage" 
            runat="server" />
    </div>
    </div>
</asp:Content>
