import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class TransactionHistoryPage extends ConsumerStatefulWidget {
  static var page;
  final bool? isCommissionSelected;

  const TransactionHistoryPage({super.key, required this.isCommissionSelected});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionHistoryPageState();
}

class _TransactionHistoryPageState
    extends ConsumerState<TransactionHistoryPage> {
  // List of records with randomized data
// Declare both lists first

  List<Map<String, dynamic>> selectedTransactions = [];

  final List<Map<String, dynamic>> transactionsofCommission = [
    {
      'title': 'Bank Transfer',
      'date': DateTime.parse('2024-08-16 04:30:00'),
      'amount': 5500.0,
    },
    {
      'title': 'Self Transfer',
      'date': DateTime.parse('2024-07-22 03:30:00'),
      'amount': 2400.0,
    },
    {
      'title': 'Direct Transfer',
      'date': DateTime.parse('2024-09-05 06:30:00'),
      'amount': 7300.0,
    },
    {
      'title': 'Quick Pay',
      'date': DateTime.parse('2024-06-11 17:30:00'),
      'amount': 4600.0,
    },
    {
      'title': 'Cash Pickup',
      'date': DateTime.parse('2024-10-15 09:30:00'),
      'amount': 3500.0,
    },
  ];

  final List<Map<String, dynamic>> transactionsofFund = [
    {
      'title': 'Transfer to member wallet',
      'date': DateTime.parse('2024-08-16 04:30:00'),
      'amount': 5500.0,
    },
    {
      'title': 'Transfer to fund wallet',
      'date': DateTime.parse('2024-07-22 03:30:00'),
      'amount': 2400.0,
    },
    {
      'title': 'Transfer to self wallet',
      'date': DateTime.parse('2024-09-05 06:30:00'),
      'amount': 7300.0,
    },
    {
      'title': 'Transfer to fund wallet',
      'date': DateTime.parse('2024-06-11 17:30:00'),
      'amount': 4600.0,
    },
    {
      'title': 'Transfer to fund wallet',
      'date': DateTime.parse('2024-10-15 09:30:00'),
      'amount': 3500.0,
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize selectedTransactions based on widget.isCommissionSelected
    selectedTransactions = widget.isCommissionSelected!
        ? transactionsofCommission
        : transactionsofFund;
  }

  // // Helper function to generate random transactions
  // Map<String, dynamic> generateRandomTransaction() {
  //   final random = Random();
  //   final List<String> titles = [
  //     'Bank Transfer',
  //     'Self Transfer',
  //     'Direct Transfer',
  //     'Quick Pay',
  //     'Cash Pickup'
  //   ];
  //   final List<double> amounts = [5500, 2400, 7300, 4600, 3500];
  //   final DateTime randomDate = DateTime.now().subtract(Duration(
  //       days: random.nextInt(365),
  //       hours: random.nextInt(24),
  //       minutes: random.nextInt(60)));

  //   return {
  //     'title': titles[random.nextInt(titles.length)],
  //     'date': randomDate,
  //     'amount': amounts[random.nextInt(amounts.length)],
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: selectedTransactions.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png/emptyfile.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'No Transaction History',
                        style: AppTextStyles.appTitleText(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400)
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    for (var transaction in selectedTransactions)
                      buildTransactionCard(
                        transaction['title'],
                        transaction['date'],
                        transaction['amount'],
                      ),
                  ],
                ),
        ),
      ),
    );
  } // Widget to build each transaction section

  Widget buildTransactionCard(
    String title,
    DateTime date,
    double amount,
  ) {
    return GestureDetector(
      onTap: () {
        final route = ref.read(routeService);
        route.push(
            TransactionDetailsRoute(
              userId: 'ZP 563237',
              userName: "Sunny Kharwar",
              amount: amount,
              emergencyFund: 780000,
              transactionDateTime: date,
              status: "Success",
            ),
            context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and date section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.appCaptionText(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500)
                      .copyWith(fontSize: 16),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy').format(date),
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      DateFormat('h:mm a').format(date),
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Amount section
            Text(
              '₹${amount.toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
