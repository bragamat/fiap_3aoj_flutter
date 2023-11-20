import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  final ApiServer authServer;

  AuthClient({required this.authServer});

  Future<void> authWithPassword({
    required String email,
    required String password,
  }) async {
    await authServer.signInWithEmailAndPassword(
      email,
      password,
    );
  }
}

abstract class ApiServer {
  // final apiClient = FirebaseAuth.instance;
  Future<UserCredential>? signInWithEmailAndPassword(
    String email,
    String password,
  );
}

class FirebaseApiConnector implements ApiServer {
  Future<UserCredential>? signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
