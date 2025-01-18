import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutFields extends StatefulWidget {
  const LayoutFields({super.key});

  @override
  State<LayoutFields> createState() => _LayoutFieldsState();
}

class _LayoutFieldsState extends State<LayoutFields> {
  late TextEditingController _textController;
  late TextEditingController _passController;
  double _valueNumeric = 5.5;
  double _valueNumericIncrement = -1.0;
  double _valueNumeric360 = 270;
  double _valueNumericSlider0 = 0.5;
  double _valueNumericSlider1 = 50;
  double _valueNumericSlider2 = 128;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'Initial text');
    _passController = TextEditingController(text: '1234');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(height: 8),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKFieldText:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 150,
                child: ShadowedCDKFieldText(
                  controller: _textController,
                  isRounded: false,
                  onChanged: (value) {
                    // ignore: avoid_print
                    print("Value changed: $value");
                  },
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print("Value submitted: $value");
                  },
                  focusNode: FocusNode(),
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 150,
                child: ShadowedCDKFieldText(
                  placeholder: 'Placeholder',
                  isRounded: false,
                  onChanged: (value) {
                    // ignore: avoid_print
                    print("Value changed: $value");
                  },
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print("Value submitted: $value");
                  },
                  focusNode: FocusNode(),
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 150,
                child: ShadowedCDKFieldText(
                  controller: _passController,
                  obscureText: true,
                  isRounded: false,
                  onChanged: (value) {
                    // ignore: avoid_print
                    print("Password changed: $value");
                  },
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print("Password submitted: $value");
                  },
                  focusNode: FocusNode(),
                ))),
      ]),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKFieldNumeric:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 150,
                child: CDKFieldNumericWithArrows(
                  value: _valueNumeric,
                  onValueChanged: (double value) {
                    setState(() {
                      _valueNumeric = value;
                    });
                  },
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 150,
                child: CDKFieldNumericWithArrows(
                  value: _valueNumericIncrement,
                  decimals: 2,
                  min: -2,
                  max: 1.5,
                  increment: 0.15,
                  units: "px",
                  onValueChanged: (double value) {
                    setState(() {
                      _valueNumericIncrement = value;
                    });
                  },
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 150,
                child: CDKFieldNumericWithArrows(
                  value: 5.0,
                  enabled: false,
                  onValueChanged: (double value) {},
                ))),
      ]),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKFieldNumericSlider:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 200,
                child: CDKFieldNumericSliderWindowsXP(
                  value: _valueNumericSlider0,
                  onValueChanged: (double value) {
                    setState(() {
                      _valueNumericSlider0 = value;
                    });
                  },
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 200,
                child: CDKFieldNumericSliderWindowsXP(
                  value: _valueNumericSlider1,
                  min: 0,
                  max: 100,
                  increment: 1,
                  decimals: 0,
                  units: "%",
                  onValueChanged: (double value) {
                    setState(() {
                      _valueNumericSlider1 = value;
                    });
                  },
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 200,
                child: CDKFieldNumericSliderWindowsXP(
                  value: _valueNumericSlider2,
                  min: 0,
                  max: 255,
                  increment: 1,
                  decimals: 0,
                  onValueChanged: (double value) {
                    setState(() {
                      _valueNumericSlider2 = value;
                    });
                  },
                ))),
      ]),
      const SizedBox(height: 50),
    ]);
  }
}



class ShadowedCDKFieldText extends StatefulWidget {
  final bool isRounded;
  final bool obscureText;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? textSize;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final Function? onFocusChanged;
  final TextAlign textAlign;
  final bool showArrows; // Nueva propiedad para mostrar las flechas

  const ShadowedCDKFieldText({
    Key? key,
    this.isRounded = false,
    this.obscureText = false,
    this.placeholder = '',
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.textSize = 20, // Aumentamos el tamaño de texto
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.onFocusChanged,
    this.textAlign = TextAlign.left,
    this.showArrows = false, // Si no se desean flechas, se configura como false
  }) : super(key: key);

