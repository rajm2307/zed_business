import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zed_business/core/styles/buttons/primary_button.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:intl/intl.dart'; // Add intl package to format the date
import 'package:path_provider/path_provider.dart';

@RoutePage()
class QrCodePage extends ConsumerStatefulWidget {
  static var page;

  const QrCodePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QrCodePageState();
}

class _QrCodePageState extends ConsumerState<QrCodePage> {
  File? pickedImage;
  DateTime? selectedDate;
  String? selectedGender;
  GlobalKey _globalKey = GlobalKey(); // Key to identify the widget to capture

  final String businessId =
      "ZP 237462"; // Business ID to be displayed and copied

  // Method to capture screenshot
  Future<void> _captureAndSharePng() async {
    try {
      // Capturing the widget image
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(
          pixelRatio: 3.0); // Adjust pixelRatio for higher resolution
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Saving the screenshot to a temporary directory
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/screenshot.png').create();
      await file.writeAsBytes(pngBytes);

      // Assuming `file` is a File instance or obtained from ImagePicker, etc.
      XFile xFile = XFile(file.path);

      // Sharing the screenshot
      await Share.shareXFiles([xFile], text: 'Check out my screenshot!');

      // Sharing the screenshot
      // await Share.shareXFiles([file.path], text: 'Check out my screenshot!');
    } catch (e) {
      print("Error while capturing screenshot: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: const Color.fromARGB(255, 55, 55, 55),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.download,
                      color: const Color.fromARGB(255, 55, 55, 55),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 65,
              ),
              RepaintBoundary(
                key: _globalKey, // This is the widget that will be captured
        
                child: Container(
                  padding: EdgeInsets.only(
                      top: 25, bottom: 25, right: 15, left: 15),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(100)),
                            ),
                            child: ClipOval(
                              child: pickedImage != null
                                  ? Image.file(
                                      pickedImage!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            'Sunny Kharwar',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset(
                          'assets/png/QR_Code.png',
                          height: 285,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      const Text(
                        "Scan & pay any UPI app",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/png/bankimage.png',
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            'Kotak Mahindra Bank 4049',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ZED BIZ ID : $businessId',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.02),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: businessId));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("ID copied to clipboard!")),
                              );
                            },
                            child: Icon(
                              Icons.copy_outlined,
                              size: 30.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Open Scanner',
                      style: AppTextStyles.appCaptionText(
                          color: Colors.red, fontWeight: FontWeight.w500),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  OutlinedButton.icon(
                    onPressed: _captureAndSharePng,
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Share',
                      style: AppTextStyles.appCaptionText(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
