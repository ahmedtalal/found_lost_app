import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/data/models/item_report_model.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/home_page.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/logic/getx/userprofile_controller.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/Text_btn_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:get/get.dart';

class CategoryItemsDetails extends StatelessWidget {
  const CategoryItemsDetails({required this.itemReportModel, Key? key})
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(() => const HomePage());
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
                ],
              ),
              const SizedBox(height: 15),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: ScreenHandler.getScreenHeight(context) / 4.5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
              ),
              const SizedBox(height: 15),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextSharedWidget(
                          textTitle: "${itemReportModel.reporttype} item",
                          titleStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              itemReportModel.reportStatus!,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: appFont,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category_outlined,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.mainCategory!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.badge,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.name!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "description",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.description!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "country",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.country!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "city",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.city!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "phone number",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.phone!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "date",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: appFont,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    CustomTextSharedWidget(
                      textTitle: itemReportModel.date!,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    GetX<UserProfileController>(
                      init: UserProfileController.instance,
                      initState: (state) {
                        state.controller!.getSpecialUserProfileState(
                          itemReportModel.userId!,
                        );
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
                                    imageUrl: controller.userModel.value.image!,
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
                                      controller.userModel.value.email == " "
                                          ? "Unknown"
                                          : controller.userModel.value.email!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      controller.userModel.value.userName == " "
                                          ? "Unknown"
                                          : "Name : ${controller.userModel.value.userName}",
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
