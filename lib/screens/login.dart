import 'package:better_workout/betterworkout/auth/client.dart';
import 'package:better_workout/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "LoginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                controller: _emailController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email *',
                    hintText: "Enter your email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                enableSuggestions: false,
                autocorrect: false,
                controller: _passwordController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password *',
                    hintText: "Enter your password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    final auth = AuthClient(authServer: FirebaseApiConnector());
                    final navigator = Navigator.of(context);
                    final notifier = ScaffoldMessenger.of(context);
                    try {
                      await auth.authWithPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      navigator.pushNamedAndRemoveUntil(
                        HomePage.routeName,
                        (Route<dynamic> route) => false,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                        notifier.showSnackBar(
                          const SnackBar(
                            content: Text('Invalid Credentials'),
                          ),
                        );
                      } else {
                        notifier.showSnackBar(
                          const SnackBar(
                            content: Text('Try again later - Invalid API KEY'),
                          ),
                        );
                      }
                    }
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
