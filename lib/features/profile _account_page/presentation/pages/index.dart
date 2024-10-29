import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed_business/core/styles/buttons/primary_button.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ProfileAccountPage extends ConsumerStatefulWidget {
  static var page;

  const ProfileAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileAccountPageState();
}

class _ProfileAccountPageState extends ConsumerState<ProfileAccountPage> {
  File? pickedImage;
  DateTime? selectedDate;
  String? selectedGender;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  // Image picker logic
  Future<void> pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) {
        debugPrint('No image selected');
        return;
      }
      final tempImage = File(photo.path);

      setState(() {
        pickedImage = tempImage;
        debugPrint('Image picked: ${pickedImage!.path}');
      });
      Navigator.pop(context);
    } catch (error) {
      debugPrint('Error picking image: $error');
    }
  }

  void imagePickerOption() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Container(
              color: Colors.white,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Pick Image From",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 255, 248, 247))),
                      onPressed: () => pickImage(ImageSource.camera),
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "CAMERA",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 255, 248, 247))),
                      onPressed: () => pickImage(ImageSource.gallery),
                      icon: const Icon(
                        Icons.image,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "GALLERY",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 255, 248, 247))),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Earliest date you can select
      lastDate: DateTime(2100), // Latest date you can select
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 55, 55, 55),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: ClipOval(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 2,
                        child: IconButton(
                          onPressed: imagePickerOption, // Open BottomSheet
                          icon: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45))),
                            padding: EdgeInsets.all(5),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 25, right: 15, left: 15),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Personal Details',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "ZP 234556",
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            print('tapped');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "Sunny Kharwar",
                            style: AppTextStyles.appCaptionText(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ).copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            // print('${service['text']} tapped');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "8459186035",
                            style: AppTextStyles.appCaptionText(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ).copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            // print('${service['text']} tapped');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "testsunny234@gmail.com",
                            style: AppTextStyles.appCaptionText(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ).copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            // print('${service['text']} tapped');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            selectedDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(selectedDate!) // Show selected date
                                : 'Select Date of birth', // Default text when no date is selected
                            style: selectedDate != null
                                ? TextStyle(
                                    // color: Colors
                                    //     .black, // Style for the selected date
                                    fontSize: 16, fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  )
                                : TextStyle(
                                    color: Color.fromARGB(255, 152, 152,
                                        152), // Style for "Select Date of birth"
                                    fontSize: 16,
                                  ),
                          ),
                          onTap: () => _selectDate(context),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                          ),
                          child: ListTile(
                            leading: SvgPicture.asset(
                              "assets/svg/ic_baseline-history.svg",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            title: DropdownButtonFormField<String>(
                              decoration:
                                  InputDecoration.collapsed(hintText: ''),
                              value: selectedGender,
                              hint: Text(
                                'Select Gender',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 152, 152,
                                        152), // Style for "Select Date of birth"
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black), // Dropdown icon
                              items: ['Male', 'Female', 'Others']
                                  .map((gender) => DropdownMenuItem<String>(
                                        value: gender,
                                        child: Text(gender,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            )),
                                      ))
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              },
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 25, right: 15, left: 15),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Address Details',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Address",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 152, 152,
                                      152), // Style for "Select Date of birth"
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            // onChanged: _validateUserId,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: TextField(
                            controller: _districtController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter District",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 152, 152,
                                      152), // Style for "Select Date of birth"
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            // onChanged: _validateUserId,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: TextField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter State",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 152, 152,
                                      152), // Style for "Select Date of birth"
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            // onChanged: _validateUserId,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: TextField(
                            keyboardType: TextInputType.number,
                            controller: _pincodeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Pin Code",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 152, 152,
                                      152), // Style for "Select Date of birth"
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            // onChanged: _validateUserId,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Primarybutton(buttonText: "Update", onButtonPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// DropdownButtonFormField<String>(
//   decoration: InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//     labelText: 'Select Gender',
//     labelStyle: TextStyle(
//       fontWeight: FontWeight.w400,
//       color: const Color.fromARGB(255, 199, 199, 199),
//     ),
//     filled: true,
//     fillColor: Colors.white,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: const BorderSide(
//         color: Colors.grey,
//         width: 0.3,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: const BorderSide(
//         color: Colors.grey,
//         width: 0.3,
//       ),
//     ),
//   ),
//   value: selectTransferMethod,
//   hint: Text(
//     'Select Gender',
//     style: TextStyle(
//       color: Color.fromARGB(255, 152, 152, 152), // Style for "Select Gender"
//       fontSize: 16,
//       fontWeight: FontWeight.w600,
//     ),
//   ),
//   icon: Icon(
//     Icons.arrow_drop_down,
//     color: Colors.black, // Dropdown icon color
//   ),
//   items: ['Male', 'Female', 'Others'].map((gender) {
//     return DropdownMenuItem<String>(
//       value: gender,
//       child: Text(
//         gender,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: Colors.red,
//         ),
//       ),
//     );
//   }).toList(),
//   onChanged: (value) {
//     setState(() {
//       selectTransferMethod = value;
//     });
//   },
// )
