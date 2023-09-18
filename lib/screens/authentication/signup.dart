import 'package:flutter/material.dart';
import 'package:treasury/resources/auth_method.dart';
import 'package:treasury/screens/authentication/login.dart';
import 'package:treasury/utils/error_dialog.dart';

import '../../helper/db_helper.dart';
import '../../services/auth/auth_exception.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final displayName = _usernameController.text;
                    try {
                      await AuthMethod().addNewUser(_usernameController.text,
                          _emailController.text, _passwordController.text);
                      //navigate
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    } on WeakPasswordAuthException {
                      showErrorDialog(context, 'Try a strong Password');
                    } on EmailAlreadyinUseAuthException {
                      showErrorDialog(context,
                          'A user is already Associated with this Email');
                    } on InvalidEmailAuthException {
                      showErrorDialog(
                          context, 'The Email you provided is invalid');
                    } on MissingPasswordAuthException {
                      showErrorDialog(context, 'Your password cannot be empty');
                    } on GenericAuthException {
                      showAboutDialog(context: context);
                    }
                  }
                },
                child: const Text('Register'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
