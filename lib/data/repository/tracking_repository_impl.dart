import 'package:tracking/data/model/location.dart';
import 'package:tracking/domain/repositories/tracking_repository.dart';

import '../source/location_mock.dart';

class TrackingRepositoryImpl extends TrackingRepository {

  final MockLocations mockLocations;

  TrackingRepositoryImpl(this.mockLocations);

  @override
  List<LocationModel> getLocations() {
      return mockLocations.getMockLocations();
  }
}
