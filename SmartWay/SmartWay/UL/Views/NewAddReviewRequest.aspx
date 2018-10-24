<%@ Page Title="SmartWay - Add Review Request" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="NewAddReviewRequest.aspx.cs" Inherits="SmartWay.UL.Views.NewAddReviewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--
    This will capture the Reason for Adds to be reviewed
    
    @todo

    -Onclick Method
    -Method to add to the database
    -Tables in Database
    -Validation that a reason was selected
    -Decision on if we email the person making the report to let them know it was submitted??

-->
    <div class="col-lg-9 mt-2">
        <div class="p-2 mb-2 bg-danger text-white">Report Advertisement</div>
        <div class="card">
            <!------- Main Page Content Goes Here-------->
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h5>Thank you for taking the time to bring this to our attention.</h5>
                        <h6>Please fill out the below form to contact admin</h6>
                    </div>
                </div>
                <br />
                <div class="row align-items-center">
                    <div class="col-lg-4 col-12">
                        <p>Reason For Review Request: </p>
                    </div>
                    <div class="col-lg-8 col-12">
                        <asp:DropDownList CssClass="form-control" ID="ddlAddReviewReason" runat="server">
                            <asp:ListItem Enabled="true" Text="Please Choose the Best Reason" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Offensive Language" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Racist Messages" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Unappropriate Photos/ Nudity" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Cause the Cat made me" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Geoff said too" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row align-items-center">
                    <div class="col-lg-4">
                        <p>Please explain in more detail:</p>
                    </div>
                    <div class="col-lg-8">
                        <asp:TextBox CssClass="form-control" runat="server" ID="TextBox1" TextMode="MultiLine" Rows="10" /><br />
                        <asp:Button CssClass="btn btn-block btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>
