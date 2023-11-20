import 'package:meta/meta.dart';

import 'package:better_workout/betterworkout/entities/workout.dart';

abstract class CloneWorkout {
  Future<Workout> clone({
    @required String workoutId,
    @required String name,
  });
}
