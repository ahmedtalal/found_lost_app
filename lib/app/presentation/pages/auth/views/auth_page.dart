import 'package:flutter/material.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/auth_phone_number_page.dart';
import 'package:get/route_manager.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/login_page_view.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/register_page_view.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_icon_btn_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: customColor6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: ScreenHandler.getScreenHeight(context) / 8),
                    const Center(
                      child:  Image(
                        image: AssetImage(mainLogo),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(
                        height: ScreenHandler.getScreenHeight(context) / 20),
                    const CustomTextSharedWidget(
                      textTitle: "Create a",
                      titleStyle: TextStyle(
                        fontSize: 30,
                        fontFamily: appFont,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const CustomTextSharedWidget(
                      textTitle: "New Account",
                      titleStyle: TextStyle(
                        fontSize: 30,
                        fontFamily: appFont,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const CustomTextSharedWidget(
                    textTitle: "Sign Up With",
                    titleStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: appFont,
                      color: customColor7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 30),
                  TextBtnSharedWidget(
                    title: "Mobile Number",
                    containerColor: Colors.white,
                    textColor: customColor8,
                    containerBorderColor: customColor8,
                    onClick: () {
                      Get.to(
                        () => const AuthPhoneNumberPage(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextBtnSharedWidget(
                    title: "Email",
                    containerColor: Colors.white,
                    textColor: customColor8,
                    containerBorderColor: customColor8,
                    onClick: () {
                      Get.to(() => const RegisterPage());
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomIconBtnSharedWidget(
                    title: "Google",
                    containerColor: Colors.white,
                    textColor: Colors.blue,
                    containerBorderColor: customColor8,
                    onClick: () {},
                    icon: googleImg,
                  ),
                  const SizedBox(height: 20),
                  const CustomTextSharedWidget(
                    textTitle: "OR",
                    titleStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: appFont,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextBtnSharedWidget(
                    title: "Login",
                    containerColor: customColor6,
                    textColor: Colors.white,
                    containerBorderColor: customColor6,
                    onClick: () {
                      Get.to(() => const LoginPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
