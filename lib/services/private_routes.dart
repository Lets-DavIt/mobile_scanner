import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'token_provider.dart';

Route<dynamic>? privateRoutes(RouteSettings settings, String? token) {
  final tokenProvider = TokenProvider();
  bool isAuthorized = token != null && token.isNotEmpty;

  // if (isAuthorized) {
  //   return MaterialPageRoute(
  //     builder: (context) => DashboardPage(),
  //   );
  // }")

  print("--------------> token <--------------");
  print(token);

  if (!isAuthorized) {
    return MaterialPageRoute(
      builder: (context) => LoginPage(),
    );
  }

  switch (settings.name) {
    case DASHBOARD:
      return MaterialPageRoute(
        builder: (context) => DashboardPage(),
      );
    // case PROFILE:
    //   return MaterialPageRoute(
    //     builder: (context) => ProfilePage(),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
  }
}
