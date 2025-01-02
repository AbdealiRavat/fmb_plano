import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/api_error_messages.dart';
import '../../../util/constant.dart';
import '../../../util/toast.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool flag = true.obs;
  String result = '';
  String fcmToken = '';
  RxString version = ''.obs;

  login(String its, String password) async {
    isLoading(true);
    int deviceType = Platform.isAndroid ? 1 : 0;
    final url = "${Constant.getData}$its&password=$password&device_id=XX&device_type=$deviceType";
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      });
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.contains('error')) {
          List<String> arr = response.body.split(":");
          String errorValue = arr[1];
          CommonToast.showDialog(errorValue);
        } else {
          isLoading(false);
          result = response.body;
          List<String> tempArray = result.split("||");
          String tempString = tempArray[2];

          List<String> tempArray2 = tempString.split("~~");
          String name = tempArray2[13];

          await SharedPrefs.setStringInfo('name', name);
          await SharedPrefs.setStringInfo('itsNo', its);
          await SharedPrefs.setStringInfo('password', password);
          await SharedPrefs.setStringInfo('result', response.body);
          await SharedPrefs.setIntroBool('isLoggedIn', true);
          Get.offAll(() => const HomeScreen(), arguments: ['home', 'Home']);
          CommonToast.showDialog('Welcome $name');
        }
      } else {
        isLoading(false);
        final errorMessage = ApiErrorMessages.getMessageFromStatusCode(response.statusCode);
        CommonToast.showDialog(errorMessage);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
    }
  }

  openMail() async {
    const url = 'fmbsingapore@gmail.com';
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: url,
    );

    launchUrl(emailLaunchUri);
  }

  getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version(packageInfo.version);
  }

  getFcmToken() {
    FirebaseMessaging.instance.getToken().then(
      (value) {
        fcmToken = value.toString();
      },
    );
  }
}
