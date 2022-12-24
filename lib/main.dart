import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:found_lost_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:found_lost_app/app/presentation/routes/app_pages.dart';
import 'package:found_lost_app/app/presentation/themes/theme_controller.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController.instance,
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.theme,
          initialRoute: controller.onClickUserIsLogin(),
          getPages: AppPages.pages,
        );
      },
    );
  }
}
