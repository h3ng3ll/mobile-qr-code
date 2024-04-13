



import 'package:flutter/foundation.dart';

class QRCodeProvider extends ChangeNotifier {

  /// qr code image
  Uint8List? _image    ;
  String? _decodedData ;

   Uint8List? get image => _image;
   String? get decodedData => _decodedData;

   void updateQRCode (Uint8List image , String decodedData) {
     _image = image;
     _decodedData = decodedData;
     notifyListeners();
   }

}