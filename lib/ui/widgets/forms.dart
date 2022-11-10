import 'package:flutter/material.dart';
import 'package:pitjarus_test/shared/styles.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.title,
      required this.hint,
      this.obsecureText = false,
      this.controller,
      this.icon = const Icon(
        Icons.person_pin,
        color: kBlueColor,
      ),
      this.validator})
      : super(key: key);
  final String title;
  final String hint;
  final bool obsecureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obsecureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: icon,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        )
      ],
    );
  }
}
