import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/auth_page.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(10),
        color: customColor6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(mainLogo),
              width: 200,
              height: 200,
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 8),
            Container(
              alignment: Alignment.center,
              width: ScreenHandler.getScreenWidth(context) / 1,
              height: ScreenHandler.getScreenHeight(context) / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CustomTextSharedWidget(
                    textTitle: "Report Losses",
                    titleStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: appFont,
                      color: Colors.white,
                    ),
                  ),
                  CustomTextSharedWidget(
                    textTitle: "With goal a driven approach",
                    titleStyle: TextStyle(
                      fontSize: 17,
                      fontFamily: appFont,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
            TextBtnSharedWidget(
              title: "Get started",
              containerColor: Colors.white,
              textColor: Colors.blue,
              containerBorderColor: Colors.white,
              onClick: () {
                Get.to(() => const AuthPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
