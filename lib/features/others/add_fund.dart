import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class AddFundPaymentPage extends ConsumerStatefulWidget {
  AddFundPaymentPage({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddFundPaymentPageState();
}

class _AddFundPaymentPageState extends ConsumerState<AddFundPaymentPage> {
  final TextEditingController _amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.only(
                        top: 45, bottom: 45, right: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/svg/google_pay.json',
                            width: 140,
                            height: 57,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          'Note :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'To complete your payment, just choose one of the methods listed below and proceed with your payment. Please note that some method may incur additional costs.',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 117, 117, 117)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        TextField(
                          controller: _amountcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: Text(
                                '₹',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'Enter Amount',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          'Request money to your fund wallet and make one click payment.',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        Text(
                          'Payment Methods',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PaymentMethodIcon(
                                'GPay', 'assets/svg/today_paid_team_graph.svg'),
                            PaymentMethodIcon('Paytm',
                                'assets/svg/today_paid_team_graph.svg'),
                            PaymentMethodIcon('PhonePe',
                                'assets/svg/today_paid_team_graph.svg'),
                            PaymentMethodIcon(
                                'UPI', 'assets/svg/today_paid_team_graph.svg'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodIcon extends StatelessWidget {
  final String label;
  String imagePath;

  PaymentMethodIcon(this.label, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              print("object");
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                imagePath,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            )),
        SizedBox(height: 10),
      ],
    );
  }
}
