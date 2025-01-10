import 'package:flutter/material.dart';
import 'windows_xp_window.dart';
import 'taskbar.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo del escritorio
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/xp_background.jpg'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Ventana principal
          Positioned(
            left: 100,
            top: 100,
            width: 600,
            height: 400,
            child: WindowsXPWindow(),
          ),
          // Barra de tareas inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: TaskBar(),
          ),
        ],
      ),
    );
  }
}
