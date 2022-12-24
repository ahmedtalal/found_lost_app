import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';

class HeaderSharedWidget extends StatelessWidget {
  final String title;
  const HeaderSharedWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHandler.getScreenWidth(context),
      height: ScreenHandler.getScreenHeight(context) / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(mainLogo),
            width: 40,
            height: 40,
          ),

        ],
      ),
    );
  }
}
