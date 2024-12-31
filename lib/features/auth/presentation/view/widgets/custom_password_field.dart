
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    required this.onSaved,
  });
  final ValueChanged<String?> onSaved;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator:  (value) {
        if (value!.isEmpty) {
          return 'كلمة المرور مطلوبة';
        }
        return null;
      },
      obscureText: isObscure,
      onSaved: (value) {
        widget.onSaved(value!);
        setState(() {});
      },
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: Icon(
            !isObscure ? Icons.visibility_off : Icons.remove_red_eye_outlined),
        color: AppColor.lightGrayColor,
        onPressed: () {
          isObscure = !isObscure;
          setState(() {});
        },
      ),
    );
  }
}
