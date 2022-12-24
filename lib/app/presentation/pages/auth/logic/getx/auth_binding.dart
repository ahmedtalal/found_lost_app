import 'package:get/instance_manager.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController.instance, fenix: true);
  }
}
