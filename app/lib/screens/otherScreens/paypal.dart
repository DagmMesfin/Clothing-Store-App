import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaypalPayment extends StatelessWidget {
  const PaypalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AYNraIHprwW3ExZshqa3XqWOxOwtoUIb0z3W1cPPFjAoszB8L0A0gRE0NgDbvSwH-esagnzE0s86llpc",
        secretKey:
            "EMaiz6T5kV8Cvsb8z3Inp10UKEGPz1x0_FuyNuO1pWwmeGKeRxgTVsW61PGgLZ2t9QV0yia06PK0ViAW",
        transactions: const [
          {
            "amount": {
              "total": '100',
              "currency": "USD",
              "details": {
                "subtotal": '100',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '10',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '12',
                  "currency": "USD"
                }
              ],

              // Optional
              //   "shipping_address": {
              //     "recipient_name": "Tharwat samy",
              //     "line1": "tharwat",
              //     "line2": "",
              //     "city": "tharwat",
              //     "country_code": "EG",
              //     "postal_code": "25025",
              //     "phone": "+00000000",
              //     "state": "ALex"
              //  },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    );
  }
}
