import 'package:get/get.dart';

class UserProfileController extends GetxController {
  static UserProfileController _userProfileController =
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

  onChangefirstName(String? newValue) {
    firstName = newValue!;
    update();
  }

  onChangeLastName(String? newValue) {
    lastName = newValue!;
    update();
  }

  onChangeAddress(String? newValue) {
    address = newValue!;
    update();
  }

  onChangeBioInfo(String? newValue) {
    bioInfo = newValue!;
    update();
  }

  onChangeLocationAddress(String? newValue) {
    locationAdrese = newValue!;
    update();
  }

  onChangeSex(bool? newValue) {
    sex = newValue!;
    update();
  }

  String? onValidateEditTextField(String value) {
    return value.isEmpty ? "this field is required" : null;
  }

  getUserProfileState() {
    // here i will write code to get user information using user id>>>>>>>
  }
}
