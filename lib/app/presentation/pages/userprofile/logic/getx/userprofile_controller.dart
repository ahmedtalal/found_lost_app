import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/user_model.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_user_repository_imp.dart';
import 'package:found_lost_app/app/domain/usecases/user/user_usecases.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileController extends GetxController {
  static final UserProfileController _userProfileController =
      UserProfileController._internal();
  UserProfileController._internal();
  static UserProfileController get instance => _userProfileController;

  var userName = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var address = "".obs;
  var userProfileImage = "".obs;
  var bioInfo = "".obs;
  var isLoading = true.obs;

  /// this methodes to listen any change will occure on edit text field
  onChangeUserName(String? newValue) {
    userName.value = newValue!;
  }

  onChangeEmail(String? newValue) {
    email.value = newValue!;
  }

  onChangePhone(String? newValue) {
    phone.value = newValue!;
  }

  onChangeAdress(String? newValue) {
    address.value = newValue!;
  }

  onChangeBioInfo(String? newValue) {
    bioInfo.value = newValue!;
  }

  onChangeImage(String? newValue) {
    userProfileImage.value = newValue!;
  }

  String? onValidateEditTextField(String value) {
    return value.isEmpty ? "this field is required" : null;
  }

  _getUserProfileState() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      isLoading(true);
      final result = await GetUserUseCase.instance
          .call(userId, FireUserRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        UserModel model = result[mapValue];
        userName.value = model.userName!;
        email.value = model.email!;
        phone.value = model.phone!;
        address.value = model.address!;
        bioInfo.value = model.bioInfo!;
        userProfileImage.value = model.image!;
      } else {
        isLoading(false);
        return Get.snackbar(
          "user profile Exception",
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
            "user profile Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }

  UserModel userModel = UserModel();
  getSpecialUserProfileState(String userId) async {
    try {
      isLoading(true);
      final result = await GetUserUseCase.instance
          .call(userId, FireUserRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        userModel = result[mapValue];
        update();
      } else {
        isLoading(false);
        return Get.snackbar(
          "user profile Exception",
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
            "user profile Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }

  onClickImagePicker() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      File? imageFile = File(image!.path);

      final result = await UploadUserImageCase.instance
          .call(imageFile, FireUserRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        userProfileImage.value = result[mapValue].toString();
      } else {
        return Get.snackbar(
          "upload user image Exception",
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
            "upload user image Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } on PlatformException catch (e) {
      return Get.snackbar(
        "image picker Exception",
        e.code.toString(),
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
          e.code.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: appFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleText: const Text(
          "image picker Exception",
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

  onClickUpdateUserInfo(GlobalKey<FormState> formKey) async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading(true);
        UserModel userModel = UserModel(
          userName: userName.value,
          email: email.value,
          address: address.value,
          bioInfo: bioInfo.value,
          image: userProfileImage.value,
          userId: FirebaseAuth.instance.currentUser!.uid,
          phone: phone.value,
        );
        final result = await UpdateUserInfoUseCase.instance
            .call(userModel, FireUserRepositoryImp.instance);
        if (result[mapKey].toString().toLowerCase() == "success") {
          isLoading(false);
          Get.back();
        } else {
          return Get.snackbar(
            " update user profile Exception",
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
              "update user profile Exception",
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
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    await _getUserProfileState();
    super.onInit();
  }
}
