import 'package:flutter/material.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';

class PhoneFormFieldSharedWidget extends StatelessWidget {
  final String label, hint, initialValue;
  final Function(String?) onChangeListener;
  final String? Function(String?) onValidateListener;
  final TextInputType textType;
  const PhoneFormFieldSharedWidget(
      {required this.label,
      required this.hint,
      required this.textType,
      required this.onChangeListener,
      required this.onValidateListener,
      required this.initialValue,
      Key? key})
      : super(key: key);
  static bool? passwordObscure = true;
  static bool? passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          initialValue: initialValue,
          onChanged: onChangeListener,
          validator: onValidateListener,
          keyboardType: textType,
          style: const TextStyle(
            fontFamily: appFont,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: textFieldBorder(),
            disabledBorder: textFieldBorder(),
            enabledBorder: textFieldBorder(),
            focusedBorder: textFieldBorder(),
            hintText: hint,
            label: Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 15,
                fontFamily: appFont,
              ),
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: appFont,
              fontWeight: FontWeight.w200,
              color: Colors.grey[500],
            ),
            suffixIcon: label.toLowerCase() == "password"
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        passwordObscure = !passwordObscure!;
                        passwordVisibility = !passwordVisibility!;
                      });
                    },
                    icon: Icon(
                      passwordVisibility!
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          obscureText:
              label.toLowerCase() == "password" ? passwordObscure! : false,
          enabled: true,
        );
      },
    );
  }
}

OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.white,
      width: 0.8,
    ),
  );
}
