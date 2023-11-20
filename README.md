# BetterWorkout

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
---

## Secrets Management
As a good practice we should never leak our secrets in our code base, thus
making us setting Environment Variables to make our firebase integration
available;
Flutter makes it easy to inject env vars from a given file or direct from the
CLI through `$ flutter run --dart-define-from-file=.env.json`;

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
