import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/logic/getx/userprofile_controller.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:get/get.dart';

class ItemReportDetailsPage extends StatelessWidget {
  const ItemReportDetailsPage({required this.itemReportModel, Key? key})
      : super(key: key);
  final ItemReportModel itemReportModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 17,
                    ),
                  ),
                  const SizedBox(width: 15),
                  CustomTextSharedWidget(
                    textTitle: "Item Details",
                    titleStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: appFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: ScreenHandler.getScreenHeight(context) / 4,
                width: double.maxFinite,
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
              const SizedBox(height: 15),
              Container(
                height: ScreenHandler.getScreenHeight(context) / 1.7,
                width: double.maxFinite,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextSharedWidget(
                      textTitle: "${itemReportModel.reporttype} item",
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle:
                          "Main Category :${itemReportModel.mainCategory}",
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle: "Name :${itemReportModel.name}",
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle: "Country :${itemReportModel.country}",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle: "City :${itemReportModel.city}",
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle: "phone number :${itemReportModel.phone}",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle: "Published date:${itemReportModel.date}",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextSharedWidget(
                      textTitle: "Published by :",
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: customeColor2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    GetX<UserProfileController>(
                      init: UserProfileController.instance,
                      initState: (state) async {
                        await state.controller!.getSpecialUserProfileState(
                            itemReportModel.userId!);
                      },
                      builder: (controller) {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.red, width: 2.5),
                                  ),
                                  child: CachedNetworkImage(
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.cover,
                                    imageUrl: controller.userModel.image!,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Image(
                                      image: AssetImage(userImage),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.userModel.userName!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Phone : ${controller.userModel.phone}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextBtnSharedWidget(
                      title: "Call",
                      containerColor: customColor6,
                      textColor: Colors.white,
                      containerBorderColor: customColor6,
                      onClick: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextBtnSharedWidget(
                      title: "Message",
                      containerColor: customColor6,
                      textColor: Colors.white,
                      containerBorderColor: customColor6,
                      onClick: () {},
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
