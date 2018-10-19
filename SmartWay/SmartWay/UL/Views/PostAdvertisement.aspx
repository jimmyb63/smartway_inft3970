<%@ Page Title="SmartWay - Post an Advertisement" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PostAdvertisement.aspx.cs" Inherits="SmartWay.UL.Views.PostAdvertisement" %>

<%@ Import Namespace="SmartWay.BL.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
       function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }
    </script>
            <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS_nOmu7Z5my3ELOiqHOgxrzOnoHfvJNU&libraries=places&callback=initAutocomplete" async defer></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if (Session["currentUser"] != null)
        {
            Person currentUser = new Person();
            currentUser = (Person)Session["currentUser"];
            int userID = currentUser.userID;%>

    <!------- Page Content -------->

    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-primary text-white">Post an Advertisement</div>
        <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">

                <%--  CHECKING ERROR SUMMARIES --%>
                <asp:ValidationSummary
                    ID="ValidationSummary1"
                    runat="server"
                    ForeColor="Red"
                    ShowMessageBox="false"
                    HeaderText="Please fix these entries:" />
                <%-- TITLE for the ad --%>
                <h5>Ad title*</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtTitle" 
                    placeholder="Eg. Weber Family 2 burner BBQ in great condition" 
                    runat="server" />
                <asp:RequiredFieldValidator
                    ErrorMessage="Title Required"
                    ForeColor="Red"
                    ControlToValidate="txtTitle"
                    runat="server">
                </asp:RequiredFieldValidator>
                <hr />

                <%-- TYPE of ad --%>
                <h5>Type of ad</h5>              
                <asp:RadioButtonList 
                    CssClass="form-group" 
                    ID="rbAdType" 
                    runat="server">
                    <asp:ListItem Text=" Offer" Value="offer" />
                    <asp:ListItem Text=" Request" Value="request" />
                </asp:RadioButtonList>
                <hr />       

                <%-- CATEGORY for the ad --%>
                <h5>Select a category</h5>
                <asp:RadioButtonList 
                    CssClass="form-group" 
                    ID="rbAdCategory" 
                    OnSelectedIndexChanged="rbAdCategory_SelectedIndexChanged" 
                    AutoPostBack="true" 
                    runat="server">
                    <asp:ListItem Text="Goods" Value="goods" />
                    <asp:ListItem Text="Services" Value="services" />
                </asp:RadioButtonList>
                <hr />

                <%-- SUB-CATEGORY for the ad --%>
                <h5>Select a sub-category*</h5>
                <asp:DropDownList 
                    CssClass="form-control" 
                    ID="ddSubCategory" 
                    runat="server" AutoPostBack="true">
                </asp:DropDownList>                
                <br />

                <%-- Required to pick a subcategory --%>
                <asp:RequiredFieldValidator
                    ErrorMessage="Sub-category Required"
                    ForeColor="Red"
                    ControlToValidate="ddSubCategory"
                    runat="server"
                    InitialValue="0"
                    Display="Dynamic"
                    CssClass="error"                    
                    ></asp:RequiredFieldValidator>
                <hr />

                <%-- PRICE for the ad --%>                
                <h5>Price*</h5>
                <div class="row">
                    <div class="col-lg-4">      
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                        </div>
                    <% if (ddSubCategory.SelectedValue == "free") %>
                    <% { %>
                        <asp:Textbox 
                        CssClass="form-control" 
                        ID="txtPriceFree" 
                        ReadOnly="true"
                        Text="0"
                        runat="server"/>                       
                    </div>
                    <% }
                        else
                        { %>
                    <asp:Textbox 
                        CssClass="form-control" 
                        ID="txtPrice"
                        runat="server"
                        placeholder="eg. 25"/>                       
                    </div>
                    <% } %>
                        
                        <%-- PRICE required --%>
                        <asp:RequiredFieldValidator
                            ErrorMessage="Price Required"
                            Display="Dynamic"
                            ForeColor="Red"
                            ControlToValidate="txtPrice"
                            runat="server"></asp:RequiredFieldValidator>

						<%-- ONLY NUMBERS --%>
						<asp:RegularExpressionValidator
							ID="PriceRegulator"
							runat="server"
							ErrorMessage="Numbers only."
							ForeColor="Red"
							ValidationExpression="^[0-9]*$"
							ControlToValidate="txtPrice">
						</asp:RegularExpressionValidator>
                    </div>
                </div>
                <br />
                <hr />

                <%-- DESCRIPTION for the ad --%>
                <div class="form-group">
                    <h5>Description</h5>
                    <asp:TextBox 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        ID="txtDescription" 
                        Rows="6" 
                        runat="server" />
                </div>
                <hr />
                <%-- PHOTOS for the ad --%>
                <h6>Upload Images - Image 1 will be displayed on the results page.</h6><br />
                <div class="row">
                    <div class="container">
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block mb-3">
                                        Select Image 1<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload1"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block mb-3">
                                        Select Image 2<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload2"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block mb-3">
                                        Select Image 3<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload3"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block mb-3">
                                        Select Image 4<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload4"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block mb-3">
                                        Select Image 5<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload5"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary btn-block mb-3">
                                        Select Image 6<asp:FileUpload
                                            CssClass="uploadFile img"
                                            ID="FileUpload6"
                                            runat="server"
                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <hr />
                    <%-- SUBMIT AD BUTTON --%>
                        <asp:Button 
							CssClass="btn btn-block btn-success" 
							Text="Submit" 
							runat="server" 
							OnClick="postAd"  
							UseSubmitBehavior="false" 
							OnClientClick="this.disabled='true'; this.value='Please wait...';" />
                        </div>
                    </div>
                </>
            </div>
            <div class="warning">
                <asp:Label Text="" ID="errorMessage" runat="server" />
            </div>
            <% }
                else
                {%>
            <div class="col-lg-9 order-lg-2">
                <div class="p-2 my-2 bg-danger text-white">Error - Please Login</div>
                <div class="jumbotron text-center mt-2">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h2>Please Login to Post a New Ad</h2><br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-8">
                                <a href="login.aspx" class="btn btn-block btn-info">Login</a><br />
                            </div>
                            <div class="col-lg-2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <p>Don't have an account? 
                                    <a href="Registration.aspx" 
                                        class="text-primary">
                                        Click Here to Register</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <% } %>
    </div>

</asp:Content>
