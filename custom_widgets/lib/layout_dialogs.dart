import 'package:custom_widgets/layout_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutDialogs extends StatefulWidget {
  const LayoutDialogs({super.key});

  @override
  State<LayoutDialogs> createState() => _LayoutDialogsState();
}

class _LayoutDialogsState extends State<LayoutDialogs> {
  // Used to tell the popover where to show up
  final GlobalKey<CDKDialogPopoverState> _anchorPopoverSlider = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorPopover0 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorPopover2 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorDraggable0 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorDraggable1 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorArrowed0 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorArrowed1 = GlobalKey();
  final ValueNotifier<double> _sliderValueNotifier = ValueNotifier(0.5);

  _showPopover(BuildContext context, GlobalKey anchorKey, CDKTheme theme,
    bool centered, bool animated, bool translucent) {
    final GlobalKey<CDKDialogPopoverState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showPopover(
      key: key,
      context: context,
      anchorKey: anchorKey,
      type: centered ? CDKDialogPopoverType.center : CDKDialogPopoverType.down,
      isAnimated: animated,
      isTranslucent: translucent,
      onHide: () {
        // ignore: avoid_print
        print("hide popover $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1), // Borde azul fino
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  // Parte superior con línea azul gruesa
                  Container(
                    height: 22, // Parte superior más gruesa
                    width: 200, // Establecer un ancho fijo
                    color: const Color.fromARGB(255, 11, 118, 206),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 1,
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () {
                              key.currentState?.hide();
                            },
                            child: Container(
                              width: 20, 
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 26, 11), // Botón rojo
                                border: Border.all(color: Colors.white, width: 2), // Borde blanco
                              ),
                              child: const Center(
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                    color: Colors.white, // Letra blanca
                                    fontFamily: 'MS_Sans_Serif',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  // Contenido del pop-up
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Popover:",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'MS_Sans_Serif',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showModal(
    BuildContext context, CDKTheme theme, bool animated, bool translucent) {
    final GlobalKey<CDKDialogModalState> key = GlobalKey();
    CDKDialogsManager.showModal(
      key: key,
      context: context,
      isAnimated: animated,
      isTranslucent: translucent,
      onHide: () {
        // ignore: avoid_print
        print("hide modal $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1), // Borde azul fino
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  // Parte superior con línea azul gruesa
                  Container(
                    height: 32, // Parte superior con borde grueso (sin cambios)
                    width: 350, // Ajuste de ancho
                    color: const Color.fromARGB(255, 11, 118, 206),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 1,
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () {
                              key.currentState?.hide();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 26, 11), // Botón rojo
                                border: Border.all(color: Colors.white, width: 2), // Borde blanco
                              ),
                              child: const Center(
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                    color: Colors.white, // Letra blanca
                                    fontFamily: 'MS_Sans_Serif',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold, // Negrita
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Contenido del modal con mayor altura
                  Container(
                    height: 400, // Aumenté la altura del modal
                    width: 350, // Mantengo el ancho fijo
                    padding: const EdgeInsets.all(16.0), // Padding dentro del contenido
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Modal:",
                          style: TextStyle(
                            fontSize: 18, // Tamaño de la fuente
                            fontFamily: 'MS_Sans_Serif', // Fuente
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Aquí puedes agregar más contenido del modal
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDraggable(BuildContext context, GlobalKey anchorKey, CDKTheme theme,
      bool animated, bool translucent) {
    final GlobalKey<CDKDialogDraggableState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showDraggable(
      key: key,
      context: context,
      anchorKey: anchorKey,
      isAnimated: animated,
      isTranslucent: translucent,
      onHide: () {
        // ignore: avoid_print
        print("hide draggable $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1), // Borde azul fino
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  // Parte superior con línea azul gruesa
                  Container(
                    height: 32, // Parte superior con borde grueso (sin cambios)
                    width: 350, // Ajuste de ancho
                    color: const Color.fromARGB(255, 11, 118, 206),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 1,
                          bottom: 1,
                          child: GestureDetector(
                            onPanUpdate: (details) {},
                            onTap: () {
                              key.currentState?.hide();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 26, 11), // Botón rojo
                                border: Border.all(color: Colors.white, width: 2), // Borde blanco
                              ),
                              child: const Center(
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                    color: Colors.white, // Letra blanca
                                    fontFamily: 'MS_Sans_Serif',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold, // Negrita
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Contenido del modal con mayor altura
                  Container(
                    height: 400, // Aumenté la altura del modal
                    width: 350, // Mantengo el ancho fijo
                    padding: const EdgeInsets.all(16.0), // Padding dentro del contenido
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Draggable:",
                          style: TextStyle(
                            fontSize: 18, // Tamaño de la fuente
                            fontFamily: 'MS_Sans_Serif', // Fuente
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Aquí puedes agregar más contenido del modal
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showPopoverArrowed(
    BuildContext context, GlobalKey anchorKey, CDKTheme theme,
    bool animated, bool translucent) {
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
      isAnimated: animated,
      isTranslucent: translucent,
      onHide: () {
        // ignore: avoid_print
        print("hide arrowed $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1), // Borde azul fino
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  // Parte superior con línea azul gruesa
                  Container(
                    height: 20, // Parte superior más gruesa (sin cambios)
                    width: 300, // Ajusté el ancho para hacerlo más grande
                    color: const Color.fromARGB(255, 11, 118, 206),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 1,
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () {
                              key.currentState?.hide();
                            },
                            child: Container(
                              width: 20, // Tamaño del botón
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 26, 11), // Botón rojo
                                border: Border.all(color: Colors.white, width: 2), // Borde blanco
                              ),
                              child: const Center(
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                    color: Colors.white, // Letra blanca
                                    fontFamily: 'MS_Sans_Serif',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold, // Negrita
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Contenido del popover (más alto)
                  Padding(
                    padding: const EdgeInsets.all(16.0), // Aumenté el padding para más espacio
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Arrowed:",
                          style: TextStyle(
                            fontSize: 18, // Tamaño de la fuente
                            fontFamily: 'MS_Sans_Serif', // Fuente
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Aquí puedes agregar más contenido del popover
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialogArrowedSlider(
    BuildContext context, GlobalKey anchorKey, CDKTheme theme) {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<double>(
          valueListenable: _sliderValueNotifier,
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1), // Borde azul fino
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      // Parte superior con línea azul gruesa
                      Container(
                        height: 20, // Parte superior más gruesa (sin cambios)
                        width: 300, // Ajusté el ancho para hacerlo más grande
                        color: const Color.fromARGB(255, 11, 118, 206),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 1,
                              bottom: 1,
                              child: GestureDetector(
                                onTap: () {
                                  key.currentState?.hide();
                                },
                                child: Container(
                                  width: 20, // Tamaño del botón
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 230, 26, 11), // Botón rojo
                                    border: Border.all(color: Colors.white, width: 2), // Borde blanco
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'X',
                                      style: TextStyle(
                                        color: Colors.white, // Letra blanca
                                        fontFamily: 'MS_Sans_Serif',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold, // Negrita
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Contenido del popover (más alto)
                      Padding(
                        padding: const EdgeInsets.all(16.0), // Aumenté el padding para más espacio
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Slider:",
                              style: TextStyle(
                                fontSize: 18, // Tamaño de la fuente
                                fontFamily: 'MS_Sans_Serif', // Fuente
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(value.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MS_Sans_Serif',
                                ),),
                            SizedBox(
                              height: 20,
                              width: 200,
                              child: CDKPickerSliderWindowsXP(
                                value: value,
                                onChanged: (value) {
                                  _sliderValueNotifier.value = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('Using a value notifier to',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MS_Sans_Serif',
                                ),),
                            const Text('communicate with the dialog.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MS_Sans_Serif',
                                ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    return ListView(children: [
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKPopOver:', style: TextStyle(fontSize: 30, fontFamily: 'MS_Sans_Serif'))),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorPopover0,
              onPressed: () {
                _showPopover(
                    context, _anchorPopover0, theme, false, false, false);
              },
              child: const Text('Popover'),
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorPopover2,
              onPressed: () {
                _showPopover(
                    context, _anchorPopover2, theme, true, true, false);
              },
              child: const Text('With animation'),
            )),
      ]),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKDialogModal:', style: TextStyle(fontSize: 30, fontFamily: 'MS_Sans_Serif'))),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              onPressed: () {
                _showModal(context, theme, false, false);
              },
              child: const Text('Modal'),
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              onPressed: () {
                _showModal(context, theme, true, false);
              },
              child: const Text('With animation'),
            )),
      ]),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKDialogDraggable:', style: TextStyle(fontSize: 30, fontFamily: 'MS_Sans_Serif'))),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorDraggable0,
              onPressed: () {
                _showDraggable(context, _anchorDraggable0, theme, false, false);
              },
              child: const Text('Draggable'),
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorDraggable1,
              onPressed: () {
                _showDraggable(context, _anchorDraggable1, theme, true, false);
              },
              child: const Text('With animation'),
            )),
      ]),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKDialogArrow:', style: TextStyle(fontSize: 30, fontFamily: 'MS_Sans_Serif'))),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorArrowed0,
              onPressed: () {
                _showPopoverArrowed(
                    context, _anchorArrowed0, theme, false, false);
              },
              child: const Text('Arrowed'),
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorArrowed1,
              onPressed: () {
                _showPopoverArrowed(
                    context, _anchorArrowed1, theme, true, false);
              },
              child: const Text('With animation'),
            )),
      ]),
      const SizedBox(height: 8),
      Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButtonWindowsXP(
              key: _anchorPopoverSlider,
              onPressed: () {
                _showDialogArrowedSlider(context, _anchorPopoverSlider, theme);
              },
              child: const Text('DialogArrow with slider'),
            )),
        ValueListenableBuilder<double>(
          valueListenable: _sliderValueNotifier,
          builder: (context, value, child) {
            return Text('Slider value: ${value.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MS_Sans_Serif',
                ),);
          },
        )
      ]),
      const SizedBox(height: 50),
    ]);
  }
}


class CDKButtonWindowsXP extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool enabled;

  const CDKButtonWindowsXP({
    Key? key,
    this.onPressed,
    required this.child,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CDKButtonWindowsXPState createState() => _CDKButtonWindowsXPState();
}

class _CDKButtonWindowsXPState extends State<CDKButtonWindowsXP> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled
          ? (details) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.enabled
          ? (details) => setState(() => _isPressed = false)
          : null,
      onTapCancel: widget.enabled ? () => setState(() => _isPressed = false) : null,
      onTap: widget.enabled ? widget.onPressed : null,
      child: CustomPaint(
        painter: _WindowsXPButtonPainter(
          isPressed: _isPressed,
          enabled: widget.enabled,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontFamily: 'MS_Sans_Serif',
              fontSize: 20,
              color: Colors.white,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _WindowsXPButtonPainter extends CustomPainter {
  final bool isPressed;
  final bool enabled;

  _WindowsXPButtonPainter({required this.isPressed, required this.enabled});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = enabled
          ? (isPressed ? const Color.fromARGB(255, 33, 93, 222) : const Color.fromARGB(255, 33, 93, 222))
          : const Color(0xFF808080);

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    final Paint borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = isPressed ? const Color(0xFF002F8A) : const Color(0xFF003FBF)
      ..strokeWidth = 2.0;

    canvas.drawRect(rect.deflate(1.0), borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}