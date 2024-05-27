import 'package:flutter/material.dart';
import 'package:football_news/data/models/matches_model/matches_model.dart';
import 'package:football_news/presentation/navigation_bar_screen/navigation_bar_screen.dart';

import '../data/models/news_model/news_model.dart';
import '../presentation/match_info_screen/match_info_screen.dart';
import '../presentation/news_screen/news_screen.dart';

class AppRoutes {
  static const String navigationBarScreen = '/navigation_bar_screen';

  static const String homePage = '/home_page';

  static const String settingsPage = '/settings_page';

  static const String matchesPage = '/matches_page';

  static const String matchInfoScreen = '/match_info_screen';

  static const String newsScreen = '/news_screen';

  static Map<String, WidgetBuilder> get routes => {
        navigationBarScreen: NavigationBarScreen.builder,
        // mainScreen: MainScreen.builder,
        newsScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as NewsModel;
          return NewsScreen.builder(context, arguments);
        },
        matchInfoScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as MatchResult;
          return MatchInfoScreen.builder(context, arguments);
        },
        // settingsScreen: SettingsScreen.builder,
      };
}
