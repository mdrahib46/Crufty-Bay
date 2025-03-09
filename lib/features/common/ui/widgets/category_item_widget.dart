import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/features/common/data/models/category/category_pagination_model.dart';
import 'package:cruftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.categoryModel,
  });

  final CategoryItemModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: {
          'categoryName': categoryModel.title ?? '',
          // 'categoryId': categoryModel.sId ?? '',
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.14),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryModel.icon ?? '',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            categoryModel.title ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.themeColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
