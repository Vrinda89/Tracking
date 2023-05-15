import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tracking/di/injections.dart';

import '../../../data/repository/tracking_repository_impl.dart';

part 'tracker_state.dart';

class TrackerCubit extends Cubit<TrackerState> {
  TrackerCubit() : super(TrackerState(locationData: null));
  final LatLng _sourceLocation = const LatLng(9.54965098, 76.34051741);
  final LatLng _destinationLocation = const LatLng(9.49077523, 76.33588113);
  final _trackingRepo = TrackingRepositoryImpl(locator());
  int index = 0;
  bool isLocationFetchStarted = false;

  void getLocations() {
    if (!isLocationFetchStarted) {
      isLocationFetchStarted = true;
      Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        var location = _trackingRepo.getLocations()[index];
        index = index + 1;
        Map<String, dynamic> data = <String, dynamic>{};
        data.addAll({'latitude': location.latitude});
        data.addAll({'longitude': location.longitude});
        emit(TrackerState(locationData: LocationData.fromMap(data)));
      });
    }
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        emit(TrackerState(locationData: location));
      },
    );
  }

  LatLng getSourceLocation() => _sourceLocation;

  LatLng getDestinationLocation() => _destinationLocation;
}
