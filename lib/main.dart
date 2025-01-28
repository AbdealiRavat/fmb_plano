import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb_app/routes/app_routes.dart';
import 'package:fmb_app/routes/routes_name.dart';
import 'package:fmb_app/util/constant.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDM8J5MyZGydxG8TZhlHWUzRaEIC6PjL54",
          appId: "1:45099362023:android:d9cff37fd8dc74f414a442",
          messagingSenderId: "45099362023",
          projectId: "fmb-singapore"));

  FirebaseMessaging.onBackgroundMessage(bgHandler);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPrefs.init();
  runApp(const MyApp());
}

Future<void> bgHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.data);
  print('message.data');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fade,
            title: 'FMB Singapore',
            getPages: Routes.route(),
            initialRoute: RouteName.splash,
          );
        });
  }
}
