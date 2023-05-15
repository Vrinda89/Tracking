part of 'tracker_cubit.dart';

class TrackerState {
  LocationData? locationData;
  List<LatLng>? polylineCoordinates;

  TrackerState({this.locationData, this.polylineCoordinates});
}
