import 'package:flutter/material.dart';
import 'package:lookmefront/pages/tab_navigatore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentPage = "AccueilPage";
  int currentIndex = 0;
  List<String> pageKeys = [
    "AccueilPage",
    "FavoritePage",
    "DiscussionPage",
    "ProfilePage"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "AccueilPage": GlobalKey<NavigatorState>(),
    "FavoritePage": GlobalKey<NavigatorState>(),
    "DiscussionPage": GlobalKey<NavigatorState>(),
    "ProfilePage": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == currentPage) {
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
      print(_navigatorKeys[tabItem]);
    } else {
      setState(() {
        currentPage = pageKeys[index];
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentPage != "AccueilPage") {
            _selectTab("AccueilPage", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[
            _buildOffstageNavigator("AccueilPage"),
            _buildOffstageNavigator("FavoritePage"),
            _buildOffstageNavigator("DiscussionPage"),
            _buildOffstageNavigator("ProfilePage")
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/Home.png"),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/Heart.png"),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/Topic.png"),
              label: 'Discussion',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/User.png"),
              label: 'Profile',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
