import 'package:tracking/data/source/location_mock.dart';
import '../injections.dart';

initTrackingInjections() {
  locator.registerLazySingleton<MockLocations>(() => MockLocations());
}
