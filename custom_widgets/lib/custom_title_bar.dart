import 'package:flutter/material.dart';
import 'windows_xp_button.dart';

class CustomWindowsXPTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          WindowsXPButton(type: 'minimize'),
          const SizedBox(width: 4),
          WindowsXPButton(type: 'maximize'),
          const SizedBox(width: 4),
          WindowsXPButton(type: 'close'),
        ],
      ),
    );
  }
}
