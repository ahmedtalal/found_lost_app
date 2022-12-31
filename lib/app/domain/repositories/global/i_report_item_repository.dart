import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';

abstract class IReportItemRepository {
  Future<Map<String, dynamic>> addReportItem(ItemReportEntity itemReportEntity);
  Future<Map<String, dynamic>> deleteItemReport(var itemId);
  Future<Map<String, dynamic>> getAllItemReports();
  Future<Map<String, dynamic>> getSpecialReportItem(var itemId);
  Future<Map<String, dynamic>> updateItemReport(
      ItemReportEntity itemReportEntity);
  Future<Map<String, dynamic>> uploadItemImage(var imageFile);
}
