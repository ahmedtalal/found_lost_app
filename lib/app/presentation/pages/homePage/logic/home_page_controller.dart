
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController _homePageController = HomePageController._internal();
  HomePageController._internal();
  static HomePageController get instance => _homePageController;
  var currentIndex = 0.obs;

  switchPages(int? index) {
    currentIndex.value = index!;
    update();
  }

}
