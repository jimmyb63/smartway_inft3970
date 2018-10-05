<%@ Page Title="SmartWay - Payment" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SmartWay.UL.Views.Payment" %>
<%@ Import Namespace="SmartWay.BL.Models" %>
<%@ Import Namespace="SmartWay.DAL.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9 mt-2">
        <% int ID = Convert.ToInt32(Request.QueryString["advertisementID"]); %>
        <% AdvertisementControls AC = new AdvertisementControls();%>
        <% List<Advertisement> ad = AC.getAdvertisement(ID); %>
        <asp:HiddenField ID="adID" runat="server" />

<%--        <div class="row">
            <div class="col-lg-12">--%>
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <h5 class="card-title">Payment Options</h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <asp:Button ID="btnCash" Text="Cash on Pickup" CssClass="btn btn-success btn-block mb-2" runat="server" />
                            </div>
                            <div class="col-lg-3"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <div id="paypal-button-container" style="text-align:center"></div>
                            </div>
                            <div class="col-lg-3"></div>
                        </div>
                    </div>
                </div>
            <%--</div>
        </div>--%>

        <script>
            // Render the PayPal button

            paypal.Button.render({

                // Set your environment

                env: 'sandbox', // sandbox | production

                // Specify the style of the button

                style: {
                    label: 'pay',
                    size:  'medium', // small | medium | large | responsive
                    shape: 'rect',   // pill | rect
                    color: 'gold'   // gold | blue | silver | black
                },

                // PayPal Client IDs - replace with your own
                // Create a PayPal app: https://developer.paypal.com/developer/applications/create

                client: {
                    sandbox:    'AQfkSQdOaidsc5o-pVXxcLDhreLtWl_JMVXzKOjIPn4pkD3rM9oHao7cIh2Lb4ELucHlCjFMhsPrikNR',
                    production: '<insert production client id>'
                },

                // Show the buyer a 'Pay Now' button in the checkout flow
                commit: true,
        
                // Wait for the PayPal button to be clicked

                payment: function(data, actions) {
                    return actions.payment.create({
                        payment: {
                            transactions: [
                                {
                                    amount: { total: '<%=ad[0].advertisementPrice %>', currency: 'AUD' }
                                }
                            ]
                        }
                    });
                },

                // Wait for the payment to be authorized by the customer

                onAuthorize: function(data, actions) {
                    return actions.payment.execute().then(function() {
                        window.alert('Payment Complete!');
                    });
                }

            }, '#paypal-button-container');

        </script>
    </div>
</asp:Content>
