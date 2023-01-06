import 'package:found_lost_app/app/data/models/user_model.dart';
import 'package:found_lost_app/app/domain/repositories/global/i_user_repository.dart';

class GetUserUseCase {
  static final GetUserUseCase _getUserUseCase = GetUserUseCase._internal();
  GetUserUseCase._internal();
  static GetUserUseCase get instance => _getUserUseCase;

  Future<Map<String, dynamic>> call(
          String userId, IUserRepository iUserRepository) =>
      iUserRepository.displaySpecialUser(userId);
}

class UpdateUserInfoUseCase {
  static final UpdateUserInfoUseCase _updateUserInfoUseCase =
      UpdateUserInfoUseCase._internal();
  UpdateUserInfoUseCase._internal();
  static UpdateUserInfoUseCase get instance => _updateUserInfoUseCase;

  Future<Map<String, dynamic>> call(
          UserModel model, IUserRepository iUserRepository) async =>
      await iUserRepository.updateUser(model);
}

class UploadUserImageCase {
  static final UploadUserImageCase _uploadUserImageCase =
  UploadUserImageCase._internal();
  UploadUserImageCase._internal();
  static UploadUserImageCase get instance => _uploadUserImageCase;

  Future<Map<String, dynamic>> call(
      var imageFile, IUserRepository iUserRepository) async =>
      await iUserRepository.uploadUserImage(imageFile);
}


class AddUserInfoUseCase {
  static final AddUserInfoUseCase _addUserInfoUseCase =
  AddUserInfoUseCase._internal();
  AddUserInfoUseCase._internal();
  static AddUserInfoUseCase get instance => _addUserInfoUseCase;

  Future<Map<String, dynamic>> call(
      UserModel model, IUserRepository iUserRepository) async =>
      await iUserRepository.addUser(model);
}