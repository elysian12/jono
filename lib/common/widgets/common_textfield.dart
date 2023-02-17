// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jono/common/constants/colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget prefixIcon;

  const CommonTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: AppColors.lightGrey.withOpacity(.5),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(24),
          ),
          iconColor: AppColors.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(24),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: prefixIcon,
          )),
    );
  }
}
