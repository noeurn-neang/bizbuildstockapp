import 'package:flutter/material.dart';

class CustomInputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String?)? onChange;
  final Widget? suffixIcon;
  final FocusNode? node;
  final Function()? onTap;
  final Function(PointerDownEvent?)? onTapOutside;
  final Function(String?)? onFieldSubmitted;
  final String? placeHolder;
  final Icon? prefixIcon;
  final Widget? label;

  const CustomInputFormField(
      {super.key,
      this.prefixIcon,
      this.label,
      this.onChange,
      this.placeHolder,
      this.onFieldSubmitted,
      this.node,
      this.onTap,
      this.onTapOutside,
      this.suffixIcon,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      focusNode: node,
      onChanged: onChange,
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          label: label,
          suffixIcon: suffixIcon,
          hintText: placeHolder ?? 'Search',
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          filled: true,
          prefixIcon: prefixIcon,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), gapPadding: 10)),
    );
  }
}