  @override
  _ShadowedCDKFieldTextState createState() => _ShadowedCDKFieldTextState();
}

class _ShadowedCDKFieldTextState extends State<ShadowedCDKFieldText> {
  late FocusNode _internalFocusNode;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
    _internalFocusNode.addListener(_handleFocusChanged);
  }

  @override
  void dispose() {
    _internalFocusNode.removeListener(_handleFocusChanged);
    _internalFocusNode.dispose();
    super.dispose();
  }

  void _handleFocusChanged() {
    setState(() {
      widget.onFocusChanged?.call(_internalFocusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    return GestureDetector(
      onTap: () => _internalFocusNode.requestFocus(),
      child: CustomPaint(
        painter: ShadowedTextFieldPainter(
          isFocused: _internalFocusNode.hasFocus,
          isRounded: widget.isRounded,
          theme: theme,
        ),
        child: Stack(
          children: [
            // Campo de texto
            CupertinoTextField(
              textAlign: widget.textAlign,
              obscureText: widget.obscureText,
              enabled: widget.enabled,
              controller: widget.controller,
              focusNode: _internalFocusNode,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              padding: const EdgeInsets.symmetric(
                horizontal: 10, // Ajustamos el padding horizontal
                vertical: 12, // Ajustamos el padding vertical para mayor altura
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent, // Fondo transparente para usar CustomPaint
              ),
              placeholder: widget.placeholder,
              style: TextStyle(
                fontFamily: 'MS_Sans_Serif',
                fontSize: widget.textSize,
                color: widget.enabled
                    ? theme.colorText
                    : theme.isLight
                        ? CDKTheme.grey100
                        : CDKTheme.grey700,
              ),
              prefix: widget.prefixIcon == null
                  ? null
                  : Icon(widget.prefixIcon, color: CDKTheme.grey),
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
            ),

            // Si showArrows es verdadero, agregamos los botones de flechas
            if (widget.showArrows)
              Positioned(
                right: 5,
                top: 5,
                bottom: 5,
                child: CustomArrowButtons(
                  enabledUp: widget.enabled,
                  enabledDown: widget.enabled,
                  onUpPressed: () {}, // Lógica de incremento
                  onDownPressed: () {}, // Lógica de decremento
                ),
              ),
          ],
        ),
      ),
    );
  }
}


class ShadowedTextFieldPainter extends CustomPainter {
  final bool isFocused;
  final bool isRounded;
  final CDKTheme theme;

  ShadowedTextFieldPainter({
    required this.isFocused,
    required this.isRounded,
    required this.theme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = isFocused ? CDKTheme.grey500 : CDKTheme.grey200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint shadowPaint = Paint()
      ..color = const Color.fromARGB(255, 107, 106, 106) // Línea gris
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Define el rectángulo sin esquinas redondeadas
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Dibuja el fondo blanco
    canvas.drawRect(
      rect,
      Paint()..color = theme.background,
    );

    // Dibuja la línea gris horizontal en la parte superior
    canvas.drawLine(
      const Offset(1, 1), // Comienzo de la línea (esquina superior izquierda, un pixel dentro)
      Offset(size.width - 1, 1), // Final de la línea (esquina superior derecha)
      shadowPaint,
    );

    // Dibuja la línea gris vertical en el lado izquierdo
    canvas.drawLine(
      const Offset(1, 1), // Comienzo de la línea (esquina superior izquierda, un pixel dentro)
      Offset(1, size.height - 1), // Final de la línea (esquina inferior izquierda)
      shadowPaint,
    );

    // Dibuja el borde del campo
    canvas.drawRect(rect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repinta siempre que cambien las propiedades
  }
}


class CDKFieldNumericWithArrows extends StatefulWidget {
  final double? textSize;
  final double value;
  final double min;
  final double max;
  final double increment;
  final int decimals;
  final bool enabled;
  final String units;
  final Function(double)? onValueChanged;
  final Function(double)? onTextChanged;

  const CDKFieldNumericWithArrows({
    Key? key,
    this.textSize = 20,
    this.value = 0.0,
    this.min = -double.infinity,
    this.max = double.infinity,
    this.increment = double.infinity, // Si es infinito, los botones están ocultos
    this.decimals = 1, // Valor por defecto, sin decimales si no se especifica
    this.enabled = true,
    this.units = "",
    this.onValueChanged,
    this.onTextChanged,
  }) : super(key: key);

  @override
  _CDKFieldNumericWithArrowsState createState() =>
      _CDKFieldNumericWithArrowsState();
}

class _CDKFieldNumericWithArrowsState extends State<CDKFieldNumericWithArrows> {
  late TextEditingController _controller;
  double _previousValue = double.infinity;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _fixText(widget.value));
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  double _fixValue(String text) {
    final match =
        RegExp(r'-?\d+(\.\d+)?').firstMatch(text.replaceAll(',', '.'));
    final numberStr = match != null ? match.group(0)! : widget.value.toString();

    final number = double.parse(numberStr);
    final powCal = pow(10, widget.decimals);
    return (number * powCal).round() / powCal;
  }

  String _fixText(double value) {
    String rst = value.toStringAsFixed(widget.decimals);
    if (widget.units != "") {
      rst += " ${widget.units}";
    }
    return rst;
  }

  void _setCurrentValue(String text) {
    double newValue = _fixValue(text);
    bool valueChanged = false;

    if (newValue < widget.min) {
      newValue = widget.min;
      valueChanged = true;
    } else if (newValue > widget.max) {
      newValue = widget.max;
      valueChanged = true;
    }

    // Actualiza el texto y el cursor
    _controller.text = _fixText(newValue);
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    // Notifica el cambio al padre si el valor ha cambiado
    if (valueChanged || newValue != _previousValue) {
      widget.onValueChanged?.call(newValue);
      _previousValue = newValue;
    }
  }

  _focusChanged(bool hasFocus) {
    if (!hasFocus) {
      _setCurrentValue(_controller.text);
    }
  }

  void _onTextChanged() {
    widget.onTextChanged?.call(_fixValue(_controller.text));
  }

  void _incrementValue() {
    double value = _fixValue(_controller.text);
    value = min(value + widget.increment, widget.max);
    _setCurrentValue(value.toString());
  }

  void _decrementValue() {
    double value = _fixValue(_controller.text);
    value = max(value - widget.increment, widget.min);
    _setCurrentValue(value.toString());
  }

  @override
  Widget build(BuildContext context) {
    double value = widget.value;
    if (value < widget.min || value > widget.max) {
      _setCurrentValue(value.toString());
    }

    if (_previousValue != widget.value) {
      _previousValue = widget.value;
      _controller.text = _fixText(value);
    }

    bool enabledUp = widget.value < widget.max;
    bool enabledDown = widget.value > widget.min;

    Widget child = Row(
      children: <Widget>[
        Expanded(
            child: ShadowedCDKFieldText(
              controller: _controller,
              enabled: widget.enabled,
              textSize: widget.textSize,
              textAlign: TextAlign.right,
              onFocusChanged: _focusChanged,
              keyboardType: TextInputType.text,
            ),
        ),
        widget.increment == double.infinity
            ? Container()
            : const SizedBox(width: 4),
        widget.increment == double.infinity
            ? Container()
            : CustomArrowButtons(
                enabledUp: widget.enabled && enabledUp,
                enabledDown: widget.enabled && enabledDown,
                onUpPressed: _incrementValue,
                onDownPressed: _decrementValue,
              ),
      ],
    );

    return widget.increment == double.infinity
        ? child
        : RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                  _incrementValue();
                } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                  _decrementValue();
                }
              }
            },
            child: child,
          );
  }
}


