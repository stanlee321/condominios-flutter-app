import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ValidateQRScreen extends StatefulWidget {
  const ValidateQRScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ValidateQRScreenState createState() => _ValidateQRScreenState();
}

class _ValidateQRScreenState extends State<ValidateQRScreen> {
  TextEditingController scannedCode = TextEditingController(text: 'QR Code');

  QRViewController? controller;

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: GlobalKey(debugLabel: 'QR'),
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()} - Permission set: $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Camera permission not granted'),
        ),
      );
    }
    final snackBar = SnackBar(content: Text('Permission set: $p'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      log('${DateTime.now().toIso8601String()} - Scan data: ${scanData.code}');
      final snackBar = SnackBar(content: Text('Scan data: ${scanData.code}'));
      setState(() {
        scannedCode.text = scanData.code!;
      });
      controller.pauseCamera();
      Future.delayed(const Duration(seconds: 2), () {
        controller.resumeCamera();
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }, onDone: () {
      log('${DateTime.now().toIso8601String()} - Scan done');
    }, onError: (e) {
      log('${DateTime.now().toIso8601String()} - Scan error: $e');
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    scannedCode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validate QR'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 100, 0, 0),
        child: Center(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              child: buildQrView(context),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Leer desde Galeria'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
