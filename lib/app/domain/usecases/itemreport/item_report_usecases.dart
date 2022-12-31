import 'package:found_lost_app/app/domain/entities/item_report_entity.dart';
import 'package:found_lost_app/app/domain/repositories/global/i_report_item_repository.dart';

class AddItemReportUseCase {
  static final AddItemReportUseCase _addItemReportUseCase =
      AddItemReportUseCase._internal();
  AddItemReportUseCase._internal();
  static AddItemReportUseCase get instance => _addItemReportUseCase;

  Future<Map<String, dynamic>> call(ItemReportEntity itemReportEntity,
          IReportItemRepository itemRepository) async =>
      await itemRepository.addReportItem(itemReportEntity);
}

class GetAllItemReportsUseCase {
  static final GetAllItemReportsUseCase _getItemReportsUseCase =
      GetAllItemReportsUseCase._internal();
  GetAllItemReportsUseCase._internal();
  static GetAllItemReportsUseCase get instance => _getItemReportsUseCase;

  Future<Map<String, dynamic>> call(
          IReportItemRepository itemRepository) async =>
      await itemRepository.getAllItemReports();
}

class UploadItemImageUseCase {
  static final UploadItemImageUseCase _uploadItemImageUseCase =
      UploadItemImageUseCase._internal();
  UploadItemImageUseCase._internal();
  static UploadItemImageUseCase get instance => _uploadItemImageUseCase;

  Future<Map<String, dynamic>> call(
          var imageFile, IReportItemRepository itemRepository) async =>
      await itemRepository.uploadItemImage(imageFile);
}