class CustomArrowButtons extends StatelessWidget {
  final bool enabledUp;
  final bool enabledDown;
  final VoidCallback? onUpPressed;
  final VoidCallback? onDownPressed;

  const CustomArrowButtons({
    Key? key,
    this.enabledUp = true,
    this.enabledDown = true,
    this.onUpPressed,
    this.onDownPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomArrowButton(
          enabled: enabledUp,
          isUpButton: true, // Botón de suma (flecha hacia arriba)
          onPressed: onUpPressed,
        ),
        SizedBox(height: 4),
        CustomArrowButton(
          enabled: enabledDown,
          isUpButton: false, // Botón de resta (flecha hacia abajo)
          onPressed: onDownPressed,
        ),
      ],
    );
  }
}

class CustomArrowButton extends StatelessWidget {
  final bool enabled;
  final bool isUpButton; // true para el botón de suma (arriba), false para el botón de resta (abajo)
  final VoidCallback? onPressed;

  const CustomArrowButton({
    Key? key,
    this.enabled = true,
    this.isUpButton = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: CustomPaint(
        size: Size(20, 15),  // El tamaño del botón rectángulo
        painter: _ArrowButtonPainter(isUpButton: isUpButton, enabled: enabled),
      ),
    );
  }
}

class _ArrowButtonPainter extends CustomPainter {
  final bool isUpButton;
  final bool enabled;

