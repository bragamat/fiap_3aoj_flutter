import 'package:better_workout/screens/login.dart';
import 'package:better_workout/screens/workouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum PopupMenuPages { logout }

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  checkChallengerLoggedIn(BuildContext context) async {
    final navigator = Navigator.of(context);
    await Firebase.initializeApp();

    if (FirebaseAuth.instance.currentUser == null) {
      navigator.pushNamedAndRemoveUntil(
        LoginPage.routeName,
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    checkChallengerLoggedIn(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          PopupMenuButton<PopupMenuPages>(
            onSelected: (PopupMenuPages val) async {
              final navigator = Navigator.of(context);
              switch (val) {
                case PopupMenuPages.logout:
                  await FirebaseAuth.instance.signOut();
                  navigator.pushNamedAndRemoveUntil(
                    HomePage.routeName,
                    (Route<dynamic> route) => false,
                  );
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<PopupMenuPages>>[
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.logout,
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'WorkoutsPage'),
                    builder: (context) => const WorkoutsPage(),
                  ),
                );
              },
              child: const Text('My Workouts'),
            )
          ],
        ),
      ),
    );
  }
}
