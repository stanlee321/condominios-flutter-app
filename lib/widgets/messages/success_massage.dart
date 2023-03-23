import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          'OK',
          style: TextStyle(color: Colors.white, fontSize: 90),
        ),
      ),
    );
  }
}