  _ArrowButtonPainter({required this.isUpButton, required this.enabled});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint rectPaint = Paint()
      ..color = enabled ? const Color.fromARGB(255, 214, 209, 209) : Colors.grey[400]!
      ..style = PaintingStyle.fill;

    final Paint trianglePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Dibuja el rectángulo de fondo gris
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      rectPaint,
    );

    // Dibuja el triángulo (flecha) dentro del rectángulo
    final Path trianglePath = Path();
    if (isUpButton) {
      // Triángulo apuntando hacia arriba
      trianglePath.moveTo(size.width / 2, 5);  // Punta del triángulo
      trianglePath.lineTo(5, size.height - 5); // Esquina inferior izquierda
      trianglePath.lineTo(size.width - 5, size.height - 5); // Esquina inferior derecha
    } else {
      // Triángulo apuntando hacia abajo
      trianglePath.moveTo(5, 5); // Esquina superior izquierda
      trianglePath.lineTo(size.width - 5, 5); // Esquina superior derecha
      trianglePath.lineTo(size.width / 2, size.height - 5); // Punta del triángulo
    }
    trianglePath.close();

    // Dibuja el triángulo
    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;  // No es necesario repintar en este caso
  }
}


class CDKFieldNumericSliderWindowsXP extends StatefulWidget {
  final double value;
  final double textSize;
  final double min;
  final double max;
  final double increment;
  final int decimals;
  final bool enabled;
  final String units;
  final Function(double)? onValueChanged;
  final Function(double)? onTextChanged;
  const CDKFieldNumericSliderWindowsXP({
    Key? key,
    this.value = 0.0,
    this.textSize = 20,
    this.min = 0,
    this.max = 1,
    this.increment = double.infinity, // If infinity, buttons are hidden
    this.decimals = 1, // Valor per defecte, sense decimals si no s'especifica
    this.units = "",
    this.enabled = true,
    this.onValueChanged,
    this.onTextChanged,
  }) : super(key: key);

  @override
  CDKFieldNumericSliderWindowsXPState createState() => CDKFieldNumericSliderWindowsXPState();
}

class CDKFieldNumericSliderWindowsXPState extends State<CDKFieldNumericSliderWindowsXP> {
  double _previousValue = 0;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.value;
  }

  void _onValueChanged(String origin, double newValue) {
    bool valueChanged = false;
    double distance = (widget.max - widget.min).abs();

    if (origin == "picker") {
      newValue = newValue * distance + widget.min;
    }

    if (newValue < widget.min) {
      newValue = widget.min;
      valueChanged = true;
    } else if (newValue > widget.max) {
      newValue = widget.max;
      valueChanged = true;
    }

    if (valueChanged || newValue != _previousValue) {
      widget.onValueChanged?.call(newValue);
      _previousValue = newValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    double distance = (widget.max - widget.min).abs();
    double sliderValue = ((widget.value - widget.min) / distance).clamp(0, 1);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: CDKPickerSliderWindowsXP(
          value: sliderValue,
          size: widget.textSize + 8,
          enabled: widget.enabled,
          onChanged: (value) {
            _onValueChanged("picker", value);
          },
        )),
        const SizedBox(width: 4),
        SizedBox(
          width: 80,
          child: CDKFieldNumericWithArrows(
            value: widget.value,
            textSize: widget.textSize,
            min: widget.min,
            max: widget.max,
            increment: widget.increment,
            decimals: widget.decimals,
            enabled: widget.enabled,
            units: widget.units,
            onValueChanged: (value) {
              _onValueChanged("numeric", value);
            },
            onTextChanged: (value) {
              widget.onTextChanged?.call(value);
            },
          ),
        )
      ],
    );
  }
}


