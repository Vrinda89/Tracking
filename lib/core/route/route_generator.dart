import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking/presentation/pages/home/tracker_home.dart';
import 'package:tracking/presentation/pages/tracking/tracking_page.dart';

import '../../presentation/blocs/home/tracker_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const TrackerHomePage(),
        );
      case '/tracking':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<TrackerCubit>(
            create: (context) => TrackerCubit(),
            child: const TrackingPage(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
