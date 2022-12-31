import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/logic/getx/items_controller.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/views/item_report_details_page.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/widgets/empty_item_reports_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:get/get.dart';

class ItemTypepage extends StatelessWidget {
  const ItemTypepage({required this.itemReportType, super.key});
  final String itemReportType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenHandler.getScreenHeight(context) / 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                CustomTextSharedWidget(
                  textTitle: "$itemReportType items",
                  titleStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: appFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            GetX<ItemsController>(
              init: ItemsController.instance,
              builder: (controller) {
                if (controller.isLoadding.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.itemReportslist.isEmpty) {
                  return EmptyItemReportsWidget();
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: itemReportType.toLowerCase() == "lost"
                        ? controller.lostItemReportslist.length
                        : controller.foundItemReportslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemTypeView(
                        itemReportModel: itemReportType.toLowerCase() == "lost"
                            ? controller.lostItemReportslist[index]
                            : controller.foundItemReportslist[index],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTypeView extends StatelessWidget {
  const ItemTypeView({required this.itemReportModel, super.key});
  final ItemReportModel itemReportModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ItemReportDetailsPage(itemReportModel: itemReportModel));
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[200],
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.3,
                  ),
                ),
                child: CachedNetworkImage(
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                  imageUrl: itemReportModel.photo!,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage(emptyData),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextSharedWidget(
                      textTitle: "${itemReportModel.reporttype} Item",
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.description!,
                      titleStyle: const TextStyle(
                        fontSize: 13,
                        fontFamily: appFont,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.country!,
                      titleStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: appFont,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
