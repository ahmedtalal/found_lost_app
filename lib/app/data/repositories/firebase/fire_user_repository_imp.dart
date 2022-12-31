import 'package:found_lost_app/app/data/services/firebase/fire_user_services.dart';
import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:found_lost_app/app/domain/repositories/global/i_user_repository.dart';

class FireUserRepositoryImp implements IUserRepository {
  static final FireUserRepositoryImp _fireUserRepositoryImp =
      FireUserRepositoryImp._internal();
  FireUserRepositoryImp._internal();
  static FireUserRepositoryImp get instance => _fireUserRepositoryImp;

  @override
  Future<Map<String, dynamic>> addUser(UserEntity model) async {
    return await FireUserServices.instance.fireAddUserInfo(model);
  }

  @override
  Future<Map<String, dynamic>> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> displayAllUsers() {
    // TODO: implement displayAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> displaySpecialUser(index) async {
    return await FireUserServices.instance.fireGetSpecialUser(index);
  }

  @override
  Future<Map<String, dynamic>> searchAboutUser(index) {
    // TODO: implement searchAboutUser
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> updateUser(UserEntity model) async{
   return await FireUserServices.instance.fireUpdateUserInfo(model);
  }

  @override
  Future<Map<String, dynamic>> uploadUserImage(imageFile) async{
    return await FireUserServices.instance.fireUploadUserImage(imageFile);
  }
}
