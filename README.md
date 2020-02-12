# bourne_task

A Flutter project with the purpose of demoing some conclusions based on a list of data provided.

The only libraries that have been used here are:
http - future-based API for http requests, little boilerplate
mockito - mock dependencies for easier unit testing of services

Comments can be followed within app.dart, and a unit test for the http request can be seen in test/app_test.dart.

## Getting Started

From the project's root directory, type `flutter run` to launch the app on your choice of emulator or connected device.

On startup, the app will automatically retrieve and parse the data, and output a set of conclusions.

If any error occurs during the http request, it will be shown at the bottom of the screen. The user may then tap the `Fetch data again` button to perform the request again.

---

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.