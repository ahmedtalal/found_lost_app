import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/text_form_field_shared_widget.dart';

class ChangePasswordPageView extends StatelessWidget {
  const ChangePasswordPageView({Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
          init: AuthController.instance,
          builder: (controller) {
            return Container(
              width: ScreenHandler.getScreenWidth(context),
              height: ScreenHandler.getScreenHeight(context),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Change Password",
                        style: TextStyle(
                          fontFamily: appFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 13),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormFieldSharedWidget(
                          label: "old password",
                          hint: "old password",
                          textType: TextInputType.visiblePassword,
                          prefIcon: Icons.lock,
                          onChangeListenser: (String? newValue) {
                            controller.onChangePassword(newValue);
                          },
                          onValidateListenser: (String? value) {
                            return controller.validatePasswordField(value);
                          },
                          initialValue: "",
                        ),
                        const SizedBox(height: 15),
                        TextFormFieldSharedWidget(
                          label: "new password",
                          hint: "new password",
                          textType: TextInputType.visiblePassword,
                          prefIcon: Icons.lock,
                          onChangeListenser: (String? newValue) {
                            controller.onChangeConfirmPassword(newValue);
                          },
                          onValidateListenser: (String? value) {
                            return controller.validatePasswordField(value);
                          },
                          initialValue: "",
                        ),
                        SizedBox(
                            height:
                                ScreenHandler.getScreenHeight(context) / 14),
                        TextBtnSharedWidget(
                          title: "Change Password",
                          containerColor: customeColor3,
                          textColor: Colors.white,
                          containerBorderColor: customeColor3,
                          onClick: () {
                            controller.onClickChangePassword(formKey);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
