import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class PaymentPage extends ConsumerStatefulWidget {
  static var page;
  final int? ratePayment;

  const PaymentPage({super.key, required this.ratePayment});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  bool? paymentSelected = false;
  @override
  Widget build(BuildContext context) {
    final List services = [
      {
        "text": "Cash on delivery (COD/UPI)",
        "icon": "assets/svg/ph_qr-code-fill.svg",
      },
      {
        "text": "Payment with Fund Wallet",
        "icon": "assets/svg/solar_user-id-bold.svg",
      },
    ];

    return Scaffold(
      body: SizedBox(
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
                          paymentSelected = true;
                        });
                      },
                      child: ListTile(
                        minVerticalPadding: 10,
                        leading: SvgPicture.asset(
                          service['icon'],
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        title: Row(
                          children: [
                            Text(
                              service['text'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            Icon(
                              paymentSelected == true
                                  ? Icons.circle_outlined
                                  : Icons.check_circle_rounded,
                              size: 25,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  } // Widget to build each transaction section
}
