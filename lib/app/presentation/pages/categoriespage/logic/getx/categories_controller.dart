import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_item_report_repository_imp.dart';
import 'package:found_lost_app/app/domain/usecases/itemreport/item_report_usecases.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static final CategoriesController _categoriesController =
      CategoriesController._internal();
  CategoriesController._internal();
  static CategoriesController get instance => _categoriesController;

  var itemReportslist = <ItemReportModel>[].obs;
  var lostItemReportslist = <ItemReportModel>[].obs;
  var foundItemReportslist = <ItemReportModel>[].obs;
  var isLoadding = true.obs;

  getAllItemReports() async {
    try {
      isLoadding(true);
      final result = await GetAllItemReportsUseCase.instance
          .call(FireItemReportRepositoryItem.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        filterItemReports(itemslist: result[mapValue]);
        print(result[mapValue].toString());
      } else {
        isLoadding(false);
        return Get.snackbar(
          "item reports Exception",
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
            "item reports Exception",
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
      isLoadding(false);
    }
  }

  void filterItemReports({required List<ItemReportModel> itemslist}) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    for (ItemReportModel itemReport in itemslist) {
      if (itemReport.userId! != userId) {
        itemReportslist.add(itemReport);
      }
      if (itemReport.userId != userId &&
          itemReport.reporttype!.toLowerCase() == "lost") {
        lostItemReportslist.add(itemReport);
      }
      if (itemReport.userId != userId &&
          itemReport.reporttype!.toLowerCase() == "found") {
        foundItemReportslist.add(itemReport);
      }
    }
  }

  @override
  void onInit() {
    getAllItemReports();
    super.onInit();
  }
}
