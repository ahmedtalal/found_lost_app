import 'package:found_lost_app/app/presentation/pages/additempage/logic/getx/add_item_report_controller.dart';
import 'package:get/get.dart';

class AddItemReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddItemReportController.instance, fenix: true);
  }
}
