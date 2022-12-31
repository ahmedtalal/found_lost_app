import 'dart:io';

import 'package:found_lost_app/app/data/services/firebase/fire_item_report_services.dart';
import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';
import 'package:found_lost_app/app/domain/repositories/global/i_report_item_repository.dart';

class FireItemReportRepositoryItem implements IReportItemRepository {
  static final FireItemReportRepositoryItem _fireItemReportRepositoryItem =
      FireItemReportRepositoryItem._internal();
  FireItemReportRepositoryItem._internal();
  static FireItemReportRepositoryItem get instance =>
      _fireItemReportRepositoryItem;

  @override
  Future<Map<String, dynamic>> addReportItem(
      ItemReportEntity itemReportEntity) async {
    return await FireItemReportServices.instance.fireAddItemReport(
      itemReportEntity,
    );
  }

  @override
  Future<Map<String, dynamic>> deleteItemReport(itemId) {
    // TODO: implement deleteItemReport
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getAllItemReports() async {
    return await FireItemReportServices.instance.fireGetAllItemReports();
  }

  @override
  Future<Map<String, dynamic>> getSpecialReportItem(itemId) async {
    return await FireItemReportServices.instance
        .fireGetSpecialItemReport(itemId);
  }

  @override
  Future<Map<String, dynamic>> updateItemReport(
      ItemReportEntity itemReportEntity) {
    // TODO: implement updateItemReport
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> uploadItemImage(var imageFile) async {
    return await FireItemReportServices.instance.fireUploadItemImage(imageFile);
  }
}
