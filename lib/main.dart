import 'package:flutter/material.dart';

import 'app.dart';
import 'injector.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  runApp(const App());
}
