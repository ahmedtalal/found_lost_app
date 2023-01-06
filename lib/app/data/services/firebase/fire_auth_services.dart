// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/user_model.dart';
import 'package:found_lost_app/app/data/services/firebase/fire_user_services.dart';
import 'package:found_lost_app/app/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthServices {
  static final FireAuthServices _fireAuthServices =
      FireAuthServices._internal();
  FireAuthServices._internal();
  static FireAuthServices get instance => _fireAuthServices;

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  Future<Map<String,dynamic>> fireLogOut()async {
    try {
      await _auth.signOut();
     await _googleSignIn.signOut();
      return successRequest(responseBody: true);
    } catch (e) {
      print("the logout error is ${e.toString()}");
      return failedRequest(responseBody: false);
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

  Future<Map<String,dynamic>> fireAuthUsingPhoneNumber(String phoneNumber) async {
    dynamic response ;
    try{
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{
           //await _auth.signInWithCredential(credential);
           //print("the phone number is done");
        },
        verificationFailed: (FirebaseAuthException e) {
          response =  failedRequest(responseBody: e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          response = successRequest(responseBody: verificationId);
          print("the code is : $verificationId");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          response = failedRequest(responseBody: verificationId);
        },
      );
    }catch(e){
      response = failedRequest(responseBody: e.toString());
    }
    return response;
  }

  Future<Map<String, dynamic>> fireLoginUsingGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return successRequest(responseBody: userCredential);
    } on FirebaseAuthException catch (e) {
      return failedRequest(responseBody: e.code);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }
}
