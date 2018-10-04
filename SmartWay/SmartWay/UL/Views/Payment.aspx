<%@ Page Title="SmartWay - Payment" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SmartWay.UL.Views.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="paypal-button-container"></div>
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script>
    // Render the PayPal button
    paypal.Button.render({
    // Set your environment
    env: 'sandbox', // sandbox | production

    // Specify the style of the button
    style: {
        layout: 'vertical',  // horizontal | vertical
        size:   'medium',    // medium | large | responsive
        shape:  'rect',      // pill | rect
        color:  'gold'       // gold | blue | silver | white | black
    },

    // Specify allowed and disallowed funding sources
    //
    // Options:
    // - paypal.FUNDING.CARD
    // - paypal.FUNDING.CREDIT
    // - paypal.FUNDING.ELV
    funding: {
        allowed: [
        paypal.FUNDING.CARD,
        paypal.FUNDING.CREDIT
        ],
        disallowed: []
    },

    // PayPal Client IDs - replace with your own
    // Create a PayPal app: https://developer.paypal.com/developer/applications/create
    client: {
        sandbox: 'AcbhiCE6hFmURmhYy_uPbpkagJjfwqKOt20xO0SppbJ9ni6ar6Kve-0RinkIt7WQ4YtZsgs5ARDrvHxZ',
        production: '<insert production client id>'
    },

    payment: function (data, actions) {
        return actions.payment.create({
        payment: {
            transactions: [
            {
                amount: {
                total: '0.01',
                currency: 'USD'
                }
            }
            ]
        }
        });
    },

    onAuthorize: function (data, actions) {
        return actions.payment.execute()
        .then(function () {
            window.alert('Payment Complete!');
        });
    }
    }, '#paypal-button-container');
    </script>

    <div id="paypal-button"></div>
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script>
      paypal.Button.render({
        // Configure environment
        env: 'sandbox',
        client:
        {
            sandbox: 'AcbhiCE6hFmURmhYy_uPbpkagJjfwqKOt20xO0SppbJ9ni6ar6Kve-0RinkIt7WQ4YtZsgs5ARDrvHxZ',
            production: 'demo_production_client_id'
        },
        // Customize button (optional)
        locale: 'en_AU',
        style:
        {
          size: 'small',
          color: 'gold',
          shape: 'pill',
        },
        // Set up a payment
        payment: function (data, actions)
        {
            return actions.payment.create
            (
                {
                    transactions: [
                    {
                        amount:
                        {
                            total: '0.01',
                            currency: 'AUD'
                        }
                    }]
                }
            );
        },
        // Execute the payment
        onAuthorize: function (data, actions)
        {
            return actions.payment.execute().then
                (
                function ()
                    {
                        // Show a confirmation message to the buyer
                        window.alert('Thank you for your purchase!');
                    }
                );
        }
      }, '#paypal-button');

    </script>

    'intent':'sale',
    'redirect_urls':{
        'return_url':'http://localhost:3000/process',
        'cancel_url':'http://localhost:3000/cancel'
    },
    'payer':{
        'payment_method':'paypal'
    },
    'transactions':[{
        'amount':{
            'total':'10',
            'currency':'USD'
        },
        'payee':{
            'email': 'payee@test.com'
        },
        'description':'My amazing product'
    }]
}
</asp:Content>
