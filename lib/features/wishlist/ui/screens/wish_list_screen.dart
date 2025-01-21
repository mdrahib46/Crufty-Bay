import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/Wish-List Screen';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 4),
              itemBuilder: (context, index) {
                return const FittedBox(
                  // child: ProductItemWidget(),
                );
              }),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNabController>().backToHome();
  }
}
