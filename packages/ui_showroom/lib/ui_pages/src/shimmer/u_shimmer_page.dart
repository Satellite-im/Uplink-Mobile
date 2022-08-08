import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UShimmerPage extends StatelessWidget {
  const UShimmerPage({Key? key}) : super(key: key);
  static const routeName = '/UShimmer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(routeName.substring(1)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('UShimmer.dark'),
              UShimmer.dark(
                  child: URectContainer(
                height: 20,
              )),
              Text('UShimmer.med'),
              UShimmer.med(
                  child: URectContainer(
                height: 20,
              )),
              Text('UShimmer.light'),
              UShimmer.light(
                  child: URectContainer(
                height: 20,
              )),
              Text('UShimmer.white'),
              UShimmer.white(
                  child: URectContainer(
                height: 20,
              )),
            ],
          ),
        ));
  }
}
