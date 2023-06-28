import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter_application_1/services/private_routes.dart';
import 'package:flutter_application_1/services/token_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tokenProvider = TokenProvider();
  await tokenProvider.initPrefs();

  runApp(
    ChangeNotifierProvider(
      create: (context) => tokenProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
    final token = tokenProvider.token;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),
      // routes: {
      //   LOGIN: (context) => LoginPage(),
      //   DASHBOARD: (context) => DashboardPage(),
      // },
      onGenerateRoute: (settings) => privateRoutes(settings, token),
    );
  }
}
