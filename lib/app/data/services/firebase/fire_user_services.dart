// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:found_lost_app/app/data/models/user_model.dart';

class FireUserServices {
  static final FireUserServices _fireUserServices =
      FireUserServices._internal();
  FireUserServices._internal();
  static FireUserServices get instance => _fireUserServices;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _collRef = _firestore.collection("Users");

  Future<Map<String, dynamic>> fireAddUserInfo(UserEntity userModel) async {
    try {
      DocumentReference docRef = _collRef.doc(userModel.userId);
      Map<String, dynamic> data = UserModel.toJson(userModel);
      await docRef.set(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the add user error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireDeleteUserInfo(String userId) async {
    try {
      await _collRef.doc(userId).delete();
      return successRequest(responseBody: true);
    } catch (e) {
      print("the delete user error is :${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireUpdateUserInfo(UserEntity userModel) async {
    try {
      Map<String, dynamic> data = UserModel.toJson(userModel);
      await _collRef.doc(userModel.userId).update(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the update user error is :${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireGetSpecialUser(String userId) async {
    try {
      DocumentSnapshot docSanp = await _collRef.doc(userId).get();
      dynamic data = docSanp.data();
      UserModel userModel = UserModel.fromJson(data);
      return successRequest(responseBody: userModel);
    } catch (e) {
      print("the get special user error is :${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireGetAllUsers() async {
    try {
      List<UserModel> users = [];
      QuerySnapshot querySnap = await _collRef.get();
      for (var element in querySnap.docs) {
        dynamic data = element.data();
        users.add(UserModel.fromJson(data));
      }
      return successRequest(responseBody: users);
    } catch (e) {
      print('the get all users error is :${e.toString()}');
      return failedRequest(responseBody: e.toString());
    }
  }
}
