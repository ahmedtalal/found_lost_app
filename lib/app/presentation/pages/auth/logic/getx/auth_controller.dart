import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  static AuthController _authController = AuthController._internal();
  AuthController._internal();
  static AuthController get instance => _authController;

  String userName = '';
  String email = '';
  String password = '';
  String newPassword = '';
  String phone = '';
  bool isLoadingIcon = false;

  onChangeUserName(String? value) {
    userName = value!;
    update();
  }

  onChangeEmail(String? value) {
    email = value!;
  }

  onChangePassword(String? value) {
    password = value!;
    update();
  }

  onChangeNewPassword(String? value) {
    newPassword = value!;
    update();
  }

  onChangePhone(String? value) {
    phone = value!;
    update();
  }

  String? onValidateField(String? value) {
    if (value!.isEmpty) {
      return "this field is required";
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 11 || newValue.contains(RegExp(r'[A-Z]'))) {
      return "your phone is not validate and may be wrong ";
    } else if (newValue.substring(0, 3) == "011" ||
        newValue.substring(0, 3) == "012" ||
        newValue.substring(0, 3) == "015" ||
        newValue.substring(0, 3) == "010") {
      return null;
    }
    return null;
  }

  String? validatePasswordField(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 5 && !newValue.contains(RegExp(r'[A-Z]'))) {
      return "weak password or must contain numbers and letters and @,#";
    }
    return null;
  }

  String? onValidateEmailField(String? value) {
    if (value!.isEmpty) {
      return "this field is required";
    } else if (!value.contains("@")) {
      return "this email is invalid";
    } else {
      return null;
    }
  }

  onClickLoginBtn(GlobalKey<FormState> key) {}

  onClickRegisterBtn(GlobalKey<FormState> key) {}

  onClickLogoutBtn() {}

  onClickChangePassword(GlobalKey<FormState> formKey) {}

  // this is private method for class
  _loadingIcon(bool value) {
    isLoadingIcon = value;
    update();
  }
}
