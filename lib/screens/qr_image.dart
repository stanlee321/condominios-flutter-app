import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  const QRImage(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generated'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(50, 100, 0, 0),
            child: QrImage(
              data: controller.text,
              size: 280,
              version: QrVersions.auto,

              // You can include embeddedImageStyle Property if you
              //wanna embed an image from your Asset folder
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: const Size(
                  50,
                  50,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
            child: Column(
              children: [
                CustomDataRow(key: key, title: 'Para: ', value: 'Acme SRL'),
                CustomDataRow(key: key, title: 'Donde: ', value: 'Casa 24'),
                CustomDataRow(
                    key: key,
                    title: 'Motivo: ',
                    value: 'Instalacion de Internet'),
                CustomDataRow(key: key, title: 'Usos: ', value: '10'),
                CustomDataRow(key: key, title: 'Validar: ', value: 'SI'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Guardar'),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Compartir'),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class CustomDataRow extends StatelessWidget {
  final String title;
  final String value;

  const CustomDataRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
