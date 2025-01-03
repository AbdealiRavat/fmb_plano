import 'package:get/get.dart';

import '../../../routes/routes_name.dart';
import '../../../util/constant.dart';
import '../model/list_model.dart';

class HomeController extends GetxController {
  RxDouble progress = 0.0.obs;
  RxList<DrawerListModel> drawerList = <DrawerListModel>[
    DrawerListModel(index: 0, title: 'Home', urlName: 'home', icon: 'asset/icons/home.png'),
    DrawerListModel(
        index: 1, title: 'Stop Thaali', urlName: 'startstop', icon: 'asset/icons/thaali.png'),
    DrawerListModel(
        index: 2,
        title: 'Thaali Change Req.',
        urlName: 'thaalichangereq',
        icon: 'asset/icons/change.png'),
    DrawerListModel(
        index: 3, title: 'Monthly Menu', urlName: 'monthmenu', icon: 'asset/icons/thaali.png'),
    DrawerListModel(
        index: 4, title: 'My profile', urlName: 'mumininfo', icon: 'asset/icons/menu.png'),
    DrawerListModel(
        index: 5, title: 'Feedback', urlName: 'feedback', icon: 'asset/icons/feedback.png'),
    DrawerListModel(
        index: 6, title: 'FMB Helpline', urlName: 'helpline', icon: 'asset/icons/helpline.png'),
    DrawerListModel(index: 7, title: 'Jamaat News', urlName: 'news', icon: 'asset/icons/news.png'),
    DrawerListModel(index: 8, title: 'Exit', urlName: 'exit', icon: 'asset/images/logout1.png'),
    // DrawerListModel(index: 7, title: 'Filling', icon: 'asset/icons/thaali.png'),
  ].obs;

  RxList<bool> isSelected = List<bool>.filled(9, false).obs;
  RxInt selectedIndex = 0.obs;
  String its = '';
  String password = '';
  String result = '';
  String screenName = '';
  RxString screenTitle = ''.obs;

  RxString webViewUrl = ''.obs;

  @override
  void onInit() {
    screenName = Get.arguments[0];
    screenTitle.value = Get.arguments[1];
    getUserInfo();
    setUrl();
    super.onInit();
  }

  getUserInfo() {
    its = SharedPrefs.getStringInfo('itsNo');
    password = SharedPrefs.getStringInfo('password');
    result = SharedPrefs.getStringInfo('result');
  }

  setUrl() {
    String url = '${Constant.baseURL}$screenName.aspx?notab=Y&companyid=8&noheader=Y&sabeelno=';
    webViewUrl.value = '$url$its&loginpwd=$password&mobile=Y&masterdata=$result';
  }

  logout() {
    Get.offNamed(RouteName.loginScreen);
    SharedPrefs.setIntroBool('isLoggedIn', false);
    SharedPrefs.remove('name');
    SharedPrefs.remove('password');
    SharedPrefs.remove('itsNo');
    SharedPrefs.remove('result');
  }
}
