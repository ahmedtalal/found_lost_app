import 'package:get/instance_manager.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/logic/getx/userprofile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileController.instance, fenix: true);
  }
}
