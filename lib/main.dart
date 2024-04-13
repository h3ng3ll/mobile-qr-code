import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_tt/BottomBar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qr_code_tt/l10n/L10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_code_tt/provider/ThemeProvider.dart';
import 'package:qr_code_tt/services/ColorService.dart';
import 'package:qr_code_tt/provider/QRcodeProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
      ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /// dark or light theme
    final theme = Provider.of<ThemeProvider>(context).theme;

    return  MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      supportedLocales: L10n.languages,

      home: ChangeNotifierProvider(
        child: BottomBar(),
        create: (BuildContext context) => QRCodeProvider(),
      ),
    );

  }
}

