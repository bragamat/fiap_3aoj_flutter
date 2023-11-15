import 'package:flutter/material.dart';

class ConfigurationPage extends StatelessWidget {
  static const routeName = "ConfigurationPage";
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Configuration Page')));
  }
}
