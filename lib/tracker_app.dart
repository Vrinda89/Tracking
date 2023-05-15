import 'package:flutter/material.dart';
import 'core/route/route_generator.dart';
import 'core/theme/app_theme.dart';

class TrackerApp extends StatelessWidget {
  const TrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BLoC',
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


