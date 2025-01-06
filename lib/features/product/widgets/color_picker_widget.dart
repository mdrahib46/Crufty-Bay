import 'package:cruftybay/app/app_color.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});

  final List<String> colors;
  final Function(String) onColorSelected;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getColors(),
      ),
    );
  }

  List<Widget> _getColors() {
    List<Widget> colorItemList = [];
    for (String color in widget.colors) {
     Widget item = getColorItemWidget(
            colorsName: color,
            onTap: () {
              _selectedItem = color;
              widget.onColorSelected(_selectedItem!);
              setState(() {});
            },
            isSelected: _selectedItem == color);
     colorItemList.add(item);
    }
    return colorItemList;
  }

  Widget getColorItemWidget(
      {required String colorsName,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.themeColor),

            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Text(
          colorsName,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
