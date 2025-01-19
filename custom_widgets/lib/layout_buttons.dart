import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';
import 'package:flutter/material.dart';

class LayoutButtons extends StatefulWidget {
  const LayoutButtons({super.key});

  @override
  State<LayoutButtons> createState() => _LayoutButtonsState();
}

class _LayoutButtonsState extends State<LayoutButtons> {
  bool _isSwitched = false;
  int _selectedRadio = 1;
  int _indexButtonSelect1 = 1;
  late Widget _preloadedColorPicker;
  final ValueNotifier<Color> _valueColorNotifier =
      ValueNotifier(const Color(0x800080FF));

  _showPopoverColor(BuildContext context, GlobalKey anchorKey) {
    final GlobalKey<CDKDialogPopoverArrowedState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showPopoverArrowed(
      key: key,
      context: context,
      anchorKey: anchorKey,
      isAnimated: true,
      isTranslucent: false,
      onHide: () {
        // ignore: avoid_print
        print("hide slider $key");
      },
      child: _preloadedColorPicker,
    );
  }

  Widget _buildPreloadedColorPicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder<Color>(
        valueListenable: _valueColorNotifier,
        builder: (context, value, child) {
          return CDKPickerColor(
            color: value,
            onChanged: (color) {
              setState(() {
                _valueColorNotifier.value = color;
              });
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _preloadedColorPicker = _buildPreloadedColorPicker();
    return ListView(children: [
      const SizedBox(height: 8),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKButton:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: WindowsXPButton(
              onPressed: () {},
              child: const Text('_ '),
              buttonType: ButtonType.action,
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: WindowsXPButton(
              onPressed: () {},
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent, // Fondo transparente
                  border: Border.all(
                    color: Colors.white, // Borde blanco
                    width: 3, // Grosor del borde
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Fondo transparente
                      border: Border.all(
                        color: Colors.white, // Borde blanco interno
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              buttonType: ButtonType.action,
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: WindowsXPButton(
              onPressed: () {},
              child: const Text('X'),
              buttonType: ButtonType.destructive,
            )),
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {},
            child: const Text('⏻'), // Símbolo de suspender
            buttonType: ButtonType.suspend,
          )),
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {},
            child: const Text('⏼'), // Símbolo de apagar
            buttonType: ButtonType.shutdown,
          )),
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {},
            child: const Text('✲'), // Símbolo de reiniciar
            buttonType: ButtonType.restart,
          )),
      ]),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKButtonHelp:')),
      Wrap(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.question_circle, color: Colors.white),
            buttonType: ButtonType.help,
          ),
        ),
      ]),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKButtonIcon:')),
      Wrap(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.back, color: Colors.white),
            buttonType: ButtonType.help,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.cloud_fill, color: Colors.white),
            buttonType: ButtonType.restart,
          ),
        ),
      ]),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKButtonSwitch:')),
      Wrap(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: WindowsXPButton(
            onPressed: () {
              setState(() {
                _isSwitched = !_isSwitched;
              });
            },
            child: Text(_isSwitched ? 'ON' : 'OFF'),
            buttonType: _isSwitched ? ButtonType.restart : ButtonType.destructive,
          ),
        ),
      ]),
      const Padding(
        padding: EdgeInsets.all(8),
        child: Text('CDKButtonRadio:'),
      ),
      Wrap(
        direction: Axis.vertical, // Apilar los botones en una columna
        spacing: 8, // Espaciado entre los botones
        children: [
          Row(
            children: [
              Container(
                width: 30, // Ancho pequeño del botón
                height: 30, // Altura pequeña del botón
                child: WindowsXPButton(
                  onPressed: () {
                    setState(() {
                      _selectedRadio = 1; // Cambia la selección
                    });
                  },
                  child: const SizedBox(), // Botón vacío, solo indicador circular
                  buttonType: ButtonType.radio, // Radio Button
                  isSelected: _selectedRadio == 1, // Activo si está seleccionado
                ),
              ),
              const SizedBox(width: 8), // Espaciado entre el botón y el texto
              const Text(
                "Microsoft Office 2007",
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 30, // Ancho pequeño del botón
                height: 30, // Altura pequeña del botón
                child: WindowsXPButton(
                  onPressed: () {
                    setState(() {
                      _selectedRadio = 2; // Cambia la selección
                    });
                  },
                  child: const SizedBox(), // Botón vacío, solo indicador circular
                  buttonType: ButtonType.radio, // Radio Button
                  isSelected: _selectedRadio == 2, // Activo si está seleccionado
                ),
              ),
              const SizedBox(width: 8), // Espaciado entre el botón y el texto
              const Text(
                "Microsoft Office 2003",
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 30, // Ancho pequeño del botón
                height: 30, // Altura pequeña del botón
                child: WindowsXPButton(
                  onPressed: () {
                    setState(() {
                      _selectedRadio = 3; // Cambia la selección
                    });
                  },
                  child: const SizedBox(), // Botón vacío, solo indicador circular
                  buttonType: ButtonType.radio, // Radio Button
                  isSelected: _selectedRadio == 3, // Activo si está seleccionado
                ),
              ),
              const SizedBox(width: 8), // Espaciado entre el botón y el texto
              const Text(
                "Open Office",
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ],
          ),
        ],
      ),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKButtonSelect:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: WindowsXPSelect(
              options: const ['No', 'Yes', 'Maybe', 'Who knows?'],
              selectedIndex: _indexButtonSelect1,
              onSelected: (int index) {
                setState(() {
                  _indexButtonSelect1 = index;
                });
              },
            )),
      ]),
      const SizedBox(height: 50),
    ]);
  }
}

