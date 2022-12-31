import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';

class CustomIconBtnSharedWidget extends StatelessWidget {
  const CustomIconBtnSharedWidget(
      {required this.title,
      required this.containerColor,
      required this.textColor,
      required this.containerBorderColor,
      required this.onClick,
      required this.icon,
      super.key});
  final String? title, icon;
  final Color? containerColor, textColor, containerBorderColor;
  final Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick!,
      child: Container(
        width: ScreenHandler.getScreenWidth(context) / 1.30,
        height: ScreenHandler.getScreenHeight(context) / 13,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: containerBorderColor!, width: 1.5),
          color: containerColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(icon!),
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 10),
            Text(
              title!,
              style: TextStyle(
                color: textColor,
                fontFamily: appFont,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
