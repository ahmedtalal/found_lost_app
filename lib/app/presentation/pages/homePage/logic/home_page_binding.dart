import 'package:get/instance_manager.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/logic/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController.instance, fenix: true);
  }
}
