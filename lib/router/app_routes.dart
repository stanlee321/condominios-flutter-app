import 'package:condominios/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:condominios/screens/screens.dart';

class AppRoutes {
  static const initialRoute = '/';
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (contex) => const LoginScreen(),
    '/home': (contex) => const HomeScreen(),
    '/bio': (contex) => const BiometricAuthentication(
          appBarTitle: 'Bio',
        ),
    '/messages': (contex) => const MessagesScreen(),
    '/profile': (contex) => const ProfileScreen(),
    '/bl_page': (contex) => const BlScreen(),
    '/my_qrs': (contex) => const MyQRScreen(),
    '/activities': (contex) => const ActivitiesScreen(),
    '/generate_qr': (contex) => const GenerateQRScreen(),
    '/validate_qr': (contex) => const ValidateQRScreen(),
    '/services': (contex) => const ServiceScreen(),
    '/homepage': (contex) => const HomePage(),
    '/signup': (contex) => SignUpScreen(),
  };
}
