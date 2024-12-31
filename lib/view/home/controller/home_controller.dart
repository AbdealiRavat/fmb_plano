import 'package:get/get.dart';

import '../model/list_model.dart';

class HomeController extends GetxController {
  // RxList<bool> isSelected = <bool>[].obs;
  RxList<DrawerListModel> drawerList = <DrawerListModel>[
    DrawerListModel(index: 0, title: 'Home', icon: 'asset/images/home1.png'),
    DrawerListModel(index: 1, title: 'Monthly Menu', icon: 'asset/images/menus1.png'),
    DrawerListModel(index: 2, title: 'Thaali Signup', icon: 'asset/images/signup1.png'),
    DrawerListModel(index: 3, title: 'Stop Thaali', icon: 'asset/images/stop1.png'),
    DrawerListModel(index: 4, title: 'My profile', icon: 'asset/images/profile2.png'),
    DrawerListModel(index: 5, title: 'Feedback', icon: 'asset/images/feedback1.png'),
    DrawerListModel(index: 6, title: 'Helpline', icon: 'asset/images/helpline1.png'),
    DrawerListModel(index: 7, title: 'Filling', icon: 'asset/images/thaali1.png'),
    DrawerListModel(index: 8, title: 'Exit', icon: 'asset/images/logout1.png'),
  ].obs;

  RxList<bool> isSelected = List<bool>.filled(9, false).obs;
  RxInt selectedIndex = 0.obs;
}
