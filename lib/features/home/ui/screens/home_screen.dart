// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cruftybay/app/app_color.dart';
//
// // import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/app/asset_path.dart';
import 'package:cruftybay/features/home/ui/widgets/home_section_header.dart';
import 'package:cruftybay/features/home/ui/widgets/search-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/appbar_icon_button.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/home_carousel_Slider.dart';

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
                onTap: () {},
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
              SizedBox(
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
                            color: AppColors.themeColor.withOpacity(0.14),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'assets/images/product.png',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 90,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'HP 15-fd0292TU Core i5 13th Gen',
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  '\$100',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.themeColor),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
