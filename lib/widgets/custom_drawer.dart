import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> options = const [
    {
      'title': 'Home',
      'icon': Icons.home,
      'path': '/',
    },
    {
      'title': 'Bio',
      'icon': Icons.person_outline,
      'path': '/bio',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) => _ItemTitle(
          title: options[index]['title'],
          icon: options[index]['icon'],
          path: options[index]['path'],
        ),
        itemCount: options.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.white,
          height: 10,
        ),
      ),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({
    Key? key,
    required this.title,
    required this.icon,
    required this.path,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final String path;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: () {
        // Route
        Navigator.of(context).pushNamed(path);
      },
    );
  }
}
