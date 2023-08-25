import 'package:flutter/material.dart';
import 'package:treasury/screens/authentication/forgot_password.dart';
import 'package:treasury/screens/authentication/signup.dart';
import 'package:treasury/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login logic here
                    // For example: check credentials, navigate to next screen, etc.
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                    print(
                        "${_emailController.text}, ${_passwordController.text}");
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage()));
                      },
                      child: const Text("Forgot your password")),
                  Text(
                    "OR",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => const RegisterPage()));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      child: const Text("Register New Account")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
