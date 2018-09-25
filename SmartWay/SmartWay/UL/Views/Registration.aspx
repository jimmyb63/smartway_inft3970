<%@ Page Title="SmartWay - Register" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SmartWay.UL.Views.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/LoginRegStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron-fluid text-center">
        <h2 class="display-4">Register </h2>
        <p class="lead"><a href="Login.aspx">Already have an account?</a> </p>
    </div>
    <div class="container text-center">
        <div class="row">
            <div class="col-sm">
                <p class="lead">Basic Information</p>
                <asp:TextBox
                    ID="txtUsername"
                    placeholder="Username"
                    runat="server"
                    CssClass="txtbox"/>
                <br />
                <asp:RequiredFieldValidator
                    ErrorMessage="Required"
                    ForeColor="Red"
                    ControlToValidate="txtUsername"
                    runat="server" />

                <br />
                <asp:TextBox
                    ID="txtFirstName"
                    placeholder="*First Name"
                    runat="server"
                    CssClass="txtbox" />
                <br />

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
                <br />
                <!-- Last name textbox with validators -->

                <asp:TextBox
                    ID="txtLastName"
                    placeholder="*Last Name"
                    runat="server"
                    CssClass="txtbox" />
                <br />
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

                <br />
                <asp:TextBox
                    ID="txtDOB"
                    TextMode="Date"
                    runat="server"
                    CssClass="txtbox" />
                <br />

                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDOB" runat="server" />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="loginButton" />
                <br />

            </div>
            <div class="col-sm">
                <p class="lead">Address Information</p>
                <!-- Residential street number textbox with validators -->

                <asp:TextBox
                    ID="txtUnitNumber"
                    placeholder="Unit number"
                    runat="server"
                    CssClass="txtbox" />
                <br />
                <!-- Unit Number Validation: Numbers only and Character Length Limit (6) -->
                <asp:RegularExpressionValidator
                    ControlToValidate="txtUnitNumber"
                    ID="UnitNumberValidation"
                    ValidationExpression="^\d{1,6}$"
                    ErrorMessage="Numbers only."
                    runat="server"
                    Display="Dynamic"
                    ForeColor="Red" />
                <br />
                <!-- Residential street number textbox with validators -->

                <!-- Street Number Validation: Required, Numbers only, Character Lenght Limit -->
                <asp:TextBox
                    ID="txtStreetNumber"
                    placeholder="*Street number"
                    runat="server"
                    CssClass="txtbox" />
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

                <!-- Residential street name textbox with validators -->
                <br />
                <asp:TextBox
                    ID="txtStreetName"
                    placeholder="*Street name"
                    runat="server"
                    CssClass="txtbox" />
                <br />
                <asp:RequiredFieldValidator
                    ErrorMessage="Required"
                    ForeColor="Red"
                    ControlToValidate="txtStreetName"
                    runat="server" />

                <!-- Residential city textbox with validators -->
                <br />
                <asp:TextBox
                    ID="txtCity"
                    placeholder="*City"
                    runat="server"
                    CssClass="txtbox" />
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

                <!-- Residential state textbox with validators -->
                <br />
                <asp:DropDownList
                    ID="ddState"
                    runat="server"
                    CssClass="txtbox">
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

                <%-- Residential Postcode textbox with validators --%>
                <br />
                <asp:TextBox
                    ID="txtPostcode"
                    runat="server"
                    Placeholder="*Postcode"
                    CssClass="txtbox" />
                <br />
                <%-- Validations for Postcode: Required, RegEx for Australia --%>
                <asp:RegularExpressionValidator ID="PostcodeValidation" runat="server"
                    ControlToValidate="txtPostcode"
                    ValidationExpression="^(0[289][0-9]{2})|([1345689][0-9]{3})|(2[0-8][0-9]{2})|(290[0-9])|(291[0-4])|(7[0-4][0-9]{2})|(7[8-9][0-9]{2})$"
                    ErrorMessage="Invalid postcode"
                    Display="None">
                    </asp:RegularExpressionValidator>

                <!-- Residential country textbox with validator -->
                <br />
                <!-- Sets Country textbox to read only, means that the user cannot edit -->
                <asp:TextBox
                    IsReadOnly="True"
                    ID="txtCountry"
                    value="Australia"
                    runat="server"
                    onClick="this.value = 'Australia'"
                    CssClass="txtbox" />
                <br />
                <asp:RequiredFieldValidator
                    ErrorMessage="Required"
                    ForeColor="Red"
                    ControlToValidate="txtCountry"
                    runat="server" />


                <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" CssClass="loginButton" />
                <br />
                </div>
            <div class="col-sm">
                    <p class="lead">Personal Information</p>


                    <!-- Email address textbox with validators -->
                    <asp:TextBox
                        ID="txtEmail"
                        placeholder="*Email address"
                        runat="server"
                        CssClass="txtbox" />
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

                    <br />
                    <asp:TextBox
                        ID="txtPhone"
                        placeholder="*Phone Number"
                        runat="server"
                        CssClass="txtbox" />
                    <br />
                    <!-- Validations for Phone Number: Required, Character Length Limit and only numbers + certain symbols (RegEx) -->
                    <!--  Phone number validation from: https://manual.limesurvey.org/Using_regular_expressions#Important:_Regular_Expressions_in_conditions -->

                    <asp:RequiredFieldValidator
                        ErrorMessage="Required"
                        ForeColor="Red"
                        ControlToValidate="txtPhone"
                        runat="server" />
                    <!-- Password textbox with validators -->
                    <br />

                    <asp:TextBox
                        ID="txtPassword"
                        placeholder="*Password"
                        runat="server"
                        TextMode="Password"
                        CssClass="txtbox" />
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

                    <!-- Confirm password textbox with validators -->

                    <br />
                    <asp:TextBox
                        ID="txtConfirmPassword"
                        placeholder="*Confirm password"
                        runat="server"
                        TextMode="Password"
                        CssClass="txtbox" />
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
                    <br />
                    <!-- Submit button runs RegisterUser method when clicked -->
                    <br />

                </div>               
        </div>
    </div>
    <br />
    <br />
    <div class="warning">
        <asp:Label Text="" ID="errorMessage" runat="server" />
    </div>
</asp:Content>
