import 'package:flutter/material.dart';
import 'package:condominios/theme/app_theme.dart';
import 'package:condominios/screens/qr_image.dart';

class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenerateQRScreenState createState() => _GenerateQRScreenState();
}

class _GenerateQRScreenState extends State<GenerateQRScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Tipo de entrada",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                CustomdrowdownServices()
              ],
            ),
            CustomInput(
              hintText: "Acme SRL",
              title: "Para",
              controller: TextEditingController(),
            ),
            CustomInput(
              hintText: "Casa 24",
              title: "Donde",
              controller: TextEditingController(),
            ),
            CustomInput(
              hintText: "Motivo",
              title: "Instalacion de Internet",
              controller: TextEditingController(),
            ),
            CustomInput(
              hintText: "2022-01-01",
              title: "Fecha de vencimiento",
              controller: TextEditingController(),
            ),
            CustomInput(
              hintText: "Internet",
              title: "Tipo de servicio",
              controller: controller,
            ),
            CustomInput(
              hintText: "10",
              title: "Numero de usos",
              controller: TextEditingController(),
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Notificar a",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Customdropdown(),
              ],
            )
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // Customdropdown(),
            //     // SizedBox(width: 20.0),
            //     // Customdropdown(),
            //   ],
            // )
          ],
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.background,
                      elevation: 1,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return QRImage(controller);
                          }),
                        ),
                      );
                    },
                    child: const Text(
                      'ACEPTAR',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            // Row(
            //   children: const [
            //     _FooterButton(text: 'NEED HELP?', color: AppTheme.primary),
            //   ],
            // ),
          ],
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}

class CustomInput extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String title;

  final TextEditingController controller;

  const CustomInput({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 50.0),
        Container(
          width: 350.0,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}

class CustomdrowdownServices extends StatefulWidget {
  const CustomdrowdownServices({
    super.key,
  });

  @override
  _CustomdrowdownServicesState createState() => _CustomdrowdownServicesState();
}

class _CustomdrowdownServicesState extends State<CustomdrowdownServices> {
  String _selectedService = 'Internet';

  List<String> _services = [
    'Amigos/Familiares',
    'Internet',
    'Gas',
    'Luz',
    'Agua',
    'Telefono',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: _selectedService,
            items: _services
                .map((phoneNumber) => DropdownMenuItem(
                      child: Text(phoneNumber),
                      value: phoneNumber,
                    ))
                .toList(),
            onChanged: (selectedPhoneNumber) {
              setState(() {
                _selectedService = selectedPhoneNumber!;
              });
            },
          ),
        ],
      ),
    );
  }
}

class Customdropdown extends StatefulWidget {
  const Customdropdown({
    super.key,
  });

  @override
  _CustomdropdownState createState() => _CustomdropdownState();
}

class _CustomdropdownState extends State<Customdropdown> {
  String _selectedPhoneNumber = '555-555-1234';

  List<String> _phoneNumbers = [
    '555-555-1234',
    '555-555-2345',
    '555-555-3456',
    '555-555-4567',
    '555-555-5678',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: _selectedPhoneNumber,
            items: _phoneNumbers
                .map((phoneNumber) => DropdownMenuItem(
                      child: Text(phoneNumber),
                      value: phoneNumber,
                    ))
                .toList(),
            onChanged: (selectedPhoneNumber) {
              setState(() {
                _selectedPhoneNumber = selectedPhoneNumber!;
              });
            },
          ),
        ],
      ),
    );
  }
}
