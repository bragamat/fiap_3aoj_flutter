import 'package:better_workout/db/client.dart';
import 'package:sqflite/sqlite_api.dart';

class Challenger {
  final String id;
  final String email;
  final String name;

  Challenger(this.id, this.email, this.name);
}

class ChallengerRepository {
  late Database db;
  late Challenger challenger;

  ChallengerRepository() {
    db = DB.instance.database;
  }

  updateOrCreateByEmail(String email) async {
    var rows = await db.rawQuery(
      '''
    SELECT * FROM challengers
    WHERE email = ?;
    ''',
      [email],
    );

    if (rows[1] == null) {
      // update auth_token
    }
  }

  findOrCreateByEmail(String email) async {
    return await db.rawQuery(
      '''
    SELECT * FROM challengers
    WHERE email = ?;
    ''',
      [email],
    );
  }
}
