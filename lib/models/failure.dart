import 'package:flutter/foundation.dart';

class Failure extends Error {
  Failure({@required this.message});

  final String message;
}
