import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/data/repositories/firebase/fire_item_report_repository_imp.dart';
import 'package:found_lost_app/app/domain/usecases/itemreport/item_report_usecases.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  static final ItemsController _itemsController = ItemsController._internal();
  ItemsController._internal();
  static ItemsController get instance => _itemsController;
  var itemReportsList = <ItemReportModel>[].obs;
  var lostItemReportsList = <ItemReportModel>[].obs;
  var foundItemReportsList = <ItemReportModel>[].obs;

  var isLoading = true.obs;

  getAllItemReportsByUserId() async {
    try {
      isLoading(true);
      final result = await GetAllItemReportsUseCase.instance
          .call(FireItemReportRepositoryItem.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        filterItemReports(items: result[mapValue]);
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

  void filterItemReports({required List<ItemReportModel> items}) {
    itemReportsList.clear();
    foundItemReportsList.clear();
    lostItemReportsList.clear();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    for (ItemReportModel itemReport in items) {
      if (itemReport.userId == userId) {
        itemReportsList.add(itemReport);
      }
      if (itemReport.reporttype!.toLowerCase() == "found" &&
          itemReport.userId == userId) {
        foundItemReportsList.add(itemReport);
      } else if (itemReport.reporttype!.toLowerCase() == "lost" &&
          itemReport.userId == userId) {
        lostItemReportsList.add(itemReport);
      }
    }
  }

  @override
  void onInit() {
    getAllItemReportsByUserId();
    super.onInit();
  }
}
