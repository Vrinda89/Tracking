import '../../data/model/location.dart';

abstract class TrackingRepository {
  List<LocationModel> getLocations();
}
