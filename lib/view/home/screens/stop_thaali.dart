import 'package:flutter/material.dart';

import '../../../components/app_drawer.dart';
import '../../../components/common_app_bar.dart';
import '../../../util/common.dart';

class StopThaali extends StatelessWidget {
  const StopThaali({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppbar(title: 'Stop Thaali'),
        drawer: AppDrawer(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Stop Thaali',
              style: Common().mediumThemeblack,
            )
          ],
        )),
      ),
    );
  }
}
