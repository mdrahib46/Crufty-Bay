import 'package:carousel_slider/carousel_slider.dart';
import 'package:cruftybay/app/app_color.dart';

// import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/app/asset_path.dart';
import 'package:cruftybay/features/home/ui/widgets/search-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/appbar_icon_button.dart';
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
                const HomeCarouselSlider()
              ],
            ),
          ),
        ));
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


