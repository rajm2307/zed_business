import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

@RoutePage()
class TransactionDetailsPage extends ConsumerStatefulWidget {
  final String? userId;
  final String? userName;
  final double? amount;
  final double? emergencyFund;
  final DateTime? transactionDateTime;

  final String? status;

  TransactionDetailsPage({
    required this.userId,
    required this.userName,
    required this.amount,
    required this.emergencyFund,
    required this.transactionDateTime,
    required this.status,
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionDetailsPageState();
}

class _TransactionDetailsPageState
    extends ConsumerState<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User ID',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.userId!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    buildDetailRow(
                        'User Name', widget.userName! ?? "Sunny Kharwar"),
                    buildDetailRow(
                        'Amount', '₹${widget.amount!.toStringAsFixed(0)}'),
                    buildDetailRow(
                        'Emergency Fund',
                        '₹${widget.emergencyFund!.toStringAsFixed(0)}' ??
                            "1,45,890"),
                    buildDetailRow(
                        'Date',
                        DateFormat('yyyy-MM-dd')
                            .format(widget.transactionDateTime!)),
                    buildDetailRow('Time',
                        DateFormat('h:mm a').format(widget.transactionDateTime!)),
                    buildDetailRow('Status', widget.status!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create each row of details
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
