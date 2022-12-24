import 'package:found_lost_app/app/domain/entities/user_entity.dart';
abstract class IUserRepository {
  Future<Map<String,dynamic>> addUser(UserEntity model);
  Future<Map<String,dynamic>> deleteUser(String userId);
  Future<Map<String,dynamic>> updateUser(UserEntity model);
  Future<Map<String,dynamic>> searchAboutUser(var index);
  Future<Map<String,dynamic>> displayAllUsers();
  Future<Map<String,dynamic>> displaySpecialUser(var index);
}
