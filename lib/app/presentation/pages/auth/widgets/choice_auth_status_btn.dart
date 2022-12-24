import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/Text_btn_shared_widget.dart';

class ChoiceAuthStatusBtn extends StatelessWidget {
  final AuthController controller;
  final String title;
  final GlobalKey<FormState> formKey;
  final Function()? onClick;
  const ChoiceAuthStatusBtn({
    required this.title,
    required this.formKey,
    required this.controller,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isLoadingIcon == true) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Align(
        alignment: Alignment.center,
        child: TextBtnSharedWidget(
          title: title,
          containerColor: customeColor3,
          textColor: Colors.white,
          containerBorderColor: customeColor3,
          onClick: onClick,
        ),
      );
    }
  }
}