class CDKPickerSliderWindowsXP extends StatefulWidget {
  final double value;
  final double size;
  final bool enabled;
  final Function(double)? onChanged;

  const CDKPickerSliderWindowsXP({
    Key? key,
    required this.value,
    this.enabled = true,
    this.size = 40,
    required this.onChanged,
  }) : super(key: key);

  @override
  CDKPickerSliderWindowsXPState createState() => CDKPickerSliderWindowsXPState();
}

class CDKPickerSliderWindowsXPState extends State<CDKPickerSliderWindowsXP> {
  void _getValue(Offset globalPosition) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.globalToLocal(globalPosition);

    double newValue = (position.dx / renderBox.size.width).clamp(0.0, 1.0);

    widget.onChanged?.call(newValue);
  }

  void _onTapDown(TapDownDetails details) {
    _getValue(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!widget.enabled) return;
    _getValue(details.globalPosition);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      onPanUpdate: (details) => _onPanUpdate(details),
      child: CustomPaint(
        painter: CDKPickerSliderWindowsXPPainter(value: widget.value),
        size: Size(widget.size, widget.size),
      ),
    );
  }
}

// CustomPainter para dibujar la figura
class CDKPickerSliderWindowsXPPainter extends CustomPainter {
  final double value;

  CDKPickerSliderWindowsXPPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    Paint greenPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.fill;

    Paint trianglePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    double width = size.width;
    double height = size.height;

    // Dibuja la barra gris
    double barHeight = 3.0;
    double barY = height / 2 - barHeight / 2;
    Rect barRect = Rect.fromLTWH(0, barY, width, barHeight);
    backgroundPaint.color = const Color.fromARGB(255, 58, 57, 57);
    canvas.drawRect(barRect, backgroundPaint);

    // Dibuja el cuadrado con la parte superior verde
    double squareSize = 20.0;
    double squareTopY = barY - squareSize / 2;
    double squareX = width * value - squareSize / 2;

    // Dibuja el cuadrado con la parte superior verde
    Rect squareRect = Rect.fromLTWH(squareX, squareTopY, squareSize, squareSize);
    backgroundPaint.color = const Color.fromARGB(255, 196, 192, 192);
    canvas.drawRect(squareRect, backgroundPaint);

    // Dibuja la parte superior del cuadrado (verde)
    Path topBorder = Path();
    topBorder.moveTo(squareX, squareTopY);
    topBorder.lineTo(squareX + squareSize, squareTopY);
    topBorder.lineTo(squareX + squareSize, squareTopY + 6); // altura del borde verde
    topBorder.lineTo(squareX, squareTopY + 6);
    topBorder.close();
    greenPaint.color = Colors.green;
    canvas.drawPath(topBorder, greenPaint);

    // Dibuja el pico en la parte inferior con la misma anchura que el cuadrado
    Path trianglePath = Path();
    trianglePath.moveTo(squareX, squareTopY + squareSize); // Inicio en la parte inferior izquierda del cuadrado
    trianglePath.lineTo(squareX + squareSize / 2, squareTopY + squareSize + 10); // Punta hacia abajo
    trianglePath.lineTo(squareX + squareSize, squareTopY + squareSize); // Fin en la parte inferior derecha
    trianglePath.close();
    trianglePaint.color = Colors.green;
    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}