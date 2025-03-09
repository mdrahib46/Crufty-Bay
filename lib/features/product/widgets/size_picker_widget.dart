import 'package:cruftybay/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget(
      {super.key, required this.sizes, required this.onSelectedSize});

  final List<String> sizes;
  final Function(String) onSelectedSize;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getSize()
      ),
    );
  }

  List<Widget> _getSize() {
    List<Widget> sizeItemWidgetList = [];
    for (String size in widget.sizes) {
      Widget sizeItem = getSizeItemWidget(
        sizeName: size,
        isSelected: _selectedSize == size,
        onTap: () {
          _selectedSize = size;
          widget.onSelectedSize(_selectedSize!);
          setState(() {

          });
        },
      );
      sizeItemWidgetList.add(sizeItem);
    }
    return sizeItemWidgetList;
  }

  Widget getSizeItemWidget(
      {required String sizeName,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.themeColor),
          color: isSelected ? AppColors.themeColor : Colors.transparent,
        ),
        child: Text(
          sizeName,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.themeColor,
          ),
        ),
      ),
    );
  }
}
