import 'package:condominios/blocs/app_blocs.dart';
import 'package:condominios/blocs/app_events.dart';
import 'package:condominios/blocs/app_states.dart';
import 'package:condominios/models/activity_model.dart';
import 'package:condominios/repos/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isObscure = true;
  Color _eyeButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                validator: (input) =>
                    input!.contains('@') ? 'Please enter a valid email' : null,
                onSaved: (input) => _email = input!,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (_isObscure) {
                        setState(() {
                          _isObscure = false;
                          _eyeButtonColor = Theme.of(context).primaryColor;
                        });
                      } else {
                        setState(() {
                          _isObscure = true;
                          _eyeButtonColor = Colors.grey;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _eyeButtonColor,
                    ),
                  ),
                ),
                obscureText: _isObscure,
                validator: (input) => input!.length < 8
                    ? 'Your password needs to be at least 8 characters'
                    : null,
                onSaved: (input) => _password = input!,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _submit,
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20.0),
            // Not a member? Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Not a member?",
                    style: TextStyle(
                      color: Colors.black,
                    )
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
                  child: const Text("Sign Up"),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Send data to your API
    }
  }
}
