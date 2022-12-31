import 'package:found_lost_app/app/data/services/firebase/fire_auth_services.dart';
import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:found_lost_app/app/domain/repositories/global/i_auth_repository.dart';

class FireAuthRepositoryImp extends IAuthRepository {
  // this is singleton pattern
  static final FireAuthRepositoryImp _fireAuthRepositoryImp =
      FireAuthRepositoryImp._internal();
  FireAuthRepositoryImp._internal();
  static FireAuthRepositoryImp get instance => _fireAuthRepositoryImp;

  @override
  bool checkIsAuth() {
    return FireAuthServices.instance.fireCheckIsAuth();
  }

  @override
  Future<Map<String, dynamic>> forgetPassword(email) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  bool logOut() {
    return FireAuthServices.instance.fireLogOut();
  }

  @override
  Future<Map<String, dynamic>> login(UserEntity model) async {
    return await FireAuthServices.instance.fireLogin(model);
  }

  @override
  Future<Map<String, dynamic>> register(UserEntity model) async {
    return await FireAuthServices.instance.fireRegister(model);
  }

  @override
  Future<Map<String, dynamic>> updatePassword(
      currentPassword, newPassword) async {
    return await FireAuthServices.instance
        .fireUpdatePassword(currentPassword, newPassword);
  }
}
