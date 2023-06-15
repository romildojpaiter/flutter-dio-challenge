import 'package:firebaseapp/services/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final bool? isPassword;
  final PasswordController? controller;
  final TextEditingController? textEditingController;
  final String? hintText, labelText;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.textEditingController,
      this.isPassword = false,
      this.hintText,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PasswordController>(
      builder: (_) => TextField(
        obscureText: controller!.isShown.value,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: isPassword!
                ? InkWell(
                    child: controller!.isShown.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onTap: () => controller!.toogle(),
                  )
                : const SizedBox(height: 0)),
      ),
    );
  }
}
