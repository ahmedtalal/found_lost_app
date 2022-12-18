import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:social_media_network/app/config/screen_handler.dart';
import 'package:social_media_network/app/core/constants/app_colors.dart';
import 'package:social_media_network/app/core/constants/strings.dart';
import 'package:social_media_network/app/presentation/pages/auth/views/auth_page.dart';
import 'package:social_media_network/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:social_media_network/app/presentation/shared/widgets/custom_text_shared_widget.dart';

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
            const CustomTextSharedWidget(
              textTitle: "Found App",
              titleStyle: TextStyle(
                fontSize: 50,
                fontFamily: appFont,
                color: Colors.white,
              ),
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 4),
            Container(
              alignment: Alignment.center,
              width: ScreenHandler.getScreenWidth(context) / 1,
              height: ScreenHandler.getScreenHeight(context) / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CustomTextSharedWidget(
                    textTitle: "Found and Lost",
                    titleStyle: TextStyle(
                      fontSize: 30,
                      fontFamily: appFont,
                      color: Colors.white,
                    ),
                  ),
                  CustomTextSharedWidget(
                    textTitle: "With goal a driven approach",
                    titleStyle: TextStyle(
                      fontSize: 25,
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