import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_item_report_repository_imp.dart';
import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';
import 'package:found_lost_app/app/domain/usecases/itemreport/item_report_usecases.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static final CategoriesController _categoriesController =
      CategoriesController._internal();
  CategoriesController._internal();
  static CategoriesController get instance => _categoriesController;

  var itemReportsList = <ItemReportModel>[].obs;
  var lostItemReportsList = <ItemReportModel>[].obs;
  var foundItemReportsList = <ItemReportModel>[].obs;
  var isLoading = true.obs;

  getAllItemReports() async {
    try {
      isLoading(true);
      final result = await GetAllItemReportsUseCase.instance
          .call(FireItemReportRepositoryItem.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        filterItemReports(itemsList: result[mapValue]);
        foundItemReportsFiltration(itemReportsList);
        lostItemReportsFiltration(itemReportsList);
        print(result[mapValue].toString());
      } else {
        isLoading(false);
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
      isLoading(false);
    }
  }

  void filterItemReports({required List<ItemReportModel> itemsList}) {
    itemReportsList.clear();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    for (ItemReportModel itemReport in itemsList) {
      if (itemReport.userId! != userId) {
        itemReportsList.add(itemReport);
      }
    }
  }

  void foundItemReportsFiltration(List<ItemReportModel> itemList) {
    foundItemReportsList.clear();
    for (ItemReportModel itemReportModel in itemList) {
      if (itemReportModel.reporttype.toString().toLowerCase() == "found") {
        foundItemReportsList.add(itemReportModel);
      }
    }
  }

  void lostItemReportsFiltration(List<ItemReportModel> itemList) {
    lostItemReportsList.clear();
    for (ItemReportModel itemReportModel in itemList) {
      if (itemReportModel.reporttype.toString().toLowerCase() == "lost") {
        lostItemReportsList.add(itemReportModel);
      }
    }
  }

  updateItemReport(ItemReportEntity itemReportEntity) async {}
  @override
  void onInit() {
    getAllItemReports();
    super.onInit();
  }
  // @override
  // void dispose() {
  //   CategoriesController.instance.dispose();
  //   super.dispose();
  // }
}
