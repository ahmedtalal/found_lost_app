import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/app_bar_shared_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarSharedWidget.instance.build(context),
      body: SafeArea(
        child: Container(
          height: ScreenHandler.getScreenHeight(context),
          width: ScreenHandler.getScreenWidth(context),
          padding: const EdgeInsets.all(10),
          margin:
              EdgeInsets.only(top: ScreenHandler.getScreenHeight(context) / 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
            ],
          ),
        ),
      ),
    );
  }
}
