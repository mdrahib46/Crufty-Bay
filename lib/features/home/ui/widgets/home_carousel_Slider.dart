import 'package:carousel_slider/carousel_slider.dart';
import 'package:cruftybay/app/app_color.dart';
import 'package:cruftybay/features/home/data/model/bannner_model.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.bannerList});

  final List<BannerModel> bannerList;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 170.0,
              viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason) {
                _selectedIndex.value = currentIndex;
              }),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(banner.image ?? ''), fit: BoxFit.cover),
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner.title ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Buy now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: value == i ? AppColors.themeColor : Colors.transparent,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(20)),
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
