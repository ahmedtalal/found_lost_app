import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/additempage/logic/getx/add_item_report_controller.dart';
import 'package:found_lost_app/app/presentation/pages/additempage/widgets/item_confirm_btn_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/text_form_field_shared_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddItemReportController>(
        init: AddItemReportController.instance,
        builder: ((controller) {
          return Container(
            height: ScreenHandler.getScreenHeight(context),
            width: ScreenHandler.getScreenHeight(context),
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: ScreenHandler.getScreenHeight(context) / 35,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                    ),
                    DropdownButtonFormField(
                      value: controller.mainCategorydefaultValue,
                      items: controller.mainCategoryDropDownList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: CustomTextSharedWidget(
                                textTitle: e.toString(),
                                titleStyle: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: appFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (newValue) {
                        controller.onClickMaincategoryDropDown(newValue!);
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      dropdownColor: Colors.deepPurple.shade50,
                      decoration: InputDecoration(
                        labelText: "Main Category",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontFamily: appFont,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: customBorder(),
                        enabledBorder: customBorder(),
                        focusedBorder: customBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField(
                      value: controller.reportTypeValue,
                      items: controller.reportTypeList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: CustomTextSharedWidget(
                                textTitle: e.toString(),
                                titleStyle: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: appFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (newValue) {
                        controller.onClickReportTypeDropDown(newValue!);
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      dropdownColor: Colors.deepPurple.shade50,
                      decoration: InputDecoration(
                        labelText: "report type",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontFamily: appFont,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: customBorder(),
                        enabledBorder: customBorder(),
                        focusedBorder: customBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                      child: TextFormFieldSharedWidget(
                        hint: "item name",
                        initialValue: "",
                        label: "Item Name",
                        onChangeListenser: (String? newValue) {
                          controller.onChangeReportName(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value);
                        },
                        prefIcon: Icons.category,
                        textType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                      child: TextFormFieldSharedWidget(
                        hint: "Description",
                        initialValue: "",
                        label: "Description",
                        onChangeListenser: (String? newValue) {
                          controller.onChangeReportDescription(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value);
                        },
                        prefIcon: Icons.description,
                        textType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                      child: TextFormFieldSharedWidget(
                        hint: "Country",
                        initialValue: "",
                        label: "Country",
                        onChangeListenser: (String? newValue) {
                          controller.onChangeCountry(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value);
                        },
                        prefIcon: Icons.location_city,
                        textType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                      child: TextFormFieldSharedWidget(
                        hint: "City",
                        initialValue: "",
                        label: "City",
                        onChangeListenser: (String? newValue) {
                          controller.onChangeCity(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value);
                        },
                        prefIcon: Icons.location_city,
                        textType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                      child: TextFormFieldSharedWidget(
                        hint: "phone number",
                        initialValue: "",
                        label: "Phone Number",
                        onChangeListenser: (String? newValue) {
                          controller.onChangePhoneNumber(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value);
                        },
                        prefIcon: Icons.phone,
                        textType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 13,
                      child: TextFormFieldSharedWidget(
                        hint: "date",
                        initialValue: "",
                        label: "Date",
                        onChangeListenser: (String? newValue) {
                          controller.onChangeDate(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value);
                        },
                        prefIcon: Icons.date_range,
                        textType: TextInputType.datetime,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      height: ScreenHandler.getScreenHeight(context) / 6,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Container(
                        height: 100,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.onClickImagePicker();
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ItemConfirmBtnWidget(
                      controller: controller,
                      title: "Confirm",
                      formKey: formKey,
                      onClick: () {
                        controller.onClickConfirmItemReport(formKey);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.3,
      ),
    );
  }
}
