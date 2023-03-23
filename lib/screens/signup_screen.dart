import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _propertyController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField(
              label: 'Email',
              controller: _emailController,
              icon: Icons.email,
            ),
            _buildTextField(
              label: 'Password',
              controller: _passwordController,
              icon: Icons.lock,
              obscureText: true,
            ),
            _buildTextField(
              label: 'Propiedad',
              controller: _propertyController,
              icon: Icons.home,
            ),
            _buildTextField(
              label: 'Nombres',
              controller: _firstNameController,
              icon: Icons.person,
            ),
            _buildTextField(
              label: 'Apellidos',
              controller: _lastNameController,
              icon: Icons.person,
            ),
            _buildTextField(
              label: 'Parentesco',
              controller: _relationshipController,
              icon: Icons.group,
            ),
            _buildTextField(
              label: 'Celular',
              controller: _phoneController,
              icon: Icons.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the sign up action
                print('Sign up button pressed');

                // Go to Login
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          if (icon != null) Icon(icon),
          SizedBox(width: 8),
          Text(label),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: label,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
