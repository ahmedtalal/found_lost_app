import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/views/item_report_details_page.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:get/get.dart';

class ItemViewWidget extends StatelessWidget {
  const ItemViewWidget({required this.itemReportModel, super.key});
  final ItemReportModel itemReportModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(
          () => ItemReportDetailsPage(itemReportModel: itemReportModel),
        );
      },
      child: Card(
        shadowColor: Colors.grey[200],
        elevation: 5,
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextSharedWidget(
                          textTitle: "Type : ${itemReportModel.reporttype}",
                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            CustomTextSharedWidget(
                              textTitle:
                                  itemReportModel.mainCategory.toString(),
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontFamily: appFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomTextSharedWidget(
                              textTitle: "name : ${itemReportModel.name}",
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: appFont,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        CustomTextSharedWidget(
                          textTitle: itemReportModel.description.toString(),
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 12,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 10),
                            CustomTextSharedWidget(
                              textTitle: itemReportModel.city!,
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontFamily: appFont,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 2,
                indent: 2,
                endIndent: 2,
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.share,
                      size: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.task_alt,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
