import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:cruftybay/features/common/ui/widgets/product_item_widget.dart';
import 'package:cruftybay/features/product/ui/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName, required this.categoryId});

  static const String name = '/Product/Product-List-By-Category';

  final String categoryName;
  final String categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListController>(builder: (controller) {
          if (controller.inProgress) {
            return const CenterCircularProgressIndicator();
          }
          return GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                child: ProductItemWidget(
                  productModel: controller.productList[index],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
