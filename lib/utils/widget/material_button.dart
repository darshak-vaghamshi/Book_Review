import 'package:flutter/material.dart';

class MaterialButtonBar extends StatelessWidget {
  const MaterialButtonBar(
      {super.key,
      required this.labelText,
      required this.onTapButton,
      this.bottonColor});
  final Function() onTapButton;
  final String labelText;
  final Color? bottonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: bottonColor,
              borderRadius: BorderRadius.circular(29),
              child: InkWell(
                borderRadius: BorderRadius.circular(29),
                onTap: onTapButton,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: Colors.transparent),
                  child: Text(
                    labelText,
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
