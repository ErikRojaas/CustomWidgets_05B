import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutUtils extends StatefulWidget {
  const LayoutUtils({super.key});

  @override
  State<LayoutUtils> createState() => _LayoutUtilsState();
}

class _LayoutUtilsState extends State<LayoutUtils> {
  String _selectedItem = "Option 1"; // Valor inicial
  final List<String> _items = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
    "Option 5"
  ]; // Lista de opciones

  bool _isDropdownOpen = false; // Estado del desplegable
  OverlayEntry? _overlayEntry; // Entrada del Overlay para el desplegable
  int _hoveredIndex = -1; // Índice del elemento sobre el que pasa el ratón

  final LayerLink _layerLink = LayerLink(); // Para posicionamiento exacto del desplegable

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    return SizedBox(
      height: 600, // Hice el SizedBox más grande (600 en lugar de 450)
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 50, bottom: 8), // Más espacio arriba para bajar el texto
            child: Text(
              'CDKUtilsDisclosure:',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'MS_Sans_Serif',
              ),
            ),
          ),
          const SizedBox(height: 40), // Más espacio debajo del encabezado
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: () => _toggleDropdown(context),
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0), // Fondo gris claro
                  border: Border.all(color: const Color(0xFFA0A0A0)), // Borde gris
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF808080), // Sombra oscura
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          _selectedItem,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'MS_Sans_Serif',
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB0C4DE), // Color del botón
                        border: Border.all(color: const Color(0xFFA0A0A0)),
                      ),
                      child: const Icon(
                        CupertinoIcons.chevron_down,
                        size: 12,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), // Más espacio después del cuadro
        ],
      ),
    );
  }

  void _toggleDropdown(BuildContext context) {
    if (_isDropdownOpen) {
      _hideDropdown();
    } else {
      _showDropdown(context);
    }
  }

  void _showDropdown(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: position.dx + 8, // Desplazar a la derecha
          top: position.dy + 155, // Más abajo del cuadro principal
          width: 585, // Hacer el recuadro más estrecho
          child: Material(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                border: Border.all(color: const Color(0xFFA0A0A0)),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedItem = _items[index];
                      });
                      _hideDropdown();
                    },
                    child: MouseRegion(
                      onEnter: (_) {
                        // Cambiar el fondo al pasar el ratón por encima
                        setState(() {
                          _hoveredIndex = index;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = -1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4), // Tamaño reducido
                        decoration: BoxDecoration(
                          color: _hoveredIndex == index
                              ? Colors.blue.withOpacity(0.2) // Fondo azul al pasar el ratón
                              : Colors.transparent,
                          border: Border(
                            bottom: BorderSide(
                              color: index == _items.length - 1
                                  ? const Color(0x00000000)
                                  : const Color(0xFFA0A0A0),
                            ),
                          ),
                        ),
                        child: Text(
                          _items[index],
                          style: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'MS_Sans_Serif',
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isDropdownOpen = true;
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isDropdownOpen = false;
  }
}
