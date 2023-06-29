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

  //Scanner para QRCODE
  readQrCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FF0000",
      "Cancelar",
      false,
      ScanMode.QR,
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
              const Column(
                children: [Text(
                  'O código de barras é:',
                  style: TextStyle(fontSize: 20),
                ),
                ],
              ),
            if (ticket != '')
              Column(
                children: [
                  Text(
                    ticket,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  // Adicione qualquer outro widget relacionado ao ticket aqui
                ],
              ),
            ElevatedButton.icon(
              onPressed: readBarCode,
              icon: const Icon(Icons.barcode_reader), //icon
              label: const Text('Escanear'),
            ),
          ],
        ),
      ),
    );
  }
}