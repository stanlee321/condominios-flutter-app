import 'package:flutter/material.dart';


class MyQRScreen extends StatefulWidget {
  const MyQRScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyQRScreenState createState() => _MyQRScreenState();

}



class _MyQRScreenState extends State<MyQRScreen> {
  final  exampleJson = [
    {
      "id": "vf21s",
      "title": "Instalacion de agua",
      "created_at": "2022-10-01 at 10:00 pm",
    },
    {
      "id": "da22s",
      "title": "Instalacion de luz",
      "created_at": "2022-10-01 at 10:00 pm",
    },
    {
      "id": "df2s",
      "title": "Instalacion de internet",
      "created_at": "2022-10-01 at 10:00 pm",
    },
    {
      "id": "zf2s",
      "title": "Instalacion de pizarra",
      "created_at": "2022-10-01 at 10:00 pm",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis QRs'),
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
                    subtitle: Text(exampleJson[index]['created_at']!),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigator.pushNamed(context, '/');
                    },
                  ),
                      );
        },
      ),
      )
    );
  }
}
