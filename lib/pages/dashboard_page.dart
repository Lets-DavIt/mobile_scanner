import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/pages/barcode_scanner_window.dart';
import 'barcode.dart';

void main() {
  runApp(const DashboardPage());
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String barcodeNumber = '';

  @override
  Widget build(BuildContext context) {
    void example() async {
      final result = await Navigator.of(context)
          .pushNamed(SCANNER, arguments: barcodeNumber);
      if (result != null) {
        setState(() {
          print("<---------------------------------->");
          print(result);
          setState(() {
            barcodeNumber = result as String;
          });
        });
      }
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
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        SCANNER: (_) =>
            BarcodeScannerWithScanWindow(), // Adicione a rota para a página do scanner de códigos de barras
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Barcode Number: $barcodeNumber',
                style: TextStyle(fontSize: 20),
              ) ,
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: example,
                child: const Text('Open Scanner'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
