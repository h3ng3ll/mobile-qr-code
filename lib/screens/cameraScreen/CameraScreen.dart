

import 'dart:typed_data';

// import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
// import 'package:qr_code_tt/services/AdMobService.dart';
import 'package:qr_code_tt/services/ColorService.dart';
import 'package:qr_code_tt/provider/QRcodeProvider.dart';

class CameraScreen extends StatelessWidget {
   const CameraScreen({super.key, required this.migrateToPage});

   final Function (int) migrateToPage ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(color: ColorService.black,)
        ),
        Expanded(
            flex: 1,
            child: MobileScanner(
                controller: MobileScannerController(returnImage: true , ),
                onDetect: (BarcodeCapture capture ) async {

                    final provider = Provider.of<QRCodeProvider>(context , listen:  false);
                    final List<Barcode> barCodes = capture.barcodes;

                    String value = "";
                    for (final barcode in barCodes) {
                      debugPrint("Successfully got barcode ${barcode.rawValue}");
                    }
                    final Uint8List? image = capture.image;
                    if(image != null && barCodes.first.rawValue != null ){
                      provider.updateQRCode(image, barCodes.first.rawValue!);
                      migrateToPage(0);
                    }
                }
            )
        ),
        Expanded(
            flex: 1,
            child: Container(color: ColorService.black,)
        ),
      ],
    );
  }
}
