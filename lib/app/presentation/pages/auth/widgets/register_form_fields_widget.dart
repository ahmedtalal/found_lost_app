// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/login_page_view.dart';
import 'package:get/get.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:found_lost_app/app/presentation/pages/auth/widgets/choice_auth_status_btn.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/text_form_field_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/text_link_shared_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    Key? key,
  }) : super(key: key);
  static var formKey = GlobalKey<FormState>();
  static bool? gender;
  static bool isMaleGender = false;
  static bool isFemaleGender = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController.instance,
      builder: (controller) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 25),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "app coder",
                  initialValue: "",
                  label: "UserName",
                  onChangeListenser: (String? newValue) {
                    controller.onChangeUserName(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.onValidateField(value);
                  },
                  prefIcon: Icons.person,
                  textType: TextInputType.name,
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "example@gmail.com",
                  initialValue: "",
                  label: "Email",
                  onChangeListenser: (String? newValue) {
                    controller.onChangeEmail(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.onValidateEmailField(value);
                  },
                  prefIcon: Icons.email,
                  textType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "sEamlk12#@?",
                  initialValue: "",
                  label: "password",
                  onChangeListenser: (String? newValue) {
                    controller.onChangePassword(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.validatePasswordField(value);
                  },
                  prefIcon: Icons.lock,
                  textType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 13,
                child: TextFormFieldSharedWidget(
                  hint: "sEamlk12#@?",
                  initialValue: "",
                  label: "Confirm Password",
                  onChangeListenser: (String? newValue) {
                    controller.onChangeConfirmPassword(newValue);
                  },
                  onValidateListenser: (String? value) {
                    return controller.onValidateConfirmPassword();
                  },
                  prefIcon: Icons.lock,
                  textType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(height: 25),
              ChoiceAuthStatusBtn(
                controller: controller,
                title: "Register",
                formKey: formKey,
                onClick: () {
                  controller.onClickRegisterBtn(formKey);
                },
              ),
              const SizedBox(height: 10),
              TextLinkSharedWidget(
                title: "Do your have an account ?",
                authTitle: "Login",
                onClick: () {
                  Get.off(() => const LoginPage());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
