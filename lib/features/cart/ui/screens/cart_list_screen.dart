import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart List'),
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
                  return ListTile();
                },
              ),
            ),
            _buildTotalPriceInCartSection(context, textTheme)
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPriceInCartSection(
      BuildContext context, TextTheme textTheme) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: AppColors.themeColor.withOpacity(0.2),
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Price',
                style: textTheme.titleMedium!.copyWith(
                  color: AppColors.themeColor,
                ),
              ),
              Text(
                '\$1000.00',
                style: textTheme.titleMedium!.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNabController>().backToHome();
  }
}
