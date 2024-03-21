import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';



void main() {
  // Needed for executing platform channels functions properly.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

// Future<void> main() async{
// runZonedGuarded<Future<void>>(()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const App());
//   FlutterError.onError=(FlutterErrorDetails errorDetails)
// });

