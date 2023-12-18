import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String _result = "Scan a barcode";

  Future<void> _scanBarcode() async {
    try {
      var result = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.DEFAULT);
      setState(() {
        _result = result;
      });
    } catch (err) {
      setState(() {
        _result = "Error: $err";
        print("$err");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Result:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _result,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanBarcode,
              child: const Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
