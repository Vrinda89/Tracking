import 'package:flutter/material.dart';
import 'package:tracking/core/utils/palette.dart';

class DashBoardMenu extends StatelessWidget {
  const DashBoardMenu(
      {Key? key,
      required this.menuTitle,
      required this.imagePath,
      required this.id})
      : super(key: key);

  final String menuTitle;
  final String imagePath;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToPage(id, context);
      },
      child: Card(
        elevation: 6.0,
        color: Palette.bgSearchView,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 6.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image(
                width: 120,
                height: 120,
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                  flex: 1,
                  child: Text(menuTitle,
                      style: Theme.of(context).textTheme.titleMedium)),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToPage(String id, BuildContext context) {
    if (id == "1") {
      Navigator.pushNamed(context, '/tracking');
    }
  }
}
