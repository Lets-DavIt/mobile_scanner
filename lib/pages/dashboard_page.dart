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
      final result = await Navigator.of(context).pushNamed(SCANNER, arguments: barcodeNumber);
      if (result != null) {
        setState(() {
          barcodeNumber = result as String;
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
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        SCANNER: (_) => BarcodeScannerWithScanWindow(), // Adicione a rota para a página do scanner de códigos de barras
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menu de Escaneamento',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              if (barcodeNumber != '')
                Column(
                  children: [
                    const Text(
                      'O código escaneado foi:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      barcodeNumber,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    // Adicione qualquer outro widget relacionado ao ticket aqui
                  ],
                ),
              ElevatedButton.icon(
                onPressed: example,
                icon: const Icon(Icons.barcode_reader),
                label: const Text('Escanear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

