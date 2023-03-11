import 'package:flutter/material.dart';

class BlScreen extends StatefulWidget {
  const BlScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BlScreenState createState() => _BlScreenState();
}

class _BlScreenState extends State<BlScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'BL',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
