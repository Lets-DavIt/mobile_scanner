import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'barcode.dart';

void main() {
  runApp(const DashboardPage());
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void example() {
      Navigator.of(context).pushNamed(SCANNER);
    }

    return MaterialApp(
      title: 'Barcode Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.tealAccent,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
            onPrimary: Colors.black,
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        SCANNER: (_) => BarCodePage(), // Adicione a rota para a página do scanner de códigos de barras
      },
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: example,
            child: const Text('Open Scanner'), // Adicione o texto do botão
          ),
        ),
      ),
    );
  }
}

