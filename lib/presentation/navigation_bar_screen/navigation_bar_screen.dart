import 'package:flutter/material.dart';
import 'package:football_news/presentation/home_page/home_page.dart';
import 'package:football_news/presentation/matches_page/matches_page.dart';
import 'package:football_news/presentation/settings_page/settings_page.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';

class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return NavigationBarScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: theme.colorScheme.onPrimary,
      body: Stack(
        children: [
          Navigator(
            key: navigatorKey,
            initialRoute: AppRoutes.homePage,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) =>
                  getCurrentPage(context, routeSetting.name!),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildBottomBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Matches:
        return AppRoutes.matchesPage;
      case BottomBarEnum.Settings:
        return AppRoutes.settingsPage;
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(BuildContext context, String currentRoute) {
    print(currentRoute);
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.matchesPage:
        return MatchesPage();
      case AppRoutes.settingsPage:
        return SettingsPage();
      default:
        return DefaultWidget();
    }
  }
}
