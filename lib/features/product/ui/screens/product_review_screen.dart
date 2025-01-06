import 'package:cruftybay/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  static const String name = '/product/product-review-screen';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reviews'),
          leading: IconButton(
            onPressed: () {
              _onPop;
              setState(() {});
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.person_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Md. Rahib',
                                    style: textTheme.titleMedium!.copyWith(
                                        color: Colors.grey, fontSize: 16),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '''Flutter’s rapid adoption by developers and businesses alike has led to an increased demand for skilled developers who can deliver high-quality Flutter apps..''',
                                style: textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            _buildProductReviewSection(textTheme)
          ],
        ),
      ),
    );
  }

  Widget _buildProductReviewSection(TextTheme textTheme) {
    return Container(
            padding: const EdgeInsets.all(16),
            decoration:
                BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Reviews (1000)', style: textTheme.titleMedium!.copyWith(color: Colors.grey,)),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.themeColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                    onPressed: () {},
                    child: const Icon(Icons.add, color: Colors.white,),

                  ),
                )
              ],
            ),
          );
  }

  void _onPop() {
    Navigator.pop(context);
  }
}
