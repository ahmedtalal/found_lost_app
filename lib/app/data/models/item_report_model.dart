import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';
import 'package:uuid/uuid.dart';

class ItemReportModel extends ItemReportEntity {
  ItemReportModel(
    super.itemId,
    super.reporttype,
    super.name,
    super.description,
    super.mainCategory,
    super.city,
    super.country,
    super.photo,
    super.reportStatus,
    super.phone,
    super.date,
    super.userId,
  );
  factory ItemReportModel.fromJson(Map<String, dynamic> data) {
    return ItemReportModel(
      data["itemId"],
      data["itemReport"],
      data["itemName"],
      data["itemDescription"],
      data["mainCategory"],
      data["city"],
      data["country"],
      data["itemPhoto"],
      data["reportStatus"],
      data["phone"],
      data["date"],
      data["userId"],
    );
  }

  static Map<String, dynamic> toJson(ItemReportEntity model) {
    return {
      "itemId": model.itemId,
      "itemReport": model.reporttype,
      "itemName": model.name,
      "itemDescription": model.description,
      "mainCategory": model.mainCategory,
      "city": model.city,
      "country": model.country,
      "itemPhoto": model.photo,
      "reportStatus": model.reportStatus,
      "phone": model.phone,
      "date": model.date,
      "userId": model.userId,
    };
  }

  static String generateItemId() {
    return const Uuid().v1();
  }
}
