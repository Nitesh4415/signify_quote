import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  // Needed for executing platform channels functions properly.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
