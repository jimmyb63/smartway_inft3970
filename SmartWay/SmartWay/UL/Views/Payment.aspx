<%@ Page Title="SmartWay - Payment" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SmartWay.UL.Views.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script>
        paypal.Button.render({
        
            // Set your environment

            env: 'sandbox', // sandbox | production

            // Specify the style of the button

            style: {
                label: 'checkout',  // checkout | credit | pay | buynow | generic
                size:  'responsive', // small | medium | large | responsive
                shape: 'pill',   // pill | rect
                color: 'gold'   // gold | blue | silver | black
            },

            // PayPal Client IDs - replace with your own
            // Create a PayPal app: https://developer.paypal.com/developer/applications/create

            client: {
                sandbox: 'AQfkSQdOaidsc5o-pVXxcLDhreLtWl_JMVXzKOjIPn4pkD3rM9oHao7cIh2Lb4ELucHlCjFMhsPrikNR',
                production: '<insert production client id>'
            },

            // Wait for the PayPal button to be clicked

            payment: function(data, actions) {
                return actions.payment.create({
                    payment: {
                        transactions: [
                            {
                                amount: { total: '0.01', currency: 'AUD' }
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="paypal-button-container"></div>
</asp:Content>
