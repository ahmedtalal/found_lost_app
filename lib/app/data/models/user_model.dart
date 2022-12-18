import 'package:social_media_network/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
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
      userId: data["id"],
      userName: data["userName"],
      email: data["email"],
      phone: data["phoneNumber"],
    );
  }
  static Map<String, dynamic> toJson(UserEntity model) {
    return {
      "userName": model.userName,
      "email": model.email,
      "passwordHash": model.password,
      "phoneNumber": model.phone,
    };
  }
}
