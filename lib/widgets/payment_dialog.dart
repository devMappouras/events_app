// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io';

// class Payment extends StatefulWidget {
//   @override
//   _PaymentState createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//   final plugin = PaystackPlugin();

//   bool _inProgress = false;
//   String? _cardNumber;
//   String? _cvv;
//   int? _expiryMonth;
//   int? _expiryYear;

//   @override
//   void initState() {
//     plugin.initialize(publicKey: '');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//           title: const Text(
//         'Paystack Example',
//       )),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Flexible(
//           flex: 2,
//           child: SizedBox(
//             width: double.infinity,
//             child: _getPlatformButton(
//               'Checkout',
//               () => _handleCheckout(context),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _handleCheckout(BuildContext context) async {
//     setState(() => _inProgress = true);
//     _formKey.currentState?.save();
//     Charge charge = Charge()
//       ..amount = 10000 // In base currency
//       ..email = 'customer@email.com'
//       ..card = _getCardFromUI();

//     charge.reference = _getReference();

//     try {
//       CheckoutResponse response = await plugin.checkout(
//         context,
//         method: CheckoutMethod.card,
//         charge: charge,
//         fullscreen: false,
//         logo: MyLogo(),
//       );
//       print('Response = $response');
//       setState(() => _inProgress = false);
//       _updateStatus(response.reference, '$response');
//     } catch (e) {
//       setState(() => _inProgress = false);
//       _showMessage("Check console for error");
//       rethrow;
//     }
//   }

//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }

//     return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
//   }

//   PaymentCard _getCardFromUI() {
//     // Using just the must-required parameters.
//     return PaymentCard(
//       number: _cardNumber,
//       cvc: _cvv,
//       expiryMonth: _expiryMonth,
//       expiryYear: _expiryYear,
//     );
//   }

//   Widget _getPlatformButton(String string, Function() function) {
//     // is still in progress
//     Widget widget;
//     if (Platform.isIOS) {
//       widget = CupertinoButton(
//         onPressed: function,
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         color: CupertinoColors.activeBlue,
//         child: Text(
//           string,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//       );
//     } else {
//       widget = ElevatedButton(
//         onPressed: function,
//         child: Text(
//           string.toUpperCase(),
//           style: const TextStyle(fontSize: 17.0),
//         ),
//       );
//     }
//     return widget;
//   }

//   _updateStatus(String? reference, String message) {
//     _showMessage('Reference: $reference \n\ Response: $message',
//         const Duration(seconds: 7));
//   }

//   _showMessage(String message,
//       [Duration duration = const Duration(seconds: 4)]) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(message),
//       duration: duration,
//       action: SnackBarAction(
//           label: 'CLOSE',
//           onPressed: () =>
//               ScaffoldMessenger.of(context).removeCurrentSnackBar()),
//     ));
//   }
// }

// class MyLogo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.black,
//       ),
//       alignment: Alignment.center,
//       padding: const EdgeInsets.all(10),
//       child: const Text(
//         "CO",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 13,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
