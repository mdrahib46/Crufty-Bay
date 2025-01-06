
import 'package:cruftybay/features/cart/ui/screens/cart_list_screen.dart';
import 'package:cruftybay/features/category/ui/screens/category_list_screen.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/home/ui/screens/home_screen.dart';
import 'package:cruftybay/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const String name = '/MainBottomNavBarScreen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNabController bottomNabController = Get.find<MainBottomNabController>();
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNabController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNabController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNabController.selectedIndex,
            onDestinationSelected: bottomNabController.changedIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.view_list), label: 'Categories'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.redeem), label: 'Wish List'),
            ],
          ),
        );
      }
    );
  }
}
