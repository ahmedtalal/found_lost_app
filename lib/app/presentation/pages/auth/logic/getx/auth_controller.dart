import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/user_model.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_auth_repository_imp.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_user_repository_imp.dart';
import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:found_lost_app/app/domain/usecases/auth/auth_usecases.dart';
import 'package:found_lost_app/app/domain/usecases/user/user_usecases.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/register_page_view.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/verify_phone_number_page.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/home_page.dart';
import 'package:found_lost_app/app/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:found_lost_app/app/presentation/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static final AuthController _authController = AuthController._internal();
  AuthController._internal();
  static AuthController get instance => _authController;

  String userName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String phone = '';
  bool isLoadingIcon = false;

  onChangeUserName(String? value) {
    userName = value!;
    update();
  }

  onChangeEmail(String? value) {
    email = value!;
    update();
  }

  onChangePassword(String? value) {
    password = value!;
    update();
  }

  onChangeConfirmPassword(String? value) {
    confirmPassword = value!;
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

  String? onValidateConfirmPassword() {
    if (confirmPassword != password) {
      return "password not matching";
    } else {
      return null;
    }
  }

  onClickLoginBtn(GlobalKey<FormState> key) async {
    UserEntity userEntity = UserEntity(email: email, password: password);
    if (key.currentState!.validate()) {
      _loadingIcon(true);
      final result = await LoginUseCases.instance
          .call(userEntity, FireAuthRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        Get.offAll(() => const HomePage());
        _loadingIcon(false);
      } else {
        _loadingIcon(false);
        Get.snackbar(
          "auth Exception",
          result[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customColor6,
          colorText: Colors.white,
          borderRadius: 15,
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: const Icon(Icons.error),
          messageText: Text(
            result[mapValue].toString(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: const Text(
            "auth Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } else {
      _loadingIcon(false);
    }
  }

  onClickRegisterBtn(GlobalKey<FormState> key) async {
    UserEntity userEntity = UserEntity(
      userName: userName,
      email: email,
      password: password,
      bioInfo: " ",
      phone: " ",
      address: " ",
      image: " ",
    );
    if (key.currentState!.validate()) {
      _loadingIcon(true);
      final result = await RegisterUseCase.instance
          .call(userEntity, FireAuthRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        Get.offAll(() => const HomePage());
        _loadingIcon(false);
      } else {
        _loadingIcon(false);
        Get.snackbar(
          "auth Exception",
          result[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customColor6,
          colorText: Colors.white,
          borderRadius: 15,
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: const Icon(Icons.error),
          messageText: Text(
            result[mapValue].toString(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: const Text(
            "auth Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } else {
      _loadingIcon(false);
    }
  }

  onClickLogoutBtn() async {
    _loadingIcon(false);
    final result =
        await LogOutUseCase.instance.call(FireAuthRepositoryImp.instance);
    if (result[mapKey].toString().toLowerCase() == "success") {
      Get.offAll(() => const SplashScreenPage());
    }
  }

  onClickUserIsLogin() {
    return CheckIsAuthUseCase.instance.call(FireAuthRepositoryImp.instance)
        ? AppRoutes.homeScreenRoute
        : AppRoutes.splashScreenRoute;
  }

  onClickChangePassword(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      _loadingIcon(true);
      final result = await UpdatePasswordUseCase.instance
          .call(password, confirmPassword, FireAuthRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        await FirebaseAuth.instance.signOut();
        Get.offAll(() => const RegisterPage());
        _loadingIcon(false);
      } else {
        _loadingIcon(false);
        return Get.snackbar(
          "auth Exception",
          result[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customColor6,
          colorText: Colors.white,
          borderRadius: 15,
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: const Icon(Icons.error),
          messageText: Text(
            result[mapValue].toString(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: const Text(
            "auth Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } else {
      _loadingIcon(false);
    }
  }

  onClickLoginUsingPhoneNumber(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      // _loadingIcon(true);
      // final result = await LoginUsingPhoneNumberUseCase.instance
      //     .call(phone, FireAuthRepositoryImp.instance);
      // if (result[mapKey].toString().toLowerCase() == "success") {
      //   Get.to(
      //     () => VerifyPhoneNumber(
      //       verificationCode: result[mapValue],
      //     ),
      //   );
      // }else {
      //   _loadingIcon(false);
      //   Get.snackbar(
      //     "auth Exception",
      //     result[mapValue],
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: customColor6,
      //     colorText: Colors.white,
      //     borderRadius: 15,
      //     margin: const EdgeInsets.all(5),
      //     duration: const Duration(seconds: 4),
      //     isDismissible: true,
      //     forwardAnimationCurve: Curves.easeOutBack,
      //     icon: const Icon(Icons.error),
      //     messageText: Text(
      //       result[mapValue].toString(),
      //       style: const TextStyle(
      //         fontSize: 16,
      //         fontFamily: appFont,
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     titleText: const Text(
      //       "auth Exception",
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontFamily: appFont,
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   );
      // }
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          //await _auth.signInWithCredential(credential);
          //print("the phone number is done");
        },
        verificationFailed: (FirebaseAuthException e) {
          //response =  failedRequest(responseBody: e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(() => VerifyPhoneNumber(verificationCode: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // response = failedRequest(responseBody: verificationId);
        },
      );
    } else {
      _loadingIcon(false);
    }
  }

  onClickVerifyPhoneNumber(String verificationCode, String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: code);

    // Sign the user in (or link) with the credential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    UserModel userModel = UserModel(
      userId: userCredential.user!.uid,
      userName: " ",
      email: " ",
      phone: phone,
      bioInfo: " ",
      address: " ",
      image: " ",
    );
    final result = await AddUserInfoUseCase.instance
        .call(userModel, FireUserRepositoryImp.instance);
    if (result[mapKey].toString().toLowerCase() == "success") {
      Get.offAll(() => const HomePage());
    } else {
      return Get.snackbar(
        "auth Exception",
        result[mapValue],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: customColor6,
        colorText: Colors.white,
        borderRadius: 15,
        margin: const EdgeInsets.all(5),
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        icon: const Icon(Icons.error),
        messageText: Text(
          result[mapValue].toString(),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: appFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleText: const Text(
          "auth Exception",
          style: TextStyle(
            fontSize: 20,
            fontFamily: appFont,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  onClickLoginUsingGoogle() async {
    _loadingIcon(true);
    final result = await LoginUsingGoogleUseCase.instance
        .call(FireAuthRepositoryImp.instance);
    if (result[mapKey].toString().toLowerCase() == "success") {
      UserCredential userCredential = result[mapValue];
      UserModel userModel = UserModel(
        userId: userCredential.user!.uid,
        userName: userCredential.user!.displayName,
        email: userCredential.user!.email,
        phone: " ",
        address: " ",
        bioInfo: " ",
        image: userCredential.user!.photoURL,
      );
      final userResult = await AddUserInfoUseCase.instance
          .call(userModel, FireUserRepositoryImp.instance);
      if (userResult[mapKey].toString().toLowerCase() == "success") {
        Get.offAll(() => const HomePage());
        _loadingIcon(false);
      } else {
        return Get.snackbar(
          "add user Exception",
          userResult[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customColor6,
          colorText: Colors.white,
          borderRadius: 15,
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: const Icon(Icons.error),
          messageText: Text(
            userResult[mapValue].toString(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: const Text(
            "add user Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } else {
      return Get.snackbar(
        "google auth Exception",
        result[mapValue],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: customColor6,
        colorText: Colors.white,
        borderRadius: 15,
        margin: const EdgeInsets.all(5),
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        icon: const Icon(Icons.error),
        messageText: Text(
          result[mapValue].toString(),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: appFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleText: const Text(
          "google Exception",
          style: TextStyle(
            fontSize: 20,
            fontFamily: appFont,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  // this is private method for class
  _loadingIcon(bool value) {
    isLoadingIcon = value;
    update();
  }

}
