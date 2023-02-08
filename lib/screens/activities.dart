import 'package:condominios/widgets/activites/activities_list.dart';
import 'package:flutter/material.dart';




class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ActivitiesScreenState createState() => _ActivitiesScreenState();

}

class _ActivitiesScreenState extends State<ActivitiesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: ActivitiesList()
    );
  }
}


class ActivitiesList extends StatelessWidget {
  ActivitiesList({Key? key}) : super(key: key);


  final  exampleJson = [
      { 
        "for": "Acme Inc.",
        "code": "vf21s",
        "expiration_date": "2022-10-01 at 10:00 pm",
        "remaining_uses": '9',
        "service_type": "SERVICE",
        "validated": false,
      },
      {
        "for": "Acme Inc.",
        "code": "vf21s",
        "expiration_date": "2022-10-01 at 10:00 pm",
        "remaining_uses": '9',
        "service_type": "SERVICE",
        "validated": false,
      },
      {
        "for": "Acme Inc.",
        "code": "vf21s",
        "expiration_date": "2022-10-01 at 10:00 pm",
        "remaining_uses": '9',
        "service_type": "SERVICE",
        "validated": false,
      },
      {
        "for": "Acme Inc.",
        "code": "vf21s",
        "expiration_date": "2022-10-01 at 10:00 pm",
        "remaining_uses": '9',
        "service_type": "SERVICE",
        "validated": false,
      },
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
        itemCount: exampleJson.length,
        itemBuilder: (context, index) {
          return exampleJson.isEmpty
              ? const Center(
                  child: Text('No hay datos'),
                )
              : 
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Para: ${exampleJson[index]['for']!}"),
                      Text("Expiration Date: ${exampleJson[index]['expiration_date']}"),
                      Text("Remaining Uses: ${exampleJson[index]['remaining_uses']}"),
                      Text("Service Type: ${exampleJson[index]['service_type']}"),
                      Text("Validated: ${exampleJson[index]['validated'] != null ? "Yes" : "No"}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Aceptar"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(28.0,0,0,0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Esperar 15 minutes"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
        },
      ));
  }
}
