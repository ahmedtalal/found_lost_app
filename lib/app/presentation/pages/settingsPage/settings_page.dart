import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/changepassword_page_view.dart';
import 'package:found_lost_app/app/presentation/pages/settingsPage/widgets/settings_model_widget.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/userprofile_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  // static final controller = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: ScreenHandler.getScreenHeight(context),
      width: ScreenHandler.getScreenWidth(context),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(top: ScreenHandler.getScreenHeight(context) / 11),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 2.5),
                      ),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage(userImage),
                        height: 35,
                        width: 35,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ahmed Talal",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Edit Personal Details",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: appFont,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const UserProfilePage(),
                    );
                  },
                  child: const Icon(
                    Icons.chevron_right_rounded,
                    size: 32,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 30),
            const SettingHintBody(hint: "account"),
            SettingBodySections(
              title: "Found items",
              image: foundImg,
              color: Colors.teal,
              onClick: () {},
            ),
            const SizedBox(height: 10),
            SettingBodySections(
              title: "Lost items",
              image: lostImg,
              color: Colors.teal,
              onClick: () {},
            ),
            const SizedBox(height: 10),
            SettingBodySections(
              title: "My items",
              image: editUserImage,
              color: Colors.teal,
              onClick: () {},
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 80),
            const SettingHintBody(hint: "mode"),
            SettingBodySections(
              title: "Dark Mode",
              image: darkModeImage,
              color: Colors.red,
              onClick: () {},
            ),
            const SizedBox(height: 20),
            const SettingHintBody(hint: "Profile"),
            SettingBodySections(
              title: "Edit Profile",
              image: editUserImage,
              color: Colors.teal,
              onClick: () {
                Get.to(
                  () => const UserProfilePage(),
                );
              },
            ),
            const SizedBox(height: 10),
            SettingBodySections(
              title: "Change Password",
              image: changePasswordImage,
              color: Colors.purple,
              onClick: () {
                Get.to(() => const ChangePasswordPageView());
              },
            ),
            const SizedBox(height: 20),
            const SettingHintBody(hint: "App"),
            SettingBodySections(
              title: "Share App",
              image: shareAppImage,
              color: const Color.fromARGB(255, 188, 201, 41),
              onClick: () {},
            ),
            const SizedBox(height: 10),
            SettingBodySections(
              title: "Rating App",
              image: ratingAppImage,
              color: Colors.orange,
              onClick: () {},
            ),
            const SizedBox(height: 20),
            const SettingHintBody(hint: "follow us"),
            SettingBodySections(
              title: "privacy policy",
              image: privacypolicyImg,
              color: const Color.fromARGB(255, 47, 185, 152),
              onClick: () {},
            ),
            const SizedBox(height: 10),
            SettingBodySections(
              title: "contact us",
              image: contactusImg,
              color: const Color.fromARGB(255, 47, 185, 152),
              onClick: () {},
            ),
            const SizedBox(height: 10),
            SettingBodySections(
              title: "follow us",
              image: followusImg,
              color: const Color.fromARGB(255, 47, 185, 152),
              onClick: () {},
            ),
            const SizedBox(height: 10),
            GetBuilder<AuthController>(
                init: AuthController.instance,
                builder: (authController) {
                  return SettingBodySections(
                    title: "LogOut",
                    image: logoutImage,
                    color: const Color.fromARGB(255, 230, 65, 120),
                    onClick: () {
                      authController.onClickLogoutBtn();
                    },
                  );
                }),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "App ver 1.0.0",
                style: TextStyle(
                  fontFamily: appFont,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
