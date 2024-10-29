import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class MoneyTransferPage extends ConsumerStatefulWidget {
  TextEditingController amountController;
  String? selectedText;

  MoneyTransferPage({
    super.key,
    required this.amountController,
    required this.selectedText,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoneyTransferPagePageState();
}

class _MoneyTransferPagePageState extends ConsumerState<MoneyTransferPage> {
  @override
  void initState() {
    final route = ref.read(routeService);
    super.initState();

    Timer(const Duration(seconds: 200), () {
      if (mounted) {
        route.replace(HomeRoute(), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(32, 62, 76, 1),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/svg/successfull.json',
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
          Text(
            '₹${widget.amountController.text}',
            style: AppTextStyles.appTitleText(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            " ${widget.selectedText} transfer is\nSuccessfully Done! ",
            textAlign: TextAlign.center,
            style: AppTextStyles.appCaptionText(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w400)
                .copyWith(fontSize: 16),
          )
        ],
      )),
    );
  }
}
