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
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: const Center(
        child: Text('Messages'),
      ),
    );
  }
}