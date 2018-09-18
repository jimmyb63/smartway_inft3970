<%@ Page Title="SmartWay - Register" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SmartWay.UL.Views.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
            <tr>
                <th colspan="3">
                    <h2>Registration</h2>
                </th>
            </tr>
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <asp:TextBox
                        ID="txtUsername" 
                        placeholder="Username" 
                        runat="server">
                    </asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtUsername" 
                        runat="server" />                   
                </td>
            </tr>
          <!-- First name textbox with validators -->
            <tr>
                <td>
                    *First Name:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtFirstName" 
                        placeholder="First Name" 
                        runat="server"/>
                </td>
                <td>
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
                </td>
            </tr>
            <!-- Last name textbox with validators -->
            <tr>
                <td>
                    *Last Name:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtLastName" 
                        placeholder="Last Name" 
                        runat="server" />
                </td>
                <td>
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
                        ErrorMessage="Maximum 50 characters allowed."
                        />
                </td>
            </tr>
            <tr>
                <td>
                    Date of Birth:
                </td>
                <td>
                    <asp:TextBox ID="txtDOB" TextMode="Date" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDOB" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    *Phone Number:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtPhone" 
                        placeholder="Phone Number" 
                        runat="server" />
                </td>
                <td>
                    <!-- Validations for Phone Number: Required, Character Length Limit and only numbers + certain symbols (RegEx) -->
                    <!--  Phone number validation from: https://manual.limesurvey.org/Using_regular_expressions#Important:_Regular_Expressions_in_conditions -->
                    
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtPhone"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Profile picture:
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="3"><hr /></td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>
                <th colspan="3">
                    Address
                </th>
            </tr>
            <!-- Residential street number textbox with validators -->
            <tr>
                <td>
                    Unit Number:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtUnitNumber" 
                        placeholder="Unit number" 
                        runat="server" />
                </td>
                <td>
                    <!-- Unit Number Validation: Numbers only and Character Length Limit (6) -->
                    <asp:RegularExpressionValidator
                        ControlToValidate="txtUnitNumber"
                        ID="UnitNumberValidation"
                        ValidationExpression="^\d{1,6}$"
                        ErrorMessage="Numbers only."
                        runat="server"
                        Display="Dynamic"
                        ForeColor="Red" />
                </td>
            </tr>
            <!-- Residential street number textbox with validators -->
            <tr>
                <td>
                    *Street Number:
                </td>
                <td>
                    <!-- Street Number Validation: Required, Numbers only, Character Lenght Limit -->
                    <asp:TextBox 
                        ID="txtStreetNumber" 
                        placeholder="Street number" 
                        runat="server" />
                </td>
                <td>
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
                </td>
            </tr>
            <!-- Residential street name textbox with validators -->
            <tr>
                <td>
                    *Street Name:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtStreetName" 
                        placeholder="Street name" 
                        runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtStreetName"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    *Post Code:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtPostcode" 
                        placeholder="Post Code" 
                        runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtPostcode"
                        runat="server" />
                </td>
            </tr>
            <!-- Residential city textbox with validators -->
            <tr>
                <td>
                    *City:
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtCity" 
                        placeholder="City" 
                        runat="server" />
                </td>
                <td>
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
                </td>
            </tr>
            <!-- Residential state textbox with validators -->
            <tr>
                <td>
                    *State:
                </td>
                <td>
                    <asp:DropDownList 
                        ID="ddState" 
                        runat="server">
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
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Must select state"
                        InitialValue="-1" 
                        ForeColor="Red" 
                        ControlToValidate="ddState"
                        runat="server" />
                </td>
            </tr>
<<<<<<< HEAD
=======
            <%-- Residential Postcode textbox with validators --%>
            <tr>
                <td>
                    *Postcode
                </td>
                <td>
                <asp:TextBox 
                    ID="txtPostcode" 
                    runat="server"
                    Placeholder="Postcode"/>
                </td>
                <%-- Validations for Postcode: Required, RegEx for Australia --%>
                    <asp:RegularExpressionValidator ID="PostcodeValidation" runat="server" 
                        ControlToValidate="txtPostcode" 
                        ValidationExpression="^(0[289][0-9]{2})|([1345689][0-9]{3})|(2[0-8][0-9]{2})|(290[0-9])|(291[0-4])|(7[0-4][0-9]{2})|(7[8-9][0-9]{2})$"
                        ErrorMessage="Invalid postcode"
                        Display="None">
                    </asp:RegularExpressionValidator>
            </tr>
>>>>>>> 443c11c16747d602ee83d6cdc710c289ffacdb1b
            <!-- Residential country textbox with validator -->
            <tr>
                <td>
                    Country:
                </td>
                <td>
                    <!-- Sets Country textbox to read only, means that the user cannot edit -->
                    <asp:TextBox
                        IsReadOnly="True" 
                        ID="txtCountry" 
                        value="Australia" 
                        runat="server" 
                        onClick="this.value = 'Australia'" />
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="Required" 
                        ForeColor="Red" 
                        ControlToValidate="txtCountry"
                        runat="server" />
                </td>
            </tr>
            <!-- Email address textbox with validators -->
            <tr>
                <td>
                    *Email
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtEmail" 
                        placeholder="Email address" 
                        runat="server" />
                </td>
                <td>
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
                </td>
            </tr>
            <!-- Password textbox with validators -->
            <tr>
                <td>
                    *Password
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtPassword" 
                        placeholder="Password" 
                        runat="server" 
                        TextMode="Password" />
                </td>
                <td>
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
                </td>
            </tr>
            <!-- Confirm password textbox with validators -->
            <tr>
                <td>
                    *Confirm Password
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtConfirmPassword" 
                        placeholder="Confirm password" 
                        runat="server" 
                        TextMode="Password" />
                </td>
                <td>
                    <!-- Compares both password fields and checks if they are the same -->
                    <asp:RequiredFieldValidator
                        ErrorMessage="Required"
                        ForeColor="Red"
                        ControlToValidate="txtConfirmPassword"
                        runat="server"/>

                    <asp:CompareValidator 
                        ErrorMessage="Passwords do not match." 
                        ForeColor="Red" 
                        ControlToCompare="txtConfirmPassword"
                        ControlToValidate="txtPassword" 
                        runat="server" />
                </td>
            </tr>
            <tr>
                <!-- Submit button runs RegisterUser method when clicked -->
                <td>
                    <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" />
<<<<<<< HEAD
                </td>
            </tr>
=======
                </td>                
        </tr>
>>>>>>> 443c11c16747d602ee83d6cdc710c289ffacdb1b
        </table>
        <br />
        <br />
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
</asp:Content>
