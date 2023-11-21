import 'package:better_workout/screens/new_workout.dart';
import 'package:flutter/material.dart';

enum PopupMenuPages { newWorkout }

class WorkoutsPage extends StatelessWidget {
  static const routeName = "WorkoutsPage";
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workouts Page'), actions: [
        PopupMenuButton<PopupMenuPages>(
          onSelected: (PopupMenuPages val) {
            final navigator = Navigator.of(context);
            switch (val) {
              case PopupMenuPages.newWorkout:
                navigator.pushNamedAndRemoveUntil(
                  NewWorkoutPage.routeName,
                  (Route<dynamic> route) => false,
                );
                break;
              default:
            }
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<PopupMenuPages>>[
              const PopupMenuItem<PopupMenuPages>(
                value: PopupMenuPages.newWorkout,
                child: Text('New workout'),
              ),
            ];
          },
        ),
      ]),
    );
  }
}
