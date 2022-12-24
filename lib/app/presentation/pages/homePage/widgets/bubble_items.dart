import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';

BubbleBottomBarItem bubbleItems({
  required String title,
  required String iamge,
  required Color backgroundColor,
}) {
  return BubbleBottomBarItem(
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: appFont,
        fontSize: 13.0,
        color: Colors.white,
      ),
    ),
    backgroundColor: backgroundColor,
    icon: Image.asset(
      iamge,
      height: 20.0,
      color: title.toLowerCase() == "additem" ? null : Colors.black,
    ),
    activeIcon: Image.asset(
      iamge,
      height: 20.0,
      color: title.toLowerCase() == "additem" ? null : Colors.white,
    ),
  );
}
