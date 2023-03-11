import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServiceScreen> {
  final exampleJson = [
    {
      "id": "vf21s",
      "title": "PLOMERIA",
      "description": "Instalacion de agua",
      "created_at": "2022-10-01 at 10:00 pm",
    },
    {
      "id": "da22s",
      "title": "INTERNET",
      "description": "Instalacion de agua",
      "created_at": "2022-10-01 at 10:00 pm",
    },
    {
      "id": "df2s",
      "title": "ELECTRICIDAD",
      "description": "Instalacion de agua",
      "created_at": "2022-10-01 at 10:00 pm",
    },
    {
      "id": "zf2s",
      "title": "LIMPIEZA",
      "description": "Instalacion de agua",
      "created_at": "2022-10-01 at 10:00 pm",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SERVICIOS'),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: exampleJson.length,
            itemBuilder: (context, index) {
              return exampleJson.isEmpty
                  ? const Center(
                      child: Text('No hay datos'),
                    )
                  : Card(
                      child: ListTile(
                        title: Text(exampleJson[index]['title']!),
                        subtitle: Text(exampleJson[index]['description']!),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.pushNamed(context, '/');
                        },
                      ),
                    );
            },
          ),
        ));
  }
}
