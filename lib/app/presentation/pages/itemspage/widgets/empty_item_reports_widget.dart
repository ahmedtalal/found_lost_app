import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';

class EmptyItemReportsWidget extends StatelessWidget {
  const EmptyItemReportsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Container(
          child: Image(
            image: AssetImage(
              emptyItems,
            ),
            width: double.maxFinite,
            height: ScreenHandler.getScreenHeight(context) / 3,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextSharedWidget(
          textTitle: "No Items here",
          titleStyle: TextStyle(
            fontSize: 16,
            fontFamily: appFont,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
