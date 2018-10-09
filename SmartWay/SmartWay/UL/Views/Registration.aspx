<%@ Page Title="SmartWay - Register" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SmartWay.UL.Views.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../../Content/LoginRegStyle.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
        <div class="card mt-2">
            <div class="card-header">
                <div class="row my-2">
                    <div class="col-lg-12 text-center">
                        <h2 class="display-4">Register </h2>
                        <hr />
                        <p class="lead"><a href="Login.aspx">Already have an account?</a> </p>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row mt-2">
                    <div class="container">
                        <div class="row mt-2">
                            <div class="col-lg-12">
                                <div class="row mt-2">
                                    <div class="col-lg-12">
                                        <hr />
                                        <p class="lead">Basic Information</p>
                                        <div class="row mt-2">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-4">--%>
                                                        <label for="txtFirstName" class="mx-2">First name:</label>
                                                    <%--</div>
                                                    <div class="col-8">--%>
                                                        <asp:TextBox
                                                            ID="txtFirstName"
                                                            placeholder="*First Name"
                                                            runat="server"
                                                            CssClass="form-control mx-2" />

                                                        <!-- Validations for First Name: Required and Character Length Limit set to 50 -->
                                                        <!-- RegEx for Max Char length: https://www.aspsnippets.com/Articles/TextBox-Minimum-and-Maximum-Character-Length-Validation-using-ASPNet-RegularExpression-Validators.aspx -->
                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtFirstName"
                                                            runat="server" />

                                                        <asp:RegularExpressionValidator
                                                            ControlToValidate="txtFirstName"
                                                            ID="FirstNameLimit"
                                                            ValidationExpression="^[\s\S]{0,50}$"
                                                            runat="server"
                                                            Display="Dynamic"
                                                            ForeColor="Red"
                                                            ErrorMessage="Maximum 50 characters allowed." />
                                                        <!-- Last name textbox with validators -->
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-4">--%>
                                                        <label for="txtLastName" class="mx-2">Last name:</label>
                                                    <%--</div>
                                                    <div class="col-8">--%>
                                                        <asp:TextBox
                                                            ID="txtLastName"
                                                            placeholder="*Last Name"
                                                            runat="server"
                                                            CssClass="form-control mx-2" />
                                                        <!-- Validations for Last Name: Required and Char Length limit set to 50 -->
                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtLastName"
                                                            runat="server" />

                                                        <asp:RegularExpressionValidator
                                                            ControlToValidate="txtLastName"
                                                            ID="LastNameLimit"
                                                            ValidationExpression="^[\s\S]{0,50}$"
                                                            runat="server"
                                                            Display="Dynamic"
                                                            ForeColor="Red"
                                                            ErrorMessage="Maximum 50 characters allowed." />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-4">--%>
                                                        <label for="txtUsername" class="mx-2">Username:</label>
                                                    <%--</div>
                                                    <div class="col-8">--%>
                                                        <asp:TextBox
                                                            ID="txtUsername"
                                                            placeholder="Username"
                                                            runat="server"
                                                            CssClass="form-control mx-2" />
                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtUsername"
                                                            runat="server" />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-4">--%>
                                                        <label for="txtDOB" class="mx-2">Date of Birth:</label>
                                                    <%--</div>
                                                    <div class="col-8">--%>
                                                        <asp:TextBox
                                                            ID="txtDOB"
                                                            TextMode="Date"
                                                            runat="server"
                                                            placeholder="*Date Of Birth"
                                                            CssClass="form-control mx-2" />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg-6 offset-lg-3">
                                                <div class="imgUp">
                                                    <div class="imagePreview"></div>
                                                    <label class="btn btn-primary btn-block">
                                                        Select Profile Image<asp:FileUpload
                                                            CssClass="uploadFile img"
                                                            ID="FileUpload1"
                                                            runat="server"
                                                            Style="width: 0px;height: 0px;overflow: hidden" />
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-12">
                                    <hr />
                                    <p class="lead">Address Information</p>
                                    <!-- Residential street number textbox with validators -->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="txtUnitNumber" class="mx-2">Unit:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:TextBox
                                                        ID="txtUnitNumber"
                                                        placeholder="Unit number"
                                                        runat="server"
                                                        CssClass="form-control mx-2" />
                                                    <!-- Unit Number Validation: Numbers only and Character Length Limit (6) -->
                                                    <asp:RegularExpressionValidator
                                                        ControlToValidate="txtUnitNumber"
                                                        ID="UnitNumberValidation"
                                                        ValidationExpression="^\d{1,6}$"
                                                        ErrorMessage="Numbers only."
                                                        runat="server"
                                                        Display="Dynamic"
                                                        ForeColor="Red" />
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="txtStreetNumber" class="mx-2">Number:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:TextBox
                                                        ID="txtStreetNumber"
                                                        placeholder="*Street number"
                                                        runat="server"
                                                        CssClass="form-control mx-2" />
                                                    <br />
                                                    <asp:RequiredFieldValidator
                                                        ErrorMessage="Required"
                                                        ForeColor="Red"
                                                        ControlToValidate="txtStreetNumber"
                                                        runat="server" />

                                                    <!-- Format: numbers from 0-9 and max 6 characters -->
                                                    <asp:RegularExpressionValidator
                                                        ControlToValidate="txtStreetNumber"
                                                        ID="StreetNumberValidation"
                                                        ValidationExpression="^\d{1,6}$"
                                                        ErrorMessage="Numbers only."
                                                        runat="server"
                                                        Display="Dynamic"
                                                        ForeColor="Red" />
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="txtStreetName" class="mx-2">Name:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:TextBox
                                                        ID="txtStreetName"
                                                        placeholder="*Street name"
                                                        runat="server"
                                                        CssClass="form-control mx-2" />
                                                    <br />
                                                    <asp:RequiredFieldValidator
                                                        ErrorMessage="Required"
                                                        ForeColor="Red"
                                                        ControlToValidate="txtStreetName"
                                                        runat="server" />
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="txtCity" class="mx-2">City:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:TextBox
                                                        ID="txtCity"
                                                        placeholder="*City"
                                                        runat="server"
                                                        CssClass="form-control mx-2" />
                                                    <br />
                                                    <!-- City Validation: Required, Character Limit (max 100) -->
                                                    <asp:RequiredFieldValidator
                                                        ErrorMessage="Required"
                                                        ForeColor="Red"
                                                        ControlToValidate="txtCity"
                                                        runat="server" />

                                                    <asp:RegularExpressionValidator
                                                        ControlToValidate="txtCity"
                                                        ID="StreetValidation"
                                                        ValidationExpression="^[\s\S]{0,100}$"
                                                        ErrorMessage="Max 100 characters."
                                                        runat="server"
                                                        Display="Dynamic"
                                                        ForeColor="Red" />
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="ddState" class="mx-2">State:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:DropDownList
                                                        ID="ddState"
                                                        runat="server"
                                                        CssClass="form-control mx-2">
                                                        <asp:ListItem Enabled="true" Text="Select State" Value="-1"></asp:ListItem>
                                                        <asp:ListItem Text="NSW" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="QLD" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="WA" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="VIC" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="SA" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="NT" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="TAS" Value="7"></asp:ListItem>
                                                        <asp:ListItem Text="ACT" Value="8"></asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:RequiredFieldValidator
                                                        ErrorMessage="Must select state"
                                                        InitialValue="-1"
                                                        ForeColor="Red"
                                                        ControlToValidate="ddState"
                                                        runat="server" />
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="txtPostcode" class="mx-2">Postcode:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:TextBox
                                                        ID="txtPostcode"
                                                        runat="server"
                                                        Placeholder="*Postcode"
                                                        CssClass="form-control mx-2" />
                                                    <br />
                                                    <%-- Validations for Postcode: Required, RegEx for Australia --%>
                                                    <asp:RegularExpressionValidator ID="PostcodeValidation" runat="server"
                                                        ControlToValidate="txtPostcode"
                                                        ValidationExpression="^(0[289][0-9]{2})|([1345689][0-9]{3})|(2[0-8][0-9]{2})|(290[0-9])|(291[0-4])|(7[0-4][0-9]{2})|(7[8-9][0-9]{2})$"
                                                        ErrorMessage="Invalid postcode"
                                                        Display="None">
                                                    </asp:RegularExpressionValidator>
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <%--<div class="col-2">--%>
                                                    <label for="txtCountry" class="mx-2">Country:</label>
                                                <%--</div>
                                                <div class="col-10">--%>
                                                    <asp:TextBox
                                                        IsReadOnly="True"
                                                        ID="txtCountry"
                                                        value="Australia"
                                                        runat="server"
                                                        onClick="this.value = 'Australia'"
                                                        CssClass="form-control mx-2" />
                                                    <br />
                                                    <asp:RequiredFieldValidator
                                                        ErrorMessage="Required"
                                                        ForeColor="Red"
                                                        ControlToValidate="txtCountry"
                                                        runat="server" />
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-12">
                                        <hr />
                                        <p class="lead">Personal Information</p>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-2">--%>
                                                        <label for="txtEmail" class="mx-2">Email:</label>
                                                    <%--</div>
                                                    <div class="col-10">--%>
                                                        <asp:TextBox
                                                            ID="txtEmail"
                                                            placeholder="*Email address"
                                                            runat="server"
                                                            CssClass="form-control mx-2" />
                                                        <br />
                                                        <!-- Email Validation: Required, Email RegEx -->
                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            Display="Dynamic"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtEmail"
                                                            runat="server" />

                                                        <asp:RegularExpressionValidator
                                                            runat="server"
                                                            Display="Dynamic"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ControlToValidate="txtEmail"
                                                            ForeColor="Red"
                                                            ErrorMessage="Invalid email address." />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-2">--%>
                                                        <label for="txtPhone" class="mx-2">Phone:</label>
                                                    <%--</div>
                                                    <div class="col-10">--%>
                                                        <asp:TextBox
                                                            ID="txtPhone"
                                                            placeholder="*Phone Number"
                                                            runat="server"
                                                            CssClass="form-control mx-2" />
                                                        <br />
                                                        <!-- Validations for Phone Number: Required, Character Length Limit and only numbers + certain symbols (RegEx) -->
                                                        <!--  Phone number validation from: https://manual.limesurvey.org/Using_regular_expressions#Important:_Regular_Expressions_in_conditions -->

                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtPhone"
                                                            runat="server" />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-2">--%>
                                                        <label for="txtPassword" class="mx-2">Password:</label>
                                                    <%--</div>
                                                    <div class="col-10">--%>
                                                        <asp:TextBox
                                                            ID="txtPassword"
                                                            placeholder="*Password"
                                                            runat="server"
                                                            TextMode="Password"
                                                            CssClass="form-control mx-2" />
                                                        <br />
                                                        <!-- Password Validation: Required, Min Char Length + Min 1 Number + Min 1 Uppercase + Min Lowercase-->
                                                        <!--  https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a -->

                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtPassword"
                                                            runat="server" />

                                                        <asp:RegularExpressionValidator
                                                            ControlToValidate="txtPassword"
                                                            ID="PasswordValidation"
                                                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                                                            ErrorMessage="Min 8 characters, including Uppercase letter and a number."
                                                            runat="server"
                                                            Display="Dynamic"
                                                            ForeColor="Red" />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <%--<div class="col-2">--%>
                                                        <label for="txtConfirmPassword" class="mx-2">Confirm Password:</label>
                                                    <%--</div>
                                                    <div class="col-10">--%>
                                                        <asp:TextBox
                                                            ID="txtConfirmPassword"
                                                            placeholder="*Confirm password"
                                                            runat="server"
                                                            TextMode="Password"
                                                            CssClass="form-control mx-2" />
                                                        <br />
                                                        <!-- Compares both password fields and checks if they are the same -->
                                                        <asp:RequiredFieldValidator
                                                            ErrorMessage="Required"
                                                            ForeColor="Red"
                                                            ControlToValidate="txtConfirmPassword"
                                                            runat="server" />

                                                        <asp:CompareValidator
                                                            ErrorMessage="Passwords do not match."
                                                            ForeColor="Red"
                                                            ControlToCompare="txtConfirmPassword"
                                                            ControlToValidate="txtPassword"
                                                            runat="server" />
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row mt-2">
                            <%--<div class="col-sm">
                                <hr />
                            </div>--%>
                            <div class="col-lg-12 text-center">
                                <hr />
                                <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" CssClass="btn btn-primary btn-block" />
                            </div>
                            <%--<div class="col-sm">
                                <hr />
                            </div>--%>
                        </div>
            </div>
        </div>
        <br />
        <br />
        <div class="warning">
            <asp:Label Text="" ID="errorMessage" runat="server" />
        </div>
    </div>
</asp:Content>
