import 'package:better_workout/betterworkout/auth/auth_with_password.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';

class AuthPlatformSpy extends Mock implements ApiServer {}

void main() {
  String email;
  String password;
  ApiServer apiClient;

  setUp(() {
    email = faker.internet.email();
    password = faker.internet.password();
    apiClient = AuthPlatformSpy();
    // final apiClient = FirebaseAuth.instance;
  });

  test('Authentaticates with email and password using api client', () async {
    email = faker.internet.email();
    password = faker.internet.password();
    apiClient = AuthPlatformSpy();

    final authClient = AuthClient(authServer: apiClient);

    await authClient.authWithPassword(
      email: email,
      password: password,
    );

    verify(
      apiClient.signInWithEmailAndPassword(
        email,
        password,
      ),
    );
  });
}
