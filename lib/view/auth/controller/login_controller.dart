import 'dart:convert';

import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../util/api_error_messages.dart';
import '../../../util/constant.dart';
import '../../../util/toast.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool flag = false.obs;

  login(String its, String password) async {
    isLoading(true);
    final body = jsonEncode({"username": its, "password": password});
    try {
      http.Response response = await http.post(Uri.parse(Constant.apiURL), body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      });
      print(response.body);
      // LoginModel model = LoginModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        isLoading(false);
        // userDetails.add(model.data!.userDetails!);
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setBool(Constant.isLoggedIn, true);
        Get.to(() => const HomeScreen());
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
}
