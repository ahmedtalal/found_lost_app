// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/user_model.dart';
import 'package:found_lost_app/app/data/services/firebase/fire_user_services.dart';
import 'package:found_lost_app/app/domain/entities/user_entity.dart';

class FireAuthServices {
  static final FireAuthServices _fireAuthServices =
      FireAuthServices._internal();
  FireAuthServices._internal();
  static FireAuthServices get instance => _fireAuthServices;

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> fireLogin(UserEntity model) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: model.email!, password: model.password!);
      return successRequest(responseBody: userCredential.user);
    } on FirebaseAuthException catch (e) {
      return failedRequest(responseBody: e.code);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireRegister(UserEntity model) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: model.email!, password: model.password!);

      UserModel userModel =
          UserModel.prepareObject(model, userCredential.user!.uid);
      // CALL ADDUSER METHOD IN HERE TO ADD USER AFTER COMPLETE REGISTER METHOD
      final result = await FireUserServices.instance.fireAddUserInfo(userModel);
      print("the register success is :${result[mapKey]}");
      return result;
    } on FirebaseAuthException catch (e) {
      return failedRequest(responseBody: e.code);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }

  bool fireLogOut() {
    try {
      _auth.signOut();
      return true;
    } catch (e) {
      print("the logout error is ${e.toString()}");
      return false;
    }
  }

  bool fireCheckIsAuth() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<Map<String, dynamic>> fireUpdatePassword(
      var currentPassword, var newPassword) async {
    try {
      final user = _auth.currentUser;
      final cred = EmailAuthProvider.credential(
          email: user!.email!, password: currentPassword);
      await user.reauthenticateWithCredential(cred);
      await user.updatePassword(newPassword);
      return successRequest(responseBody: true);
    } on FirebaseAuthException catch (e) {
      return failedRequest(responseBody: e.code);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireResetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return successRequest(responseBody: true);
    } on FirebaseAuthException catch (e) {
      return failedRequest(responseBody: e.code);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }
}
