import 'package:cruftybay/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductIncreDecreButton extends StatefulWidget {
  const ProductIncreDecreButton({super.key, required this.onChanged});

  final Function(int) onChanged;

  @override
  State<ProductIncreDecreButton> createState() =>
      _ProductIncreDecreButtonState();
}

class _ProductIncreDecreButtonState extends State<ProductIncreDecreButton> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
            icon: Icons.remove,
            onTap: () {
              if (_count > 1) {
                _count--;
                widget.onChanged(_count);
                setState(() {});
              }

            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$_count',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.themeColor,
            ),
          ),
        ),
        _buildIconButton(
            icon: Icons.add,
            onTap: () {
              if (_count >= 1) {
                if (_count < 20) {
                  _count++;
                  widget.onChanged(_count);
                  setState(() {});
                }
              }


            }),
      ],
    );
  }

  GestureDetector _buildIconButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.themeColor,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
