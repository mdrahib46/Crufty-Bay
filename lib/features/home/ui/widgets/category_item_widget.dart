import 'package:cruftybay/app/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.computer,
            size: 48,
            color: AppColors.themeColor,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'Computer',
          style: TextStyle(
              fontSize: 16,
              color: AppColors.themeColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0
          ),
        ),
      ],
    );
  }
}