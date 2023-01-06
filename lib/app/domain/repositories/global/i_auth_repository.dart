import 'package:found_lost_app/app/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Map<String, dynamic>> login(UserEntity model);
  Future<Map<String, dynamic>> register(UserEntity model);
  Future<Map<String, dynamic>> forgetPassword(var email);
  Future<Map<String, dynamic>> updatePassword(
      var currentPassword, var newPassword);
  Future<Map<String,dynamic>> logOut();
  bool checkIsAuth();
  Future<Map<String, dynamic>> loginUsingPhoneNumber(String phoneNumber);
  Future<Map<String, dynamic>> loginUsingGoogle();


}
