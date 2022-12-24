import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:found_lost_app/app/domain/repositories/global/i_auth_repository.dart';

class LoginUseCases {
  static final LoginUseCases _loginUseCases = LoginUseCases._internal();
  LoginUseCases._internal();
  static LoginUseCases get instance => _loginUseCases;

  Future<Map<String, dynamic>> call(
          UserEntity userEntity, IAuthRepository iAuthRepository) =>
      iAuthRepository.login(userEntity);
}

class RegisterUseCase {
  static final RegisterUseCase _registerUseCase = RegisterUseCase._internal();
  RegisterUseCase._internal();
  static RegisterUseCase get instance => _registerUseCase;

  Future<Map<String, dynamic>> call(
          UserEntity userEntity, IAuthRepository iAuthRepository) =>
      iAuthRepository.register(userEntity);
}

class LogOutUseCase {
  static final LogOutUseCase _logOutUseCase = LogOutUseCase._internal();
  LogOutUseCase._internal();
  static LogOutUseCase get instance => _logOutUseCase;

  bool call(IAuthRepository iAuthRepository) => iAuthRepository.logOut();
}

class CheckIsAuthUseCase {
  static final CheckIsAuthUseCase _checkIsAuthUseCase =
      CheckIsAuthUseCase._internal();
  CheckIsAuthUseCase._internal();
  static CheckIsAuthUseCase get instance => _checkIsAuthUseCase;

  bool call(IAuthRepository iAuthRepository) => iAuthRepository.checkIsAuth();
}
