


import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_tt/provider/ThemeProvider.dart';
import 'package:qr_code_tt/screens/cameraScreen/CameraScreen.dart';
import 'package:qr_code_tt/screens/mainScreen/MainScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_code_tt/screens/mainScreen/widget/MainScreenDrawer.dart';
import 'package:qr_code_tt/services/ColorService.dart';
import 'package:qr_code_tt/services/TextStyleService.dart';

///  Navigation
class BottomBar extends StatefulWidget {
  BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late final PersistentTabController controller ;


  @override
  void initState() {
    controller = PersistentTabController();
    super.initState();
  }

  void migrateToPage (int page) => controller.jumpToTab(page);
  @override
  Widget build(BuildContext context) {
    final isLightTheme = Provider.of<ThemeProvider>(context).isLightTheme;

    return Scaffold(

      drawer: const MainScreenDrawer(),
      body: PersistentTabView(
        context,
        backgroundColor: isLightTheme ?  ColorService.white : ColorService.greyLighter,
        screens: screens(),
        navBarStyle: NavBarStyle.style6,
        items: items(context),
        controller: controller,
      ),
    );
  }

  List<Widget> screens () =>  [
    MainScreen(migrateToPage: migrateToPage),
    CameraScreen(migrateToPage: migrateToPage),

  ];

  List<PersistentBottomNavBarItem> items (BuildContext context) {

    final isLightTheme = Provider.of<ThemeProvider>(context).isLightTheme;
    final textStyle =  StyleService.displaySmall(isLightTheme);

    final color = isLightTheme ? ColorService.purpleShade : ColorService.purple;
    final activeColorPrimary = isLightTheme ? ColorService.black :  ColorService.white;
    return [
      PersistentBottomNavBarItem(
        icon:  Icon(Icons.qr_code , color: color,),
        activeColorPrimary: activeColorPrimary,
        textStyle: textStyle,
        title: AppLocalizations.of(context)!.qr_code,
      ),
      PersistentBottomNavBarItem(
          icon:  Icon(Icons.camera , color: color,),
          activeColorPrimary: activeColorPrimary,
          textStyle: textStyle,
          title: AppLocalizations.of(context)!.camera
      ),
    ];
  }
}
