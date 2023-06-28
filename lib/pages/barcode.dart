import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarCodePage extends StatefulWidget {
  const BarCodePage({Key? key}) : super(key: key);

  @override
  State<BarCodePage> createState() => _BarCodePageState();
}

class _BarCodePageState extends State<BarCodePage> {
  String ticket = '';
  List<String> tickets = [];

  readBarCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FF0000",
      "Cancelar",
      false,
      ScanMode.BARCODE,
    );
    setState(() => ticket = code != '-1' ? code : 'Não validado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'O código de barras é: $ticket', // texto, fazer outra coluna apenas para o ticket
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ElevatedButton.icon(
              onPressed: readBarCode,
              icon: const Icon(Icons.barcode_reader), //icon
              label: const Text('Ler'),
            ),
          ],
        ),
      ),
    );
  }
}