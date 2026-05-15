import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> sliderImages = [
    Images.bannerBonelessBox,
    Images.bannerFamilyFestival,
    Images.bannerKentuckyCombo,
    Images.bannerSnackBucket,
    Images.bannerZingerWings,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: sliderImages.map((item) {
              return Image.asset(item, fit: BoxFit.cover);
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 24 / 9,
              viewportFraction: 1.0,

              enableInfiniteScroll: true,

              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,

              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
