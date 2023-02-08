import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final IconData icon;
  final String routeName;

  const OptionBox(this.icon, this.routeName, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            //size
            size: 80,
            icon,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
