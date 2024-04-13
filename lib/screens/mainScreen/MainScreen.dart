

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:qr_code_tt/provider/ThemeProvider.dart';
import 'package:qr_code_tt/screens/cameraScreen/widget/BuildQRScannedResult.dart';
import 'package:qr_code_tt/provider/QRcodeProvider.dart';
import 'package:qr_code_tt/services/ColorService.dart';
import 'package:qr_code_tt/services/TextStyleService.dart';

import 'package:scan/scan.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.migrateToPage});

  final Function (int) migrateToPage;


  Future<void> scanQRCode(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? qrCode = await imagePicker.pickImage(
        source: ImageSource.gallery);
    if (qrCode == null) return;
    final Uint8List image = await qrCode.readAsBytes();
    final text = await Scan.parse(qrCode.path);
    if (text != null) {
      // if (await AdMobService.rewardAd.isLoaded) {
      //   AdMobService.rewardAd.show();
      // }
      // ignore: use_build_context_synchronously
      Provider.of<QRCodeProvider>(context, listen: false).updateQRCode(
          image, text);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          AppLocalizations.of(context)!.the_code_scanned_successfully)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.failed_to_scan_code)));
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: ColorService.black,
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            title(context),
            /// qr code and decoded value
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: buildQRCodeAndDecoding(context),
              ),
            ),
            // AdMobService.admobBanner(AdmobBannerSize.SMART_BANNER(context)),

          ],
        ),
      ),
    );
  }

  Widget title(BuildContext context) {
    final qrCodeProvider = Provider.of<QRCodeProvider>(context);
    final isLightTheme = Provider.of<ThemeProvider>(context).isLightTheme;
    final style = StyleService.titleLarge(isLightTheme);

    final image = qrCodeProvider.image;
    final decodedData  = qrCodeProvider.decodedData;
    final isAbsent = (image == null && decodedData == null);

    return Row(
      mainAxisAlignment:   MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu)
        ),
        if(isAbsent) const Spacer(),
        Text(
          AppLocalizations.of(context)!.mobile_qr_scanner, style: style,
        ),
        if(isAbsent) const Spacer(),
        if (!isAbsent) Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(BorderSide(color: ColorService.black ))
            ),
            child: IconButton(
                onPressed: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'sendToSomeoneCode@example.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': decodedData!,                                }),
                  );
                  launchUrl(emailLaunchUri);
                },
                icon: const Icon(Icons.share)
            )
        )
      ],
    );
  }

  Widget buildQRCodeAndDecoding(BuildContext context) {
    final gaps = MediaQuery.of(context).size.height * 0.03;
    return Column(
      children: [

        SizedBox(height: gaps),
        buildButtons(context),
        SizedBox(height: gaps),

        const Expanded(child: BuildQRScannedResult())
      ],
    );
  }

  Widget buildButtons(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final isLightTheme = provider.isLightTheme;
    final style = StyleService.titleSmall(!isLightTheme);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => migrateToPage(1),
          child: Text(AppLocalizations.of(context)!.camera, style: style,),

        ),

        ElevatedButton(
          onPressed: () async => await scanQRCode(context),
          child: Text(AppLocalizations.of(context)!.gallery, style: style,),
        ),
      ],
    );
  }


}
