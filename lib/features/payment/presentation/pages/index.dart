import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zed_business/core/styles/buttons/primary_button.dart';

@RoutePage()
class PaymentPage extends ConsumerStatefulWidget {
  static var page;
  final double? ratePayment;

  const PaymentPage({super.key, required this.ratePayment});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  int? paymentSelected;
  String? selectedPaymentWay;
  bool? isRadioSelected = false;
  Color? backgroundColor = const Color.fromRGBO(200, 200, 200, 1);
  TextStyle? textStyle =
      const TextStyle(color: Color.fromARGB(255, 103, 103, 103));

  @override
  void initState() {
    super.initState();
    _validateUser(isRadioSelected!);
  }

  void _validateUser(bool value) {

    if (value) {
      setState(() {
        backgroundColor = Colors.red;
        textStyle = const TextStyle(color: Colors.white);
      });
    } else {
      setState(() {
        backgroundColor = const Color.fromRGBO(200, 200, 200, 1);
        textStyle = const TextStyle(color: Color.fromARGB(255, 103, 103, 103));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List services = [
      {
        "text": "Cash on delivery (COD/UPI)",
        "icon": "assets/svg/cash_icon.svg",
      },
      {
        "text": "Payment with Fund Wallet",
        "icon": "assets/svg/wallet_icon.svg",
      },
    ];

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (context, providerIndex) {
                    var service = services[providerIndex];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          paymentSelected = providerIndex;
                          selectedPaymentWay = services[providerIndex]['text'];
                          // print(paymentSelected);
                          // print(selectedPaymentWay);
                          isRadioSelected = true;
                          _validateUser(isRadioSelected!);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            service['icon'],
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            service['text'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Icon(
                            paymentSelected == providerIndex
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: paymentSelected == providerIndex
                                ? Colors.red
                                : Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Spacer(),
                Primarybutton(
                    backgroundColor: backgroundColor,
                    textStyle: textStyle,
                    buttonText: "Pay ₹${widget.ratePayment.toString()}",
                    onButtonPressed: () {}),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
              ],
            )),
      ),
    );
  } 
}
