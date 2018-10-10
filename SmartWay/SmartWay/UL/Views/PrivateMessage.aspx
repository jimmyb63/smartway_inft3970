<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PrivateMessage.aspx.cs" Inherits="SmartWay.UL.Views.PrivateMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <%-- Main Page Content Goes Here--%>
        <div class="p-2 mb-2 bg-primary text-white">Contact Us</div>
        <div class="card">
            <div class="card-body">
                
                <p>Hello </p>
                <h5>First Name</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtFirstName" 
                    placeholder="First Name" 
                    runat="server" />
                
                <h5>Last Name</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtLastName" 
                    placeholder="Last Name" 
                    runat="server" />

                <h5>Email</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    ID="txtEmail" 
                    placeholder="Email address" 
                    runat="server" />
               
                <h5>Message:</h5>
                <asp:TextBox 
                    CssClass="form-control" 
                    runat="server" 
                    ID="txtContent" 
                    TextMode="MultiLine" 
                    Rows="5" />
                <br />
            </div>
        </div>
    </div>

</asp:Content>
