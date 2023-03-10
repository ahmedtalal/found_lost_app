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

  Future<Map<String, dynamic>> call(IAuthRepository iAuthRepository) async =>
      await iAuthRepository.logOut();
}

class CheckIsAuthUseCase {
  static final CheckIsAuthUseCase _checkIsAuthUseCase =
      CheckIsAuthUseCase._internal();
  CheckIsAuthUseCase._internal();
  static CheckIsAuthUseCase get instance => _checkIsAuthUseCase;

  bool call(IAuthRepository iAuthRepository) => iAuthRepository.checkIsAuth();
}

class UpdatePasswordUseCase {
  static final UpdatePasswordUseCase _updatePasswordUseCase =
      UpdatePasswordUseCase._internal();
  UpdatePasswordUseCase._internal();
  static UpdatePasswordUseCase get instance => _updatePasswordUseCase;

  Future<Map<String, dynamic>> call(var currentPassword, var newPassword,
          IAuthRepository iAuthRepository) async =>
      await iAuthRepository.updatePassword(currentPassword, newPassword);
}

class LoginUsingPhoneNumberUseCase {
  static final LoginUsingPhoneNumberUseCase _loginUsingPhoneNumberUseCase =
      LoginUsingPhoneNumberUseCase._internal();
  LoginUsingPhoneNumberUseCase._internal();
  static LoginUsingPhoneNumberUseCase get instance =>
      _loginUsingPhoneNumberUseCase;

  Future<Map<String, dynamic>> call(
          var phoneNumber, IAuthRepository iAuthRepository) async =>
      await iAuthRepository.loginUsingPhoneNumber(phoneNumber);
}

class LoginUsingGoogleUseCase {
  static final LoginUsingGoogleUseCase _loginUsingGoogleUseCase =
      LoginUsingGoogleUseCase._internal();
  LoginUsingGoogleUseCase._internal();
  static LoginUsingGoogleUseCase get instance => _loginUsingGoogleUseCase;

  Future<Map<String, dynamic>> call(IAuthRepository iAuthRepository) async =>
      await iAuthRepository.loginUsingGoogle();
}
