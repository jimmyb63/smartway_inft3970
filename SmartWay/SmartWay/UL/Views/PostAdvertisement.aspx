<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.PostAdvertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	  
    <!------- Page Content -------->
        <div class="col-lg-9 mt-2">
            <div class="p-2 mb-2 bg-primary text-white">Post an Ad</div>
            <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">
                <h5>Ad title</h5>
                <asp:TextBox CssClass="form-control" ID="txtTitle" placeholder="Eg. Weber Family 2 burner BBQ in great condition" runat="server" />
                <hr />
                <h5>Type of ad</h5>
                <asp:RadioButtonList CssClass="form-group" ID="rbAdType" runat="server">
                    <asp:ListItem Text=" Offer" Value="offer"/>
                    <asp:ListItem Text=" Request" Value="request"/>
                </asp:RadioButtonList>
                <hr />
                <h5>Select a category</h5>
                <asp:RadioButtonList CssClass="form-group" ID="rbAdCategory" OnSelectedIndexChanged="rbAdCategory_SelectedIndexChanged" AutoPostBack="true" runat="server">
                    <asp:ListItem Text="Goods" Value="goods"/>
                    <asp:ListItem Text="Services" Value="services"/>
                </asp:RadioButtonList>
                <hr />
                <h5>Select a sub-category</h5>
                <asp:DropDownList CssClass="form-control" ID="ddSubCategory" runat="server">
                </asp:DropDownList>
                <hr />
                <h5>Price</h5>
                <div class="row">
                <div class="col-lg-4">
                    <asp:TextBox CssClass="form-control" ID="txtPrice" placeholder="Eg. $25" runat="server"/>
                </div>
                <%--Might not need this code - radio buttons next to price --%>
                <%--<div class="col-lg-8 mt-2">
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                    <label class="form-check-label" for="inlineRadio1">Amount</label>
                    </div>
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                    <label class="form-check-label" for="inlineRadio1">Negotiable</label>
                    </div>
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <label class="form-check-label" for="inlineRadio2">Free</label>
                    </div>
                    <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                    <label class="form-check-label" for="inlineRadio3">Swap / Trade</label>
                    </div>
                </div>--%>

                </div>
                <br />
                <hr />
                <div class="form-group">
                <h5>Description</h5>
                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="txtDescription" rows="6" runat="server"/>
                <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="ddSubCategory"
                        runat="server" /> 
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
                <div class="row">
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload3" runat="server"/>
                        <label class="custom-file-label" for="FileUpload3">Choose file</label>
                    </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload4" runat="server"/>
                        <label class="custom-file-label" for="FileUpload4">Choose file</label>
                    </div>
                    </div>
                </div>
                </div>
                <div class="row">
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload5" runat="server"/>
                        <label class="custom-file-label" for="FileUpload5">Choose file</label>
                    </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="input-group mb-3">
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" ID="FileUpload6" runat="server"/>
                        <label class="custom-file-label" for="FileUpload6">Choose file</label>
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
        </div>
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
</asp:Content>
