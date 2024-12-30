import 'package:flutter/material.dart';
import 'package:fmb_app/components/app_drawer.dart';

import '../../../components/common_app_bar.dart';
import '../../../util/common.dart';

class HelplineScreen extends StatelessWidget {
  const HelplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppbar(title: 'Helpline'),
        drawer: AppDrawer(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Helpline',
              style: Common().mediumThemeblack,
            )
          ],
        )),
      ),
    );
  }
}
