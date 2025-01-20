import 'package:custom_widgets/layout_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPickers extends StatefulWidget {
  const LayoutPickers({super.key});

  @override
  State<LayoutPickers> createState() => _LayoutPickersState();
}

class _LayoutPickersState extends State<LayoutPickers> {
  double _angle = 0.0;
  double _valueSlider = 0.5;
  int _selectedIndexButtonsSegmented0 = 1;
  int _selectedIndexButtonsSegmented1 = 1;
  List<bool> _selectedStatesButtonsBar0 = [true, false, false, false];
  List<bool> _selectedStatesButtonsBar1 = [true, false, true, false];

  late List<Color> _valueSliderColors;
  final List<double> _valueSliderStops = const [0.0, 1.0];
  double _valueSliderGradient = 0.75;

  @override
  void initState() {
    super.initState();
    _valueSliderColors = [
      Color.lerp(CupertinoColors.systemBlue, CupertinoColors.systemGreen, _valueSliderGradient)!,
      Color.lerp(CupertinoColors.systemYellow, CupertinoColors.systemRed, _valueSliderGradient)!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('XP Styled Pickers'),
      ),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('XP Styled 360 Picker:', style: TextStyle(fontSize: 16)),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _xpStyled360Picker(
                  value: _angle,
                  onChanged: (angle) {
                    setState(() {
                      _angle = angle;
                    });
                  },
                ),
              ),
              Text(_angle.toStringAsFixed(2), style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('XP Styled Slider:', style: TextStyle(fontSize: 16)),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 100,
                  child: CDKPickerSliderWindowsXP(
                    value: _valueSlider,
                    onChanged: (value) {
                      setState(() {
                        _valueSlider = value;
                      });
                    },
                  ),
                ),
              ),
              Text(_valueSlider.toStringAsFixed(2), style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('XP Styled Gradient Picker:', style: TextStyle(fontSize: 16)),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _xpStyledGradientPicker(
                  value: _valueSliderGradient,
                  onChanged: (value) {
                    setState(() {
                      _valueSliderGradient = value;
                      _valueSliderColors = [
                        Color.lerp(CupertinoColors.systemBlue, CupertinoColors.systemGreen, _valueSliderGradient)!,
                        Color.lerp(CupertinoColors.systemYellow, CupertinoColors.systemRed, _valueSliderGradient)!,
                      ];
                    });
                  },
                ),
              ),
              Container(
                width: 40,
                height: 40,
                color: _valueSliderColors[0], // Primer color del gradiente
              ),
              Text(_valueSliderGradient.toStringAsFixed(2), style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('XP Styled Segmented Buttons:', style: TextStyle(fontSize: 16)),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _xpStyledSegmentedButtons(
                  selectedIndex: _selectedIndexButtonsSegmented0,
                  options: const [
                    Text('Car'),
                    Text('Motorbike'),
                    Icon(CupertinoIcons.airplane),
                  ],
                  onSelected: (int index) {
                    setState(() {
                      _selectedIndexButtonsSegmented0 = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: _xpStyledSegmentedButtons(
                  selectedIndex: _selectedIndexButtonsSegmented1,
                  options: const [
                    Icon(CupertinoIcons.ant),
                    Text('Flower'),
                    Text('Grass'),
                    Text('Bush'),
                  ],
                  onSelected: (int index) {
                    setState(() {
                      _selectedIndexButtonsSegmented1 = index;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('XP Styled Buttons Bar:', style: TextStyle(fontSize: 16)),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _xpStyledButtonsBar(
                  selectedStates: _selectedStatesButtonsBar0,
                  options: const [
                    Icon(CupertinoIcons.text_alignleft),
                    Icon(CupertinoIcons.text_aligncenter),
                    Icon(CupertinoIcons.text_alignright),
                    Text("Justify"),
                  ],
                  onChanged: (List<bool> options) {
                    setState(() {
                      _selectedStatesButtonsBar0 = options;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: _xpStyledButtonsBar(
                  selectedStates: _selectedStatesButtonsBar1,
                  options: const [
                    Icon(CupertinoIcons.bold),
                    Icon(CupertinoIcons.italic),
                    Icon(CupertinoIcons.underline),
                    Icon(CupertinoIcons.strikethrough),
                  ],
                  allowsMultipleSelection: true,
                  onChanged: (List<bool> options) {
                    setState(() {
                      _selectedStatesButtonsBar1 = options;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _xpStyled360Picker({required double value, required ValueChanged<double> onChanged}) {
    return GestureDetector(
      onPanUpdate: (details) {
        double newAngle = (value + details.delta.dx / 100).clamp(0.0, 1.0);
        onChanged(newAngle);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border.all(color: CupertinoColors.systemGrey),
          borderRadius: BorderRadius.zero, // Eliminamos las esquinas redondeadas
        ),
        child: Center(
          child: Text('${(value * 360).round()}°', style: const TextStyle(fontSize: 12)),
        ),
      ),
    );
  }

  Widget _xpStyledSlider({required double value, required ValueChanged<double> onChanged}) {
    return CupertinoSlider(
      value: value,
      min: 0.0,
      max: 1.0,
      onChanged: onChanged,
      activeColor: CupertinoColors.activeBlue,
      thumbColor: CupertinoColors.white,
    );
  }

  Widget _xpStyledGradientPicker({required double value, required ValueChanged<double> onChanged}) {
    return GestureDetector(
      onPanUpdate: (details) {
        double newValue = (details.localPosition.dx / 200).clamp(0.0, 1.0);
        onChanged(newValue);
      },
      onTapDown: (details) {
        double newValue = (details.localPosition.dx / 200).clamp(0.0, 1.0);
        onChanged(newValue);
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CupertinoColors.systemBlue,
              CupertinoColors.systemGreen,
            ],
            stops: [0.0, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.zero, // Eliminamos las esquinas redondeadas
          border: Border.all(color: CupertinoColors.systemGrey),
        ),
      ),
    );
  }

  Widget _xpStyledSegmentedButtons({required int selectedIndex, required List<Widget> options, required ValueChanged<int> onSelected}) {
    return CupertinoSegmentedControl<int>(
      groupValue: selectedIndex,
      children: {
        for (int i = 0; i < options.length; i++) i: Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: options[i]),
      },
      onValueChanged: onSelected,
      unselectedColor: CupertinoColors.white,
      selectedColor: CupertinoColors.activeBlue,
      borderColor: CupertinoColors.systemGrey,
    );
  }

  Widget _xpStyledButtonsBar({required List<bool> selectedStates, required List<Widget> options, required ValueChanged<List<bool>> onChanged, bool allowsMultipleSelection = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(options.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (allowsMultipleSelection) {
                selectedStates[index] = !selectedStates[index];
              } else {
                for (int i = 0; i < selectedStates.length; i++) {
                  selectedStates[i] = i == index;
                }
              }
              onChanged(selectedStates);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedStates[index] ? CupertinoColors.activeBlue.withOpacity(0.3) : CupertinoColors.white,
              border: Border.all(color: CupertinoColors.systemGrey),
              borderRadius: BorderRadius.zero, // Eliminamos las esquinas redondeadas
            ),
            child: options[index],
          ),
        );
      }),
    );
  }
}
