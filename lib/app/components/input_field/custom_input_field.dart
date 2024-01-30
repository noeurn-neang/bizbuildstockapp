import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final bool? isPassword;
  final Widget? prefixIcon;
  final String? label;
  final TextEditingController? controller;
  final Function(String?)? onChange;

  const CustomInputField(
      {this.onChange,
      super.key,
      this.isPassword,
      this.prefixIcon,
      this.label,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(),
      obscureText: isPassword ?? false,
      onChanged: onChange,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          label: Text(label ?? ''),
          prefixIcon: prefixIcon ?? const Icon(Icons.inbox),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
    );
  }
}
