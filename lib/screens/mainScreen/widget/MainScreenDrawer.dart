



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_tt/credentials.dart';
import 'package:qr_code_tt/provider/ThemeProvider.dart';
import 'package:qr_code_tt/services/ColorService.dart';
import 'package:qr_code_tt/services/TextStyleService.dart';
import 'package:url_launcher/url_launcher.dart';
class MainScreenDrawer extends StatelessWidget {
  const MainScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ThemeProvider>(context);
    final isLightTheme = provider.isLightTheme;

    final titleStyle  = StyleService.bodyMedium(isLightTheme);
    final  contentStyle = StyleService.titleLarge(isLightTheme) ;
    final  titleLargest = StyleService.titleLargest(isLightTheme) ;
    final  titleSmall = StyleService.titleSmall(isLightTheme) ;

      return SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [

                Center( child: Text(AppLocalizations.of(context)!.developer_profile , style: titleLargest)),
                ListTile(
                  title: Column(
                    children: [
                      Text("${AppLocalizations.of(context)!.created_by} " , style: contentStyle),
                      Text(AppLocalizations.of(context)!.the_creator , style: titleStyle,)
                    ],
                  ),
                  leading: Icon(Icons.account_circle),
                ),
                ListTile(
                  title: Column(
                    children: [
                      Text("${AppLocalizations.of(context)!.github} " , style: contentStyle),
                      Text(AppLocalizations.of(context)!.repo , style: titleStyle,)
                    ],
                  ),
                  leading: Icon(Icons.accessibility),
                ),
                Center( child: Text(AppLocalizations.of(context)!.settings , style: titleLargest)),
                ListTile(
                  title: Row(
                    children: [
                      Text("${AppLocalizations.of(context)!.night_mode} " , style: titleSmall),
                      Switch(value: isLightTheme, onChanged: (_) => provider.switchTheme())
                    ],
                  ),
                  leading: Icon(Icons.nightlight_outlined),
                ),
              ],
            ),
          ),
        ),
        // child: Drawer(
        //   child: ListTile(
        //     title:
        //     leading:
        //   ),
        // ),
      );
  }
}
