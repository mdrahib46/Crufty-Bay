import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/features/product/ui/screens/product_review_screen.dart';
import 'package:cruftybay/features/product/widgets/color_picker_widget.dart';
import 'package:cruftybay/features/product/widgets/product_image_carousel_slider.dart';
import 'package:cruftybay/features/common/ui/widgets/product_incre_decre_button.dart';
import 'package:cruftybay/features/product/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product/product-details';
  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ProductImageCarouselSlider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'HP 15s-fq5786TU - New Year Special Deal with 20% OFF',
                                      style: textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.themeColor),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: TextButton(
                                            onPressed: _moveToReviewScreen,
                                            child: const Text('Reviews'),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              ProductIncreDecreButton(
                                onChanged: (int value) {},
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Colors', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          ColorPickerWidget(
                            colors: const [
                              'Red',
                              'Yellow',
                              'Pink',
                              'White',
                              'Blue'
                            ],
                            onColorSelected: (String selectedColor) {},
                          ),
                          const SizedBox(height: 16),
                          Text("Size", style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          SizePickerWidget(
                            sizes: const ['S', 'M', 'L', 'XL', 'XXL'],
                            onSelectedSize: (String selectedSize) {},
                          ),
                          const SizedBox(height: 16),
                          Text('Description', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          const Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five''',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildPriceAndAddToCartSection(context, textTheme)
          ],
        ),
      ),
    );
  }

  Widget buildPriceAndAddToCartSection(
      BuildContext context, TextTheme textTheme) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      color: AppColors.themeColor.withOpacity(0.2),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Price',
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '\$1000',
                style: textTheme.titleMedium!.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }

  void _moveToReviewScreen() {
    Navigator.pushNamed(context, ProductReviewScreen.name);
    setState(() {});
  }
}
