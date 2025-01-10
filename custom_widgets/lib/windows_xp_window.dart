import 'package:flutter/material.dart';
import 'custom_title_bar.dart';

class WindowsXPWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Barra de título personalizada
          CustomWindowsXPTitleBar(),
          // Contenido de la ventana
          Expanded(
            child: Center(
              child: Text(
                "Ventana estilo Windows XP",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
