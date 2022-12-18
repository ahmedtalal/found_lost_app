import 'package:flutter/material.dart';

class CustomTextSharedWidget extends StatelessWidget {
  const CustomTextSharedWidget({
    required this.textTitle,
    required this.titleStyle,
    super.key,
  });
  final String textTitle;
  final TextStyle titleStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: titleStyle,
    );
  }
}
