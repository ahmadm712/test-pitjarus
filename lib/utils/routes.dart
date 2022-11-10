import 'package:flutter/material.dart';
import 'package:pitjarus_test/ui/pages/detail_store_page.dart';
import 'package:pitjarus_test/ui/pages/home_page.dart';
import 'package:pitjarus_test/ui/pages/login_page.dart';

var mainRoutes = (RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

    case DetailStorePage.routeName:
      var store = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => DetailStorePage(data: store),
      );

    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    default:
      // Page For such Not Found
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Page Not Found :(')),
        ),
      );
  }
};
