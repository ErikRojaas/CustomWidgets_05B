import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFF1C5EBC), // Azul de la barra inferior
        border: Border(
          top: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de Inicio
          TaskBarButton(
            text: "Start",
            icon: Icons.menu,
            backgroundColor: const Color(0xFF6CBE36), // Verde del botón "Start"
          ),
          // Reloj
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Clock(),
          ),
        ],
      ),
    );
  }
}

class TaskBarButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;

  const TaskBarButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      _getCurrentTime(),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  // Función para obtener la hora actual
  String _getCurrentTime() {
    final now = DateTime.now();
    final hours = now.hour.toString().padLeft(2, '0');
    final minutes = now.minute.toString().padLeft(2, '0');
    final ampm = now.hour >= 12 ? 'PM' : 'AM';
    return "$hours:$minutes $ampm";
  }
}
