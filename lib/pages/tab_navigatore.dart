import 'package:flutter/material.dart';
import 'package:lookmefront/pages/accueil.dart';
import 'package:lookmefront/pages/choixDiscussionPage.dart';
import 'package:lookmefront/pages/favorite.dart';
import 'package:lookmefront/pages/profile.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == "AccueilPage")
      child = AccueilPage();
    else if (tabItem == "FavoritePage")
      child = FavoritePage();
    else if (tabItem == "ChoixDiscussionPage")
      child = ChoixDiscussionPage();
    else if (tabItem == "ProfilePage") child = ProfilePage();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