enum ButtonType { action, destructive, suspend, shutdown, restart, help, radio }

class WindowsXPButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final bool isSelected; // Para el caso del radio button

  const WindowsXPButton({
    required this.child,
    required this.onPressed,
    required this.buttonType,
    this.isSelected = false, // Para determinar si está seleccionado en un radio button
  });

  @override
  _WindowsXPButtonState createState() => _WindowsXPButtonState();
}

class _WindowsXPButtonState extends State<WindowsXPButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: CustomPaint(
          painter: WindowsXPButtonPainter(
            isPressed: _isPressed,
            buttonType: widget.buttonType,
            isSelected: widget.isSelected,
            isLarge: false,
          ),
          child: SizedBox(
            width: widget.buttonType == ButtonType.help ? 40 : 40, // Tamaño variable
            height: widget.buttonType == ButtonType.help ? 30 : 30, // Tamaño variable
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontFamily: 'MS_Sans_Serif',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WindowsXPButtonPainter extends CustomPainter {
  final bool isLarge;
  final bool isPressed;
  final ButtonType buttonType;
  final bool isSelected;

  WindowsXPButtonPainter({
    required this.isLarge,
    required this.isPressed,
    required this.buttonType,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _getButtonColor()
      ..style = PaintingStyle.fill;

    if (buttonType == ButtonType.help) {
      // Botón circular de ayuda
      final circle = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
    } else if (buttonType == ButtonType.radio) {
      // Estilo de radio button de Windows XP
      final radius = size.width / 2;
      final outerCircle = Offset(size.width / 2, size.height / 2);

      // Pintar el borde negro
      final borderPaint = Paint()
        ..color = Colors.black // Color del borde
        ..style = PaintingStyle.stroke // Solo trazo (borde)
        ..strokeWidth = 2.0; // Grosor del borde
      canvas.drawCircle(outerCircle, radius, borderPaint);

      // Pintar el círculo de fondo
      final backgroundPaint = Paint()
        ..color = paint.color // Color del fondo
        ..style = PaintingStyle.fill; // Relleno
      canvas.drawCircle(outerCircle, radius, backgroundPaint);

      // Pintar el círculo interior si está seleccionado
      if (isSelected) {
        final innerPaint = Paint()
          ..color = const Color.fromARGB(255, 19, 157, 221)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(outerCircle, radius * 0.6, innerPaint);
      }
    } else {
      // Botones tradicionales con bordes redondeados
      final rect = Rect.fromLTWH(0, 0, size.width, size.height);
      final rrect = RRect.fromRectAndRadius(rect, Radius.circular(6.0));
      canvas.drawRRect(rrect, paint);
    }

  }

  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.suspend:
        return isPressed ? Color(0xFFE6A500) : Color(0xFFFFCC00); // Amarillo
      case ButtonType.shutdown:
        return isPressed ? Color(0xFF8B1A10) : Color(0xFFD93222); // Rojo
      case ButtonType.restart:
        return isPressed ? Color(0xFF2B7716) : Color(0xFF4CAF20); // Verde
      case ButtonType.action:
        return isPressed ? Color(0xFF214A7D) : Color(0xFF3166AB); // Azul
      case ButtonType.destructive:
        return isPressed ? Color(0xFF9A4028) : Color(0xFFE25D43); // Rojo
      case ButtonType.radio:
        return isSelected ? Color.fromARGB(255, 19, 157, 221): Color.fromARGB(255, 233, 223, 223); // Gris cuando no está seleccionado
      case ButtonType.help:
        return Color(0xFF3166AB); // Color para el botón de ayuda
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WindowsXPSelect extends StatefulWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const WindowsXPSelect({
    Key? key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
  }) : super(key: key);

  @override
  _WindowsXPSelectState createState() => _WindowsXPSelectState();
}

class _WindowsXPSelectState extends State<WindowsXPSelect> {
  bool _isExpanded = false;

  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _selectOption(int index) {
    widget.onSelected(index);
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Botón principal
        GestureDetector(
          onTap: _toggleDropdown,
          child: CustomPaint(
            painter: WindowsXPSelectPainter(),
            child: Container(
              width: 200, // Ajusta el ancho como desees
              height: 30,
              child: Row(
                children: [
                  // Texto de la opción seleccionada
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.options[widget.selectedIndex],
                        style: const TextStyle(
                          fontFamily: 'MS_Sans_Serif',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis, // Maneja textos largos
                      ),
                    ),
                  ),
                  // Triángulo indicador
                  Container(
                    width: 30,
                    height: 30,
                    color: const Color.fromARGB(255, 19, 157, 221), // Azul
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Opciones desplegables
        if (_isExpanded)
          Container(
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 180, 200, 245)), // Azul claro
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.options.asMap().entries.map((entry) {
                final index = entry.key;
                final text = entry.value;
                return GestureDetector(
                  onTap: () => _selectOption(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    color: index == widget.selectedIndex
                        ? const Color.fromARGB(255, 180, 200, 245) // Azul claro si está seleccionado
                        : Colors.white,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'MS_Sans_Serif',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

class WindowsXPSelectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Fondo blanco
    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Borde azul claro
    final borderPaint = Paint()
      ..color = const Color.fromARGB(255, 180, 200, 245) // Azul claro
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(4));

    // Pintar el fondo y el borde
    canvas.drawRRect(rrect, backgroundPaint);
    canvas.drawRRect(rrect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}