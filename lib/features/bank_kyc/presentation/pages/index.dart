import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zed_business/core/styles/buttons/primary_button.dart';

@RoutePage()
class BankKYCPage extends ConsumerStatefulWidget {
  static var page;
  String? userID;
  String? fullName;

  BankKYCPage({super.key, required this.userID, required this.fullName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BankKYCPageState();
}

class _BankKYCPageState extends ConsumerState<BankKYCPage> {
  late TextEditingController _usesrIDController;
  late TextEditingController _fullNameController;

  final TextEditingController _pannumberController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _banknameController = TextEditingController();
  final TextEditingController _enteraccountnumberController =
      TextEditingController();
  final TextEditingController _confirmaccountnumberController =
      TextEditingController();
  final TextEditingController _nomineeController = TextEditingController();
  final TextEditingController _realtionofnomineeController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _usesrIDController = TextEditingController(text: widget.userID);
    _fullNameController = TextEditingController(text: widget.fullName);
  }

  @override
  void dispose() {
    _usesrIDController.dispose();
    _fullNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access media query for device size
    final deviceSize = MediaQuery.of(context).size;

    // General padding and spacing
    const double verticalPadding = 15.0;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                // Title
                Text(
                  'Bank Details',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: deviceSize.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildTextField(context, 'User ID', _usesrIDController),
                const SizedBox(height: verticalPadding),
                _buildTextField(context, 'Full Name', _fullNameController),
                const SizedBox(height: verticalPadding),
                _buildTextField(
                    context, 'Enter PAN Number', _pannumberController),
                const SizedBox(height: verticalPadding),
                // IFSC Code
                _buildTextField(context, 'Enter IFSC Code', _ifscController),
                const SizedBox(height: verticalPadding),
                // Bank Name
                _buildTextField(
                    context, 'Enter Bank Name', _banknameController),
                const SizedBox(height: verticalPadding),
                // Account Number
                _buildTextField(context, 'Enter Account Number',
                    _enteraccountnumberController),
                const SizedBox(height: verticalPadding),
                // Confirm Account Number
                _buildTextField(context, 'Confirm Account Number',
                    _confirmaccountnumberController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'Nominee Details',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: deviceSize.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildTextField(
                    context, 'Enter Nominee Name', _nomineeController),
                const SizedBox(height: verticalPadding),
                _buildTextField(context, 'Enter Relation of Nominee',
                    _realtionofnomineeController),
                const SizedBox(height: verticalPadding),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Primarybutton(buttonText: "Save", onButtonPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  } // A function to build readonly fields (like User ID, Full Name)

  // Widget _buildReadOnlyField(BuildContext context, String label, String value) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         label,
  //         style: const TextStyle(fontSize: 14, color: Colors.grey),
  //       ),
  //       const SizedBox(height: 8),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: Text(
  //           value,
  //           style: const TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // A function to build editable text fields
  Widget _buildTextField(BuildContext context, String labelText,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        labelText: labelText,
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
    );
  }
}
