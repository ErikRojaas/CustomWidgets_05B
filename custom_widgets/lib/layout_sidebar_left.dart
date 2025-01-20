import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutSidebarLeft extends StatefulWidget {
  final List<String> options;
  final Function(int, String) onSelect;

  const LayoutSidebarLeft(
      {Key? key, this.options = const [], required this.onSelect})
      : super(key: key);

  @override
  State<LayoutSidebarLeft> createState() => LayoutButtonsState();
}

class LayoutButtonsState extends State<LayoutSidebarLeft> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    bool isAccent = true;

    Color colorText = theme.getSidebarColorText(false, isAccent);
    TextStyle textStyle = TextStyle(fontSize: 25, color: colorText, fontFamily: 'MS_Sans_Serif');

    String selectedRadio = theme.appearanceConfig;
    return ListView(children: [
      const SizedBox(height: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.options.length, (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.onSelect(index, widget.options[index]);
                _selectedIndex = index;
              });
            },
            child: CDKButtonSidebarWindowsXP(
              isSelected: _selectedIndex == index,
              isAccent: true,
              onSelected: () {
                setState(() {
                  widget.onSelect(index, widget.options[index]);
                  _selectedIndex = index;
                });
              },
              child: Text(widget.options[index], style: textStyle),
            ),
          );
        }),
      ),
      const SizedBox(height: 25),
      Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Theme: ", style: textStyle),
                const SizedBox(height: 8),
                CDKButtonRadioWindowsXP(
                  isSelected: selectedRadio == "system",
                  onSelected: (bool? isSelected) {
                    setState(() {
                      selectedRadio = "system";
                      theme.setAppearanceConfig(context);
                    });
                  },
                  child: Text("System", style: textStyle),
                ),
                const SizedBox(height: 8),
                CDKButtonRadioWindowsXP(
                  isSelected: selectedRadio == "light",
                  onSelected: (bool? isSelected) {
                    setState(() {
                      selectedRadio = "light";
                      theme.setAppearanceConfig(context, type: "light");
                    });
                  },
                  child: Text("Light", style: textStyle),
                ),
                const SizedBox(height: 8),
                CDKButtonRadioWindowsXP(
                  isSelected: selectedRadio == "dark",
                  onSelected: (bool? isSelected) {
                    setState(() {
                      selectedRadio = "dark";
                      theme.setAppearanceConfig(context, type: "dark");
                    });
                  },
                  child: Text("Dark", style: textStyle),
                ),
                const SizedBox(height: 16),
                Text("Primary color: ", style: textStyle),
                const SizedBox(height: 8),
                CDKPickerThemeColorsWindowsXP(
                  colors: CDKTheme.systemColors,
                  onColorChanged: (String colorName) {
                    // ignore: avoid_print
                    print("Color changed: $colorName");
                  },
                ),
              ]))
    ]);
  }
}



class CDKButtonSidebarWindowsXP extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSelected;
  final bool isAccent;
  final Function() onSelected;
  final Widget child;

  const CDKButtonSidebarWindowsXP({
    Key? key,
    this.onPressed,
    this.isSelected = false,
    this.isAccent = true,
    required this.onSelected,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    Color colorText = theme.getSidebarColorText(isSelected, isAccent);

    Color colorBackground =
        theme.getSidebarColorBackground(isSelected, isAccent);

    return GestureDetector(
      onTap: onSelected,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Container(
            width: double.infinity,
            padding: child is Text
                ? const EdgeInsets.fromLTRB(8, 6, 8, 8)
                : const EdgeInsets.fromLTRB(8, 6, 8, 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: colorBackground,
            ),
            child: child is Text
                ? Text(
                    (child as Text).data!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: (child as Text)
                            .style
                            ?.copyWith(fontSize: 20, color: colorText) ??
                        TextStyle(fontSize: 20, color: colorText),
                  )
                : child,
          )),
    );
  }
}


class CDKButtonRadioWindowsXP extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool>? onSelected;
  final double size;
  final Widget child;

  const CDKButtonRadioWindowsXP({
    Key? key,
    this.isSelected = false,
    this.onSelected,
    this.size = 16.0,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    return GestureDetector(
      onTap: () {
        onSelected?.call(!isSelected);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: CDKButtonRadioPainter(
              colorAccent: theme.accent100,
              colorAccent200: theme.accent200,
              colorBackgroundSecondary0: theme.backgroundSecondary0,
              isSelected: isSelected,
              hasAppFocus: theme.isAppFocused,
              size: size,
              isLightTheme: theme.isLight,
            ),
          ),
          const SizedBox(width: 4),
          Baseline(
            baseline: size / 1.5,
            baselineType: TextBaseline.alphabetic,
            child: child is Text
                ? Text(
                    (child as Text).data!,
                    style: (child as Text).style?.copyWith(fontSize: 20) ??
                        const TextStyle(fontSize: 20),
                  )
                : child,
          ),
        ],
      ),
    );
  }
}


class CDKPickerThemeColorsWindowsXP extends StatefulWidget {
  final Map<String, Color> colors;
  final Function(String)? onColorChanged;

  const CDKPickerThemeColorsWindowsXP({
    Key? key,
    required this.colors,
    this.onColorChanged,
  }) : super(key: key);

  @override
   _CDKPickerThemeColorsWindowsXPState createState() => _CDKPickerThemeColorsWindowsXPState();
}


class _CDKPickerThemeColorsWindowsXPState extends State<CDKPickerThemeColorsWindowsXP> {
  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    int index = -1;
    return Wrap(
      children: widget.colors.entries.map((entry) {
        final String colorName = entry.key;
        final Color color = entry.value;
        index = index + 1;

        return GestureDetector(
          onTap: () {
            theme.setAccentColour(colorName);
            widget.onColorChanged?.call(colorName);
          },
          child: CustomPaint(
            painter: SquareColorPickerPainter(
              color: color,
              isSelected: theme.colorConfig == colorName,
            ),
            size: const Size(20, 20), // Tamaño de cada picker
          ),
        );
      }).toList(),
    );
  }
}

class SquareColorPickerPainter extends CustomPainter {
  final Color color;
  final bool isSelected;

  SquareColorPickerPainter({required this.color, required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.25;

    // Dibujar el cuadrado base
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    // Dibujar el borde gris
    canvas.drawRect(rect, borderPaint);

    // Si está seleccionado, dibujar el indicador interno
    if (isSelected) {
      final Paint selectedPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      final double inset = size.width * 0.3; // Margen interno
      final Rect innerRect = Rect.fromLTWH(
        inset,
        inset,
        size.width - 2 * inset,
        size.height - 2 * inset,
      );
      canvas.drawRect(innerRect, selectedPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Volver a pintar si cambian las propiedades
  }
}
