import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter_application_1/pages/barcode_scanner_window.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),
      routes: {
        LOGIN: (context) => LoginPage(),
        DASHBOARD: (context) => DashboardPage(),
        SCANNER: (context) => BarcodeScannerWithScanWindow(),
      },
    );
  }
}
