import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class IdCardPage extends ConsumerStatefulWidget {
  static var page;

  const IdCardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdCardPageState();
}

class _IdCardPageState extends ConsumerState<IdCardPage> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 213,
                color: Colors.green,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/png/top_shape.png',
                      // height: 185,
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/png/bottom_shape.png',
                      // height: 185,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
