import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:found_lost_app/app/presentation/pages/auth/widgets/choice_auth_status_btn.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/logic/getx/userprofile_controller.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/text_form_field_shared_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  static var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: GetBuilder<UserProfileController>(
        init: UserProfileController.instance,
        builder: (controller) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 35),
                  Stack(
                    children: [
                      Container(
                        height: 95,
                        width: 95,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 3.5),
                        ),
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(userImage),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Positioned(
                        bottom: -8,
                        left: -12,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.photo_camera_sharp,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  ScreenHandler.getScreenHeight(context) / 25),
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
                                return controller
                                    .onValidateEditTextField(value!);
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
                                return controller
                                    .onValidateEditTextField(value!);
                              },
                              prefIcon: Icons.email,
                              textType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 13),
                          SizedBox(
                            height: ScreenHandler.getScreenHeight(context) / 13,
                            child: TextFormFieldSharedWidget(
                              hint: "Enter your phone number",
                              initialValue: "",
                              label: "phone number",
                              onChangeListenser: (String? newValue) {
                                controller.onChangePhone(newValue);
                              },
                              onValidateListenser: (String? value) {
                                return controller
                                    .onValidateEditTextField(value!);
                              },
                              prefIcon: Icons.phone,
                              textType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(height: 50),
                          ChoiceAuthStatusBtn(
                            controller: AuthController.instance,
                            title: "Save Changes",
                            formKey: formKey,
                            onClick: () {},
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
