import 'package:cruftybay/app/asset_path.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/common/ui/widgets/category_item_widget.dart';
import 'package:cruftybay/features/common/ui/widgets/product_item_widget.dart';
import 'package:cruftybay/features/home/ui/widgets/appbar_icon_button.dart';
import 'package:cruftybay/features/home/ui/widgets/home_carousel_Slider.dart';
import 'package:cruftybay/features/home/ui/widgets/home_section_header.dart';
import 'package:cruftybay/features/home/ui/widgets/search-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(searchTEController: _searchBarController),
              const SizedBox(height: 16),
              const HomeCarouselSlider(),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: "Category",
                onTap: () {
                 Get.find<MainBottomNabController>().moveToCategory();
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getCategoryList(),
                ),
              ),
              const SizedBox(height: 8),
              HomeSectionHeader(
                title: "Popular",
                onTap: () {},
              ),
              // const ProductItemWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              const SizedBox(height: 8),
              HomeSectionHeader(
                title: "Special",
                onTap: () {},
              ),
              // const ProductItemWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              const SizedBox(height: 8),
              HomeSectionHeader(
                title: "New",
                onTap: () {},
              ),
              // const ProductItemWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: CategoryItemWidget(),
      ));
    }
    return categoryList;
  }

  List<Widget> _getProductList(){
    List<Widget> productList = [];
    for(int i = 0; i < 10; i++){
      productList.add(const Padding(
        padding:  EdgeInsets.only(right: 16.0),
        child: ProductItemWidget(),
      ));
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPath.nabLogo),
      actions: [
        AppBarIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.notifications_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 6)
      ],
    );
  }
}

