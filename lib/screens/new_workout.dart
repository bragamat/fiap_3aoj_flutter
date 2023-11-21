import 'package:flutter/material.dart';

class NewWorkoutPage extends StatelessWidget {
  static const routeName = "NewWorkoutPage";
  const NewWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Workout +'),
      ),
    );
  }
}
