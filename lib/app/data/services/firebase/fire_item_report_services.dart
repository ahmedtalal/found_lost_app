// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';
import 'package:path/path.dart';

class FireItemReportServices {
  static final FireItemReportServices _fireItemReportServices =
      FireItemReportServices._internal();
  FireItemReportServices._internal();
  static FireItemReportServices get instance => _fireItemReportServices;

  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static final CollectionReference _collRef =
      _fireStore.collection("ItemsReport");

  Future<Map<String, dynamic>> fireAddItemReport(
      ItemReportEntity itemReportEntity) async {
    try {
      DocumentReference docRef = _collRef.doc(itemReportEntity.itemId);
      Map<String, dynamic> data = ItemReportModel.toJson(itemReportEntity);
      await docRef.set(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the add item report error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireGetSpecialItemReport(String itemId) async {
    try {
      DocumentSnapshot docSnap = await _collRef.doc(itemId).get();
      dynamic data = docSnap.data();
      ItemReportModel itemReportModel = ItemReportModel.fromJson(data);
      return successRequest(responseBody: itemReportModel);
    } catch (e) {
      print("the get special item error is :${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireGetAllItemReports() async {
    try {
      List<ItemReportModel> itemReports = [];
      QuerySnapshot querySnap = await _collRef.get();
      print("the item list is ${querySnap.docs.length}");
      for (QueryDocumentSnapshot element in querySnap.docs) {
        dynamic data = element.data();
        itemReports.add(ItemReportModel.fromJson(data));
      }
      return successRequest(responseBody: itemReports);
    } catch (e) {
      print('the get all items error is :${e.toString()}');
      return failedRequest(responseBody: e.toString());
    }
  }

  // Future<Map<String, dynamic>> fireGetAllItemReportsByUserId() async {
  //   try {
  //     List<ItemReportModel> itemReports = [];
  //     String userId = FirebaseAuth.instance.currentUser!.uid;
  //     QuerySnapshot querySnap =
  //         await _collRef.doc(userId).collection("reports").get();
  //     for (var element in querySnap.docs) {
  //       dynamic data = element.data();
  //       itemReports.add(ItemReportModel.fromJson(data));
  //     }
  //     return successRequest(responseBody: itemReports);
  //   } catch (e) {
  //     print('the get all items error is :${e.toString()}');
  //     return failedRequest(responseBody: e.toString());
  //   }
  // }

  Future<Map<String, dynamic>> fireUploadItemImage(var image) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String fileName = basename(image.path);
      Reference reference = storage.ref().child("itemReportImages/$fileName");

      //Upload the file to firebase
      await reference.putFile(image);

      //  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      // Waits till the file is uploaded then stores the download url
      String url = await reference.getDownloadURL();
      return successRequest(responseBody: url);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireUpdateItemReport(
      ItemReportEntity itemReportEntity) async {
    try {
      DocumentReference docRef = _collRef.doc(itemReportEntity.itemId);
      Map<String, dynamic> data = ItemReportModel.toJson(itemReportEntity);
      await docRef.update(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the update item report error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireDeleteItemReport(String itemId) async {
    try {
      await _collRef.doc(itemId).delete();
      return successRequest(responseBody: true);
    } catch (e) {
      print("the get special item error is :${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }
}
