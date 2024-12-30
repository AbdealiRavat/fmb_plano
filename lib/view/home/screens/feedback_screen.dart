import 'package:flutter/material.dart';

import '../../../components/app_drawer.dart';
import '../../../components/common_app_bar.dart';
import '../../../util/common.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppbar(title: 'Feedback'),
        drawer: AppDrawer(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Feedback',
              style: Common().mediumThemeblack,
            )
          ],
        )),
      ),
    );
  }
}
