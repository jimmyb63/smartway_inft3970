<%@ Page Title="SmartWay - Contact us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SmartWay.UL.Views.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--A form that emails the admin--%>

    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">Contact Us</div>
        <div class="card">
            <div class="card-body">
                <%-- ERROR SUMMARY --%>
                <asp:ValidationSummary
                    ID="ValidationSummaryContact"
                    runat="server"
                    ForeColor="Red"
                    ShowMessageBox="false"
                    HeaderText="Please fix these entries:" />
                <h2>Contact us</h2>
                <p>Please fill out the below form to contact admin</p>
                <%-- FIRST NAME --%>
                <h5>First Name*</h5>
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
                <h5>Last Name*</h5>
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
                <h5>Email*</h5>
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
                <h5>Message*:</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    runat="server" 
                    ID="txtContent" 
                    TextMode="MultiLine" 
                    Rows="10" />
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
