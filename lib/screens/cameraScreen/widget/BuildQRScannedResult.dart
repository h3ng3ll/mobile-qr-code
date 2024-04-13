


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_tt/provider/ThemeProvider.dart';
import 'package:qr_code_tt/services/ColorService.dart';
import 'package:qr_code_tt/provider/QRcodeProvider.dart';
import 'package:qr_code_tt/services/TextStyleService.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildQRScannedResult extends StatelessWidget {
  const BuildQRScannedResult({super.key});




  @override
  Widget build(BuildContext context) {
    final qrCodeProvider = Provider.of<QRCodeProvider>(context);
    final isLightTheme = Provider.of<ThemeProvider>(context).isLightTheme;


    final image = qrCodeProvider.image;
    final decodedData  = qrCodeProvider.decodedData;
    if(image == null && decodedData == null ) return Container();

    final displaySmall = StyleService.displaySmall(isLightTheme);

    final qrcodeColor =   isLightTheme ?  ColorService.black : ColorService.purple;

    return  Column(
        children: [
          Expanded(
            flex: 1,
            child: QrImageView(
              data: decodedData!,
              dataModuleStyle: QrDataModuleStyle(color: qrcodeColor , dataModuleShape:  QrDataModuleShape.square ),

              eyeStyle: QrEyeStyle(color: qrcodeColor , eyeShape: QrEyeShape.square),

              version: QrVersions.auto,

            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView(
                          children: [
                            Text(decodedData! , style: displaySmall)
                          ]
                      ),
                    ),

                  ]
              )
          )
        ]
    );
    }
}

