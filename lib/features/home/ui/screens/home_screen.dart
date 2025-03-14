import 'package:cruftybay/app/asset_path.dart';
import 'package:cruftybay/features/common/data/models/category/category_pagination_model.dart';
import 'package:cruftybay/features/common/data/models/product_list_model.dart';
import 'package:cruftybay/features/common/data/models/product_model.dart';
import 'package:cruftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/common/ui/widgets/category_item_widget.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:cruftybay/features/common/ui/widgets/product_item_widget.dart';
import 'package:cruftybay/features/home/controller/home_banner_list_controller.dart';
import 'package:cruftybay/features/home/ui/widgets/appbar_icon_button.dart';
import 'package:cruftybay/features/home/ui/widgets/home_carousel_Slider.dart';
import 'package:cruftybay/features/home/ui/widgets/home_section_header.dart';
import 'package:cruftybay/features/home/ui/widgets/search-bar.dart';
import 'package:cruftybay/features/product/ui/controller/product_list_controller.dart';
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
              GetBuilder<SliderListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CenterCircularProgressIndicator();
                }
                return HomeCarouselSlider(sliderList: controller.bannerList);
              }),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: "Category",
                onTap: () {
                  Get.find<MainBottomNabController>().moveToCategory();
                },
              ),

              GetBuilder<CategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CenterCircularProgressIndicator();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoryList(controller.categoryList),
                  ),
                );
              }),

              const SizedBox(height: 8),

              HomeSectionHeader(
                title: "Popular",
                onTap: () {},
              ),

              GetBuilder<ProductListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CenterCircularProgressIndicator();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(productList: controller.productList),
                  ),
                );
              }),

              const SizedBox(height: 8),

              HomeSectionHeader(
                title: "Special",
                onTap: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(productList: []),
                ),
              ),

              const SizedBox(height: 8),

              HomeSectionHeader(
                title: "New",
                onTap: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(productList: []),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(List<CategoryItemModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CategoryItemWidget(
            categoryModel: categoryModels[i],
          ),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList({required List<ProductModel> productList}) {
    List<Widget> list = [];
    for (int i = 0; i < productList.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ProductItemWidget(
          productModel: productList[i],
        ),
      ));
    }
    return list;
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
