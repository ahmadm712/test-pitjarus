import 'package:flutter/material.dart';
import 'package:pitjarus_test/ui/pages/home_page.dart';

var mainRoutes = (RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
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
