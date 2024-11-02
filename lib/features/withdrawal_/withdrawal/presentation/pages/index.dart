import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/buttons/primary_button.dart';
import 'package:zed_business/features/withdrawal_/transactionHistory/presentation/pages/index.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class WithdrawalPage extends ConsumerStatefulWidget {
  static var page;

  const WithdrawalPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends ConsumerState<WithdrawalPage> {
  bool isCommissionSelected = true; // Track selected option
  final TextEditingController _amountcontroller1 = TextEditingController();
  final TextEditingController _amountcontroller2 = TextEditingController();

  String? selectTransferMethodofcommission;
  String? selectTransferMethodoffund;
  Color? backgroundColor = const Color.fromRGBO(200, 200, 200, 1);
  TextStyle? textStyle =
      const TextStyle(color: Color.fromARGB(255, 103, 103, 103));

  void _validateUser(
    String value,
  ) {
    final int? userAmount = int.tryParse(value);

    if (isCommissionSelected
        ? (userAmount != null &&
            userAmount >= 500 &&
            selectTransferMethodofcommission != null)
        : (userAmount != null &&
            userAmount >= 500 &&
            selectTransferMethodoffund != null)) {
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

  void checkUserInputs() {
    // final route = ref.read(routeService);

    if (isCommissionSelected
        ? _amountcontroller1.text.isEmpty
        : _amountcontroller2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Amount to Proceed'),
        ),
      );
    } else {
      // Parse the amount text as an integer
      final int? commissionamount = int.tryParse(_amountcontroller1.text);
      final int? fundamount = int.tryParse(_amountcontroller2.text);

      if (isCommissionSelected
          ? commissionamount == null
          : fundamount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid amount'),
          ),
        );
      } else if (isCommissionSelected
          ? commissionamount! <= 500
          : fundamount! <= 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter amount more than 500'),
          ),
        );
      } else if (isCommissionSelected
          ? selectTransferMethodofcommission == null
          : selectTransferMethodoffund == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select transfer method '),
          ),
        );
      } else {
        final route = ref.read(routeService);
        route.push(
            MoneyTransferRoute(
                amountController: isCommissionSelected
                    ? _amountcontroller1
                    : _amountcontroller2,
                selectedText: isCommissionSelected
                    ? selectTransferMethodofcommission
                    : selectTransferMethodoffund),
            context);
      }
    }
  }

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
              Center(
                child: Container(
                  height: 60.0,
                  width: 390.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      // Animated positioned indicator
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        left:
                            isCommissionSelected ? 0 : 195, // Animate position
                        right: isCommissionSelected ? 195 : 0,
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildOption(
                            title: "Commission Wallet",
                            isSelected: isCommissionSelected,
                            onTap: () {
                              setState(() {
                                isCommissionSelected = true;
                                _validateUser(_amountcontroller1.text);
                              });
                            },
                          ),
                          _buildOption(
                            title: "Fund Wallet",
                            isSelected: !isCommissionSelected,
                            onTap: () {
                              setState(() {
                                isCommissionSelected = false;
                                _validateUser(_amountcontroller2.text);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              // Reuse the input field based on wallet selection
              if (isCommissionSelected) _buildCommissionInput(),
              if (!isCommissionSelected) _buildFundWalletInput(),
              Spacer(),
              Primarybutton(
                onButtonPressed: checkUserInputs,
                buttonText: 'Procced to Pay',
                backgroundColor: backgroundColor,
                textStyle: textStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  final route = ref.read(routeService);
                  route.push(
                      TransactionHistoryRoute(
                          isCommissionSelected:
                              isCommissionSelected ? true : false),
                      context);
                },
                child: Text(
                  "View History",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommissionInput() {
    return Column(
      children: [
        TextField(
          controller: _amountcontroller1,
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.currency_rupee_rounded,
              size: 18,
              color: Colors.red,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            labelText: "Enter Amount",
            labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 199, 199, 199)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey, width: 0.3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey, width: 0.3),
            ),
          ),
          // onChanged: _validateUser,
          onChanged: (value) {
            _validateUser(value); // Call the validation whenever amount changes
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            labelText: 'Select Transfer Method',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 199, 199, 199),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
          ),
          value: selectTransferMethodofcommission,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black, // Dropdown icon color
          ),
          items: ['Bank Transfer', 'Self Transfer']
              .map((commission_transfer_method) {
            return DropdownMenuItem<String>(
              value: commission_transfer_method,
              child: Text(
                commission_transfer_method,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectTransferMethodofcommission = value;
              _validateUser(_amountcontroller1.text);
            });
          },
        ),
      ],
    );
  }

  Widget _buildFundWalletInput() {
    return Column(
      children: [
        TextField(
          controller: _amountcontroller2,
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.currency_rupee_rounded,
              size: 18,
              color: Colors.red,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            labelText: "Enter Amount",
            labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 199, 199, 199)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey, width: 0.3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey, width: 0.3),
            ),
          ),
          // onChanged: _validateUser,
          onChanged: (value) {
            _validateUser(value); // Call the validation whenever amount changes
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            labelText: 'Select Transfer Method',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 199, 199, 199),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
          ),
          value: selectTransferMethodoffund,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black, // Dropdown icon color
          ),
          items: ['Transfer to member wallet'].map((fund_transfer_method) {
            return DropdownMenuItem<String>(
              value: fund_transfer_method,
              child: Text(
                fund_transfer_method,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectTransferMethodoffund = value;
              _validateUser(_amountcontroller2.text);
            });
          },
        ),
      ],
    );
  }

  // Builds each option with text style depending on selection state
  Widget _buildOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            height: 40.0,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.red,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
