import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';

@RoutePage()
class ScannerPage extends ConsumerStatefulWidget {
  static var page;

  const ScannerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerPageState();
}

class _ScannerPageState extends ConsumerState<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staggered Image Grid')),
      body: AiBarcodeScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (BarcodeCapture capture) {
          /// The row string scanned barcode value
          final String? scannedValue = capture.barcodes.first.rawValue;
          debugPrint("Barcode scanned: $scannedValue");

          /// The `Uint8List` image is only available if `returnImage` is set to `true`.
          final Uint8List? image = capture.image;
          debugPrint("Barcode image: $image");

          /// row data of the barcode
          final Object? raw = capture.raw;
          debugPrint("Barcode raw: $raw");

          /// List of scanned barcodes if any
          final List<Barcode> barcodes = capture.barcodes;
          debugPrint("Barcode list: $barcodes");
        },
        validator: (value) {
          if (value.barcodes.isEmpty) {
            return false;
          }
          if (!(value.barcodes.first.rawValue?.contains('flutter.dev') ??
              false)) {
            return false;
          }
          return true;
        },
      ),
    );
  }
}