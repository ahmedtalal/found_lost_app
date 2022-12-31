import 'package:found_lost_app/app/presentation/pages/itemspage/logic/getx/items_controller.dart';
import 'package:get/get.dart';

class ItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsController.instance, fenix: true);
  }
}
