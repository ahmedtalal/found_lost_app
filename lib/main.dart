import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_network/app/presentation/routes/app_pages.dart';
import 'package:social_media_network/app/presentation/routes/app_routes.dart';
import 'package:social_media_network/app/presentation/themes/theme_controller.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.theme,
      initialRoute: AppRoutes.splashScreenRoute,
      getPages: AppPages.pages,
    );
  }
}
