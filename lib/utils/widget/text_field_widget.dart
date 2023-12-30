import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.hintText,
      required this.labelText,
      required this.icon,
      required this.onTap,
      this.obscureText,
      this.keyboardType,
      this.maxLength});
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final Function() onTap;
  final IconData icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText ?? false,
              keyboardType: keyboardType,
              maxLength: maxLength,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? "",
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                label: Text(
                  labelText,
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                suffixIcon: IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
