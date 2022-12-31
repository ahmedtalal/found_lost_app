import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:uuid/uuid.dart';

class UserModel extends UserEntity {
  UserModel({
    super.userId,
    super.userName,
    super.bioInfo,
    super.address,
    super.email,
    super.password,
    super.phone,
    super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userName: data["userName"],
      email: data["email"],
      phone: data["phoneNumber"],
      bioInfo: data["bioInfo"],
      address: data["address"],
      image: data["image"],
    );
  }
  static Map<String, dynamic> toJson(UserEntity model) {
    return {
      "userName": model.userName,
      "email": model.email,
      "bioInfo": model.bioInfo,
      "phoneNumber": model.phone,
      "address": model.address,
      "image": model.image,
    };
  }

  static UserModel prepareObject(UserEntity model, String userId) {
    UserModel userModel = UserModel(
      userName: model.userName,
      userId: userId,
      email: model.email,
      bioInfo: model.bioInfo,
      address: model.address,
      phone: model.phone,
      image: model.image,
    );
    return userModel;
  }

  static String generateUserId() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}
