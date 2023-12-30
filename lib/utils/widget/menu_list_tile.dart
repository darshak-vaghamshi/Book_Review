import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile(
      {super.key,
      required this.labelText,
      required this.onTapButton,
      required this.icon});
  final String labelText;
  final Function() onTapButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        labelText,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onTap: onTapButton,
    );
  }
}
