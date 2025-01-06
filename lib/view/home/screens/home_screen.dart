import 'package:flutter/material.dart';
import 'package:fmb_app/components/app_drawer.dart';
import 'package:fmb_app/components/common_app_bar.dart';
import 'package:fmb_app/view/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  late final WebViewController controller;
  @override
  void initState() {
    // late final PlatformWebViewControllerCreationParams params;
    // if (WebViewPlatform.instance is WebKitWebViewPlatform) {
    //   params = WebKitWebViewControllerCreationParams(
    //       allowsInlineMediaPlayback: true,
    //       mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{});
    // } else {
    //   params = const PlatformWebViewControllerCreationParams();
    // }
    // final WebViewController cc = WebViewController.fromPlatformCreationParams(params);
    // controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            homeController.progress.value = progress.toDouble();
            debugPrint('webview is loading $progress}');
          },
          onPageStarted: (url) {
            debugPrint('page started loading ${homeController.webViewUrl.value}');
          },
          onPageFinished: (url) {
            debugPrint('page finished loading ${homeController.webViewUrl.value}');
          },
          onHttpError: (error) {
            debugPrint('page load error $error');

          },
          // onNavigationRequest: (navigation) {
          //   if (navigation.url != homeController.webViewUrl.value) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      // ..loadRequest(Uri.parse('https://flutter.dev'));
      ..loadRequest(Uri.parse(homeController.webViewUrl.value));
    // controller = cc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppbar(title: homeController.screenTitle.value),
        drawer: AppDrawer(),
        body: Column(children: [
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(controller: controller),
                Obx(() => homeController.progress.value < 100
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(AppColors.primary),
                        ),
                      )
                    : const SizedBox())
              ],
            ),
          )
        ]),
      ),
    );
  }
}
