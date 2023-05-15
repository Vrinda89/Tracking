import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tracking/core/res/icons.dart';
import 'package:tracking/core/res/strings.dart';
import 'package:tracking/core/utils/palette.dart';

import '../../blocs/home/tracker_cubit.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);
  static const routeName = '/tracking';

  @override
  State<StatefulWidget> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;

  @override
  void initState() {
    getPolyPoints();
    setCustomMarkerIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TrackerCubit>(context).getCurrentLocation();
    BlocProvider.of<TrackerCubit>(context).getLocations();
    return BlocBuilder<TrackerCubit, TrackerState>(
      builder: (context, state) {
        if (state.locationData != null) {
          updateCurrentLocation(state.locationData!);
          updateLocation(currentLocation!);
        }
        return currentLocation == null
            ? Container(
                color: Palette.bgSearchView,
                child: Center(
                    child: Text(AppStrings.loadingMessage,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Palette.divider))))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 15.5),
                markers: {
                  Marker(
                    markerId: const MarkerId(AppStrings.currentLocation),
                    icon: currentLocationIcon,
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                  ),
                  Marker(
                    markerId: const MarkerId(AppStrings.source),
                    icon: sourceIcon,
                    position: BlocProvider.of<TrackerCubit>(context)
                        .getSourceLocation(),
                  ),
                  Marker(
                    markerId: const MarkerId(AppStrings.destination),
                    icon: destinationIcon,
                    position: BlocProvider.of<TrackerCubit>(context)
                        .getDestinationLocation(),
                  ),
                },
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
                polylines: {
                  Polyline(
                    polylineId: const PolylineId(AppStrings.route),
                    points: polylineCoordinates,
                    color: const Color(0xFF7B61FF),
                    width: 6,
                  ),
                },
              );
      },
    );
  }

  Future<void> updateLocation(LocationData locationData) async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 15.5,
          target: LatLng(
            locationData.latitude!,
            locationData.longitude!,
          ),
        ),
      ),
    );
  }

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppStrings.apiKeys, // Your Google Map Key
      PointLatLng(TrackerCubit().getSourceLocation().latitude,
          TrackerCubit().getSourceLocation().longitude),
      PointLatLng(TrackerCubit().getDestinationLocation().latitude,
          TrackerCubit().getDestinationLocation().longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      //update state for drawing polygon
    }
  }

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, AppIcons.iconSource)
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, AppIcons.iconDestination)
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, AppIcons.iconCurrentLocation)
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  void updateCurrentLocation(LocationData locationData) {
    currentLocation = locationData;
  }
}
