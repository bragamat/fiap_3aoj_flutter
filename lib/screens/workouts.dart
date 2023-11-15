import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  static const routeName = "WorkoutsPage";
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Workouts Page')));
  }
}
