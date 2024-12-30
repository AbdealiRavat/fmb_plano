import 'package:flutter/material.dart';

import '../../../components/app_drawer.dart';
import '../../../components/common_app_bar.dart';
import '../../../util/common.dart';

class ThaaliSignupScreen extends StatelessWidget {
  const ThaaliSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppbar(title: 'Thaali Signup'),
        drawer: AppDrawer(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thaali Signup',
              style: Common().mediumThemeblack,
            )
          ],
        )),
      ),
    );
  }
}
