import 'package:better_workout/screens/config.dart';
import 'package:better_workout/screens/home.dart';
import 'package:better_workout/screens/login.dart';
import 'package:better_workout/screens/new_workout.dart';
import 'package:better_workout/screens/workouts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BetterWorkoutApp());
}

class BetterWorkoutApp extends StatelessWidget {
  const BetterWorkoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Better Workout',
      initialRoute: LoginPage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        LoginPage.routeName: (_) => const LoginPage(),
        WorkoutsPage.routeName: (_) => const WorkoutsPage(),
        NewWorkoutPage.routeName: (_) => const NewWorkoutPage(),
        ConfigurationPage.routeName: (_) => const ConfigurationPage(),
      },
    );
  }
}
