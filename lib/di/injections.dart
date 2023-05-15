import 'package:get_it/get_it.dart';
import 'package:tracking/di/tracking/tracking_injections.dart';

GetIt locator = GetIt.instance;

initInjections() async {
  await initTrackingInjections();
}
