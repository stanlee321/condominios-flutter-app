import 'package:condominios/widgets/messages/dropdownadd.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Row(
                children: [
                  const Text('Message 1'),
                  const Text('Message 2'),
                ],
              ),
              Text('Whatsapp a quienes enviar una solicitud'),
              DropdownWithAddAndRemove()
            ],
          ),
        ),
      ),
    );
  }
}
