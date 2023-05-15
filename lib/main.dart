import 'package:flutter/material.dart';

import 'di/injections.dart';
import 'tracker_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const TrackerApp());
}
