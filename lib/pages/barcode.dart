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

  // Scanner para QRCODE
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
            const Text(
              'Menu de Escaneamento',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (ticket != '')
              Column(
                children: [
                  const Text(
                    'O código escaneado foi:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    ticket,
                    style: TextStyle(fontSize: 20),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  // Adicione qualquer outro widget relacionado ao ticket aqui
                ],
              ),
            SizedBox(
              width: 200, // Defina a largura desejada para os botões
              child: ElevatedButton.icon(
                onPressed: readBarCode,
                icon: const Icon(Icons.barcode_reader), // Icon
                label: const Text('BarCode'),
              ),
            ),
            const SizedBox(height: 10), // Espaço entre os botões
            SizedBox(
              width: 200, // Defina a largura desejada para os botões
              child: ElevatedButton.icon(
                onPressed: readQrCode,
                icon: const Icon(Icons.qr_code), // Icon
                label: const Text('QRCode'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
