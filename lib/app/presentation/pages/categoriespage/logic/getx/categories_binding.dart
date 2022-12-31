import 'package:found_lost_app/app/presentation/pages/categoriespage/logic/getx/categories_controller.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController.instance, fenix: true);
  }
}
