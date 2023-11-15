import 'package:better_workout/screens/config.dart';
import 'package:better_workout/screens/home.dart';
import 'package:better_workout/screens/login.dart';
import 'package:better_workout/screens/workouts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BetterWorkoutApp());
}

class BetterWorkoutApp extends StatelessWidget {
  const BetterWorkoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Better Workout',
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        LoginPage.routeName: (_) => const LoginPage(),
        WorkoutsPage.routeName: (_) => const WorkoutsPage(),
        ConfigurationPage.routeName: (_) => const ConfigurationPage(),
      },
    );
  }
}
