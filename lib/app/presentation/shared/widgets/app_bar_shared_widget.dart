import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';

class AppBarSharedWidget {
  static final AppBarSharedWidget _appBarSharedWidget =
      AppBarSharedWidget._internal();
  AppBarSharedWidget._internal();
  static AppBarSharedWidget get instance => _appBarSharedWidget;

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      leadingWidth: 100,
      automaticallyImplyLeading: true,
      leading: const Align(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage(mainLogo),
          width: 45,
          height: 45,
        ),
      ),
      title: const Text(
        "Found App",
        style: TextStyle(
          fontSize: 15,
          fontFamily: appFont,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(notificationImg),
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
