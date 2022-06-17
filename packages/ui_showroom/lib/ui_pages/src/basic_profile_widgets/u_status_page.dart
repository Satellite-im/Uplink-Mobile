import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UStatusPage extends StatelessWidget {
  const UStatusPage({Key? key}) : super(key: key);

  static const routeName = '/UStatus';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: [
                UStatusIndicator(
                  Status.online,
                  userProfileSize: UUserProfileSize.normal,
                ),
                const SizedBox.square(
                  dimension: 16,
                ),
                UStatusIndicator(
                  Status.idle,
                  userProfileSize: UUserProfileSize.normal,
                ),
                const SizedBox.square(
                  dimension: 16,
                ),
                UStatusIndicator(
                  Status.offline,
                  userProfileSize: UUserProfileSize.normal,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 24,
            ),
            Row(
              children: const [
                UStatusText(
                  status: Status.online,
                ),
                SizedBox.square(
                  dimension: 16,
                ),
                UStatusText(
                  status: Status.idle,
                ),
                SizedBox.square(
                  dimension: 16,
                ),
                UStatusText(
                  status: Status.offline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
