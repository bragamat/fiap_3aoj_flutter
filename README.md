# BetterWorkout
BetterWorkout is being developed in order to help you improve the most out of
your workout routines. Studies have shown that, in order to improve our training
sessions, we must periodize the cadence of each muscle group's stimuli keeping
track of intensity.

When you signup for BetterWorkout, you're called "Challenger". Each challenger
can have 10 workout plans at most and keep track of each workout plan
individually throughout its periodization.

## Secrets
Given that we use env vars to run our app integration with Firebase, make sure
to get all necessary secrets on `.env.example` with someone on our team!

## Getting Started

```bash
$ flutter pub get
```

```bash
$ make
```
## Specifications
- [x] Screens Navigation
- [x] StatelessWidget
- [x] StatefullWidget
- [x] Secrets Management
- [x] User Interaction
- [x] Form manipulation
- [x] Firebase Integration

---

## 1. Secrets Management 🤫
As a good practice we should never leak our secrets in our code base, thus
making us setting Environment Variables to make our firebase integration
available;
Flutter makes it easy to inject env vars from a given file or direct from the
CLI through `$ flutter run --dart-define-from-file=.env.json` and then we can
use it on our code like the example bellow:

```json FILE:.env.json
{
  "ANDROID_API_KEY": "<SOME_ANDROID_API_KEY>",
  "ANDROID_APP_ID": "<SOME_ANDROID_APP_ID>",
  "ANDROID_MESSAGING_SENDER_ID": "<SOME_ANDROID_MESSAGING_SENDER_ID>",
  "ANDROID_PROJECT_ID": "<SOME_ANDROID_PROJECT_ID>",
  "ANDROID_STORAGE_BUCKET": "<SOME_ANDROID_STORAGE_BUCKET>",
  "IOS_API_KEY": "<SOME_IOS_API_KEY>",
  "IOS_APP_ID": "<SOME_IOS_APP_KEY>",
  "IOS_MESSAGING_SENDER_ID": "<SOME_IOS_MESSAGING_SENDER_ID>",
  "IOS_PROJECT_ID": "<SOME_IOS_PROJECT_ID>",
  "IOS_STORAGE_BUCKET": "<SOME_IOS_STORAGE_BUCKET>",
  "IOS_BUNDLE_ID": "<SOME_IOS_BUNDLE_ID>"
}
```

```dart
 static const FirebaseOptions android = FirebaseOptions(
    apiKey: String.fromEnvironment('ANDROID_API_KEY'),
    appId: String.fromEnvironment('ANDROID_APP_ID'),
    messagingSenderId: String.fromEnvironment('ANDROID_MESSAGING_SENDER_ID'),
    projectId: String.fromEnvironment('ANDROID_PROJECT_ID'),
    storageBucket: String.fromEnvironment('ANDROID_STORAGE_BUCKET'),
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: String.fromEnvironment('IOS_API_KEY'),
    appId: String.fromEnvironment('IOS_APP_ID'),
    messagingSenderId: String.fromEnvironment('IOS_MESSAGING_SENDER_ID'),
    projectId: String.fromEnvironment('IOS_PROJECT_ID'),
    storageBucket: String.fromEnvironment('IOS_STORAGE_BUCKET'),
    iosBundleId: String.fromEnvironment('IOS_BUNDLE_ID'),
  );
```
---

## 2. Protected Home Screen ❗

In order to access the Home Screen, a challenger must be signed in! We added a
callback verification at the build method so we navigate them back to the login
page popping the whole stack so they can not press the back button and get back
to the home screen in some weird way

---

## 3. Firebase Integration 👑
We used firebase ecosystem to authenticate and manage our users; Firebase Auth
- Firebase Core;
- Firebase Auth;

---

## 4. Testing
We used a few libraries to run our tests:
- Mockito - To help us mock ous System Under test;
- Faker - To help us create fake data so our tests output can make more sense;
- Test - Defaults flutter testing library;

## 5. SQFlite Cache 🪶 -- TODO:
