import 'package:get/get.dart';

class UserProfileController extends GetxController {
  static final UserProfileController _userProfileController =
      UserProfileController._internal();
  UserProfileController._internal();
  static UserProfileController get instance => _userProfileController;

  String userName = "";
  String email = "";
  String phone = "";
  String firstName = "";
  String lastName = "";
  String address = "";
  String locationAdrese = "";
  String userProfileImage = "";
  String bioInfo = "";
  bool sex = false;

  /// this methodes to listen any change will occure on edit text field
  onChangeUserName(String? newValue) {
    userName = newValue!;
    update();
  }

  onChangeEmail(String? newValue) {
    email = newValue!;
    update();
  }

  onChangePhone(String? newValue) {
    phone = newValue!;
    update();
  }

  onChangeImage(String? newValue) {
    userProfileImage = newValue!;
    update();
  }

  String? onValidateEditTextField(String value) {
    return value.isEmpty ? "this field is required" : null;
  }

  getUserProfileState() {
    // here i will write code to get user information using user id>>>>>>>
  }
}
