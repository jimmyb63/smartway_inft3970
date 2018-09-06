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
            <!-- First name textbox with validators -->
            <tr>
                <td>
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" text="First Name" runat="server" onclick="this.value='';"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFirstName"
                        runat="server" />
                </td>
            </tr>
            <!-- Last name textbox with validators -->
            <tr>
                <td>
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" text="Last Name" runat="server" onclick="this.value='';"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLastName"
                          runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number:
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" text="Phone Number" runat="server" onclick="this.value='';"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPhone"
                          runat="server" />
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
                    Street Number:
                </td>
                <td>
                    <asp:TextBox ID="txtStreetNumber" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtStreetNumber"
                        runat="server" />
                </td>
            </tr>
            <!-- Residential street name textbox with validators -->
            <tr>
                <td>
                    Street Name:
                </td>
                <td>
                    <asp:TextBox ID="txtStreetName" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtStreetName"
                        runat="server" />
                </td>
            </tr>
            <!-- Residential city textbox with validators -->
            <tr>
                <td>
                    City:
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtCity"
                        runat="server" />
                </td>
            </tr>
            <!-- Residential state textbox with validators -->
            <tr>
                <td>
                    State:
                </td>
                <td>
                    <asp:TextBox ID="txtState" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtState"
                        runat="server" />
                </td>
            </tr>
            <!-- Residential postcode textbox with validators -->
            <tr>
                <td>
                    Post Code:
                </td>
                <td>
                    <asp:TextBox ID="txtPostcode" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPostcode"
                        runat="server" />
                </td>
            </tr>
            <!-- Residential country textbox with validator -->
            <tr>
                <td>
                    Country:
                </td>
                <td>
                    <asp:TextBox ID="txtCountry" text="Australia" runat="server" onClick="this.value = 'Australia'" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPostcode"
                        runat="server" />
                </td>
            </tr>
            <!-- Password textbox with validators -->
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
                        runat="server" />
                </td>
            </tr>
            <!-- Confirm password textbox with validators -->
            <tr>
                <td>
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                        ControlToValidate="txtConfirmPassword" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <p>Please enter your Email and then press validate email,<br />
                        We will email you a code which you must input below for the registration to work.
                    </p>
                </td>
            </tr>
            <!-- Email address textbox with validators -->
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                        ControlToValidate="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                </td>
            </tr>
            <%--<tr>
                <td colspan="3">
                    <asp:Button ID="btnValidation" runat="server" Text="Send Validation Code" OnClick="sendValidation" />
                </td>
            </tr>--%>
            <tr>
                <td>
                    <p>Validation Code</p>
                </td>
                <td>
                    <asp:TextBox ID="tbxValidation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <!-- Submit button runs RegisterUser method when clicked -->
                <td>
                    <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" />
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
        <br />
    <div class="warning"><asp:Label Text="" ID="errorMessage" runat="server" /></div>
</asp:Content>
