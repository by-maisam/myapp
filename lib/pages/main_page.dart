import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/dimensions.dart';
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
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingMeidum),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Explore Menu",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          width: 60,
                          child: Divider(
                            color: AppColors.brandcolor,
                            thickness: 2,
                            radius: BorderRadius.circular(
                              Dimensions.borderRadiusSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
