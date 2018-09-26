<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.PostAdvertisement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
        <div class="col-lg-3 mt-2">
            <div class="list-group mt-2"> <a href="PostAdvertisement.aspx" class="btn btn-success">Post New Ad</a> 
            <!-- Shown on md and down devices (turns list groups into dropdown buttons for mobile) -->
            <div class="dropdown mt-2">
                <button class="btn btn-primary d-lg-none btn-block dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Browse Goods </button>
                <div class="dropdown-menu btn-block" aria-labelledby="dropdownMenuButton"> 
                    <a href="ViewAdvertisementList.aspx?subCategory=free" class="dropdown-item">Free</a> 
                    <a href="ViewAdvertisementList.aspx?subCategory=household" class="dropdown-item">Household</a> 
                    <a href="ViewAdvertisementList.aspx?subCategory=electronics" class="dropdown-item">Electronics</a> 
                    <a href="ViewAdvertisementList.aspx?subCategory=outdoor" class="dropdown-item">Outdoor</a> 
                    <a href="ViewAdvertisementList.aspx?subCategory=sporting" class="dropdown-item">Sporting</a>
                    <a href="ViewAdvertisementList.aspx?subCategory=automotive" class="dropdown-item">Automotive</a>
                    <a href="ViewAdvertisementList.aspx?subCategory=baby/child" class="dropdown-item">Baby/Child</a>
                    <a href="ViewAdvertisementList.aspx?subCategory=clothing" class="dropdown-item">Clothing</a>
                    <a href="ViewAdvertisementList.aspx?subCategory=tools" class="dropdown-item">Tools</a>
                    <a href="ViewAdvertisementList.aspx?subCategory=other" class="dropdown-item">Other</a> 
                </div>
            </div>
            <div class="dropdown mt-2">
                <button class="btn btn-primary d-lg-none btn-block dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Browse Services </button>
                <div class="dropdown-menu btn-block" aria-labelledby="dropdownMenuButton"> 
                    <a href="ViewAdvertisementList.aspx?subCategory=labour" class="dropdown-item">Labour</a> 
                    <a href="ViewAdvertisementList.aspx?subCategory=tools required" class="dropdown-item">Tools Required</a> 
                    <a href="ViewAdvertisementList.aspx?subCategory=skills required" class="dropdown-item">Skills Required</a>
                </div>
            </div>
        
            <!--Only shown on lg devices (turns dropdown buttons into list group in sidebar-->
            <div class="list-group d-none d-lg-block"> 
                <a href="ViewAdvertisementList.aspx?category=goods" class="list-group-item disabled"><h6>Browse Goods</h6></a> 
                <a href="ViewAdvertisementList.aspx?subCategory=free" class="list-group-item">Free</a> 
                <a href="ViewAdvertisementList.aspx?subCategory=household" class="list-group-item">Household</a> 
                <a href="ViewAdvertisementList.aspx?subCategory=electronics" class="list-group-item">Electronics</a> 
                <a href="ViewAdvertisementList.aspx?subCategory=outdoor" class="list-group-item">Outdoor</a> 
                <a href="ViewAdvertisementList.aspx?subCategory=sporting" class="list-group-item">Sporting</a>
                <a href="ViewAdvertisementList.aspx?subCategory=automotive" class="list-group-item">Automotive</a>
                <a href="ViewAdvertisementList.aspx?subCategory=baby/child" class="list-group-item">Baby/Child</a>
                <a href="ViewAdvertisementList.aspx?subCategory=clothing" class="list-group-item">Clothing</a>
                <a href="ViewAdvertisementList.aspx?subCategory=tools" class="list-group-item">Tools</a>
                <a href="ViewAdvertisementList.aspx?subCategory=other" class="list-group-item">Other</a>
            </div>
            <br/>
            <div class="list-group d-none d-lg-block"> 
                <a href="ViewAdvertisementList.aspx?category=services" class="list-group-item disabled"><h6>Browse Services</h6></a> 
                <a href="ViewAdvertisementList.aspx?subCategory=labour" class="list-group-item">Labour</a> 
                <a href="ViewAdvertisementList.aspx?subCategory=tools required" class="list-group-item">Tools Required</a> 
                <a href="ViewAdvertisementList.aspx?subCategory=skills required" class="list-group-item">Skills Required</a>
            </div>
            </div>
        </div>
    <!--/Sidebar Content -->
	  
    <!----------------------------------------------------------------------------------------------------------------> 
 
    <!-- Page Content -->
        <div class="col-lg-9 mt-2">
            <div class="p-2 mb-2 bg-primary text-white">Post an Ad</div>
            <div class="card">
            <div class="card-body">
                <h5>Ad title</h5>
                <asp:TextBox CssClass="form-control" ID="txtTitle" placeholder="Eg. Weber Family 2 burner BBQ in great condition" runat="server" />
                <hr />
                <h5>Type of ad</h5>
                <asp:RadioButtonList CssClass="form-group" ID="rbAdType" runat="server">
                    <asp:ListItem Text="Offer" Value="offer"/>
                    <asp:ListItem Text="Request" Value="request"/>
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
        </div>
    </div>
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
    <footer class="py-2 bg-primary">
        <div class="container">
        <p class="m-0 text-center text-white">Copyright SmartWay 2018</p>
        </div>
    </footer>
</asp:Content>
