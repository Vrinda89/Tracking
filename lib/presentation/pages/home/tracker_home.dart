import 'package:flutter/material.dart';
import 'package:tracking/core/res/icons.dart';
import 'package:tracking/core/res/strings.dart';
import 'package:tracking/presentation/pages/home/dashboard_menu.dart';

class TrackerHomePage extends StatefulWidget {
  const TrackerHomePage({Key? key}) : super(key: key);

  @override
  State<TrackerHomePage> createState() => _TrackerHomePageState();
}

class _TrackerHomePageState extends State<TrackerHomePage> {
  void navigateToTracking() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(AppStrings.dashBoardTitle)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16),
              children: const [
                DashBoardMenu(
                    id: "1",
                    menuTitle: AppStrings.liveTracking,
                    imagePath: AppIcons.iconLiveTracking),
                //Tracking history can be added as a functionality as an enhancement for future reference of every trip
                DashBoardMenu(
                  id: "2",
                  menuTitle: AppStrings.transactionHistory,
                  imagePath: AppIcons.iconTrackingHistory,
                )
              ]),
        ),
      ),
    );
  }
}
