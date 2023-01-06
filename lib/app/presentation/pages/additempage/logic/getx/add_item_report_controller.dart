import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_item_report_repository_imp.dart';
import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';
import 'package:found_lost_app/app/domain/usecases/itemreport/item_report_usecases.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/home_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddItemReportController extends GetxController {
  static final AddItemReportController _addItemReportController =
      AddItemReportController._internal();
  AddItemReportController._internal();
  static AddItemReportController get instance => _addItemReportController;
  bool isLoadingIcon = false;

  String reportType = "";
  String name = "";
  String description = "";
  String photo = "";
  String reportStatus = "";
  String city = "";
  String country = "";
  String phoneNumber = "";
  String date = "";
  var _image;

  List<String> mainCategoryDropDownList = [
    "Mobiles",
    "Computers",
    "Televsions",
    "Visa",
    "Cars",
    "Devices",
    "Another Things",
  ];
  String mainCategorydefaultValue = "Mobiles";

  onChangeReportType(String? value) {
    reportType = value!;
    update();
  }

  onChangeReportName(String? value) {
    name = value!;
    update();
  }

  onChangeReportDescription(String? value) {
    description = value!;
    update();
  }

  onChangeReportPhoto(String? value) {
    photo = value!;
    update();
  }

  onChangeReportStatus(String? value) {
    reportStatus = value!;
    update();
  }

  onChangeCity(String? value) {
    city = value!;
    update();
  }

  onChangeCountry(String? value) {
    country = value!;
    update();
  }

  onChangePhoneNumber(String? value) {
    phoneNumber = value!;
    update();
  }

  onChangeDate(String? value) {
    date = value!;
    update();
  }

  String? onValidateField(String? value) {
    if (value!.isEmpty) {
      return "this field is required";
    } else {
      return null;
    }
  }

  onClickImagePicker() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      File? imageFile = File(image!.path);

      final result = await UploadItemImageUseCase.instance
          .call(imageFile, FireItemReportRepositoryItem.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        photo = result[mapValue].toString();
      } else {
        return Get.snackbar(
          "upload image Exception",
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

  onClickConfirmItemReport(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      _loadingIcon(true);
      String itemId = ItemReportModel.generateItemId();
      ItemReportEntity itemReportEntity = ItemReportModel(
        itemId,
        reportType,
        name,
        description,
        mainCategorydefaultValue,
        city,
        country,
        photo,
        "pending",
        phoneNumber,
        date,
        FirebaseAuth.instance.currentUser!.uid,
      );
      final result = await AddItemReportUseCase.instance.call(
        itemReportEntity,
        FireItemReportRepositoryItem.instance,
      );
      if (result[mapKey].toString().toLowerCase() == "success") {
        Get.offAll(() => const HomePage());
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

  onClickMaincategoryDropDown(String value) {
    mainCategorydefaultValue = value;
    update();
  }

  // this is private method for class
  _loadingIcon(bool value) {
    isLoadingIcon = value;
    update();
  }
  @override
  void dispose() {
    AddItemReportController.instance.dispose();
    super.dispose();
  }
}
