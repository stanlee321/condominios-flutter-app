import 'package:flutter/material.dart';
import 'package:condominios/router/app_routes.dart';
import 'package:condominios/theme/app_theme.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: const MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Condominios Demo',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}
