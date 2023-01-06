import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/logic/getx/items_controller.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/widgets/empty_item_reports_widget.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/widgets/item_view_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextSharedWidget(
                  textTitle: "My items",
                  titleStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: appFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GetX<ItemsController>(
                init: ItemsController.instance,
                initState: (state){
                  state.controller!.getAllItemReportsByUserId();
                },
                builder: ((controller) {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.itemReportsList.isEmpty) {
                    return EmptyItemReportsWidget();
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: controller.itemReportsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemViewWidget(
                            itemReportModel: controller.itemReportsList[index],
                          );
                        }),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
