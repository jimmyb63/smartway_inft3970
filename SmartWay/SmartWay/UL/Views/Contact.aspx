<%@ Page Title="SmartWay - Contact us" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SmartWay.UL.Views.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--A form that emails the admin--%>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 mt-2">
                <div class="list-group"> <a href="PostAdvertisement.aspx" mt-2 class="btn btn-success">Post New Ad</a> 

            </div>
        </div>
        <div class="col-lg-9 mt-2">
            <div class="p-2 mb-2 bg-primary text-white">Contact Us</div>
            <div class="card">
            <div class="card-body">
                     <h2>Contact us</h2>
                    <p>Please fill out the below form to contact admin</p>
                <h5>First Name</h5>
                <asp:TextBox CssClass="form-control" ID="txtFirstName" placeholder="First Name" runat="server"/>
                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFirstName"
                        runat="server" />
                <h5>Last Name</h5>
                <asp:TextBox CssClass="form-control" ID="txtLastName" placeholder="Last Name" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLastName"
                runat="server" />
                <h5>Email</h5>
                <asp:TextBox CssClass="form-control" ID="txtEmail" placeholder="Email address" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                        ControlToValidate="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                <h5>Message:</h5>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtContent" TextMode="MultiLine" Rows="10" />
         <br />
                <asp:Button Text="Submit" class="btn btn-success" runat="server" OnClick="contactAdmin" />
            </div>
        </div>
    </div>
</div>
</div>
</asp:Content>
