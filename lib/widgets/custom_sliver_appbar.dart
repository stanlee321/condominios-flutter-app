import 'package:flutter/material.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String titulo;
  const CustomSliverAppbar({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 5),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 5, color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        background: Image.asset(
          "assets/images/appbar.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
