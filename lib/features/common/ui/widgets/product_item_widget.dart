import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/app/asset_path.dart';
import 'package:cruftybay/features/common/data/models/product_model.dart';
import 'package:cruftybay/features/product/ui/screens/product_details_scren.dart';
import 'package:flutter/material.dart';
class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.12),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )),
                child: Image.network(
                  productModel.image ?? '',
                  fit: BoxFit.cover,
                  width: 140,
                  // height: 90,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                      productModel.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          productModel.price ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor),
                        ),
                         Row(

                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(
                            '${productModel.star ?? '0.0'}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.themeColor),
                            ),
                          ],
                        ),
                        Container(
                          padding: const  EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.themeColor,
                          ),
                          child: const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}