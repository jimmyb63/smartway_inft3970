<%@ Page Title="SmartWay - Contact us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SmartWay.UL.Views.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--A form that emails the admin--%>

    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">Contact Us</div>
        <div class="card">
            <div class="card-header">
                <p style="text-align:center">Got a question?</p>
                <p style="text-align:center">We'd love to hear from you. Send us a message and we'll respond as soon as possible</p>
            </div>
            <div class="card-body">
                <%-- ERROR SUMMARY --%>
                <asp:ValidationSummary
                    ID="ValidationSummaryContact"
                    runat="server"
                    ForeColor="Red"
                    ShowMessageBox="false"
                    HeaderText="Please fix these entries:" />
                <%-- FIRST NAME --%>
                <h6>First Name*</h6>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtFirstName" 
                    placeholder="First Name" 
                    runat="server" />
                <asp:RequiredFieldValidator 
                    ErrorMessage="First name required" 
                    ForeColor="Red" 
                    ControlToValidate="txtFirstName"
                    runat="server" />
                <%-- LAST NAME --%>
                <h6>Last Name*</h6>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtLastName" 
                    placeholder="Last Name" 
                    runat="server" />
                <asp:RequiredFieldValidator 
                    ErrorMessage="Last name required" 
                    ForeColor="Red" 
                    ControlToValidate="txtLastName"
                    runat="server" />
                <%-- EMAIL --%>
                <h6>Email*</h6>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtEmail" 
                    placeholder="Email address" 
                    runat="server" />
                <asp:RequiredFieldValidator 
                    ErrorMessage="Email required" 
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
                <%-- MESSAGE --%>
                <h6>Message*:</h6>
                <asp:TextBox 
                    CssClass="form-control" 
                    runat="server" 
                    ID="txtContent" 
                    TextMode="MultiLine" 
                    Rows="4" />
                <asp:RequiredFieldValidator
                    ErrorMessage="Message required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ControlToValidate="txtContent"
                    runat="server">
                </asp:RequiredFieldValidator>
                <br />
                <asp:Button 
                    Text="Submit" 
                    class="btn btn-success" 
                    runat="server" 
                    OnClick="contactAdmin" />
            </div>
        </div>
    </div>
</asp:Content>
