import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/images.dart';
import 'package:myapp/utils/spacing.dart';
import 'package:myapp/widgets/Brandunderline.dart';
import 'package:myapp/utils/data.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';

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
                        BrandUnderline(),
                      ],
                    ),
                    Spacer(),
                    TextButton(onPressed: () {}, child: Text("View All ")),
                  ],
                ),
                Spacing.smallY,
                StaggeredGrid.count(
                  crossAxisCount: 3,
                  children: menuCategories.map((item) {
                    return StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: menuCategories.indexOf(item) == 0
                          ? 2
                          : 1,

                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          radius: Radius.circular(Dimensions.borderRadiusSmall),
                          padding: EdgeInsets.all(Dimensions.paddingSmall),
                          dashPattern: [8, 3],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name']!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Expanded(child: Image.asset(item["image"]!)),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Spacing.mediumY,
                Text("Best Sellers"),
                BrandUnderline(),
                Spacing.smallY,
                SizedBox(
                  height: 200,
                  child: ListView(scrollDirection: Axis.horizontal),
                ),
                Spacing.mediumY,
                Text("Top Sellers"),
                BrandUnderline(),
                Spacing.smallY,
                SizedBox(
                  height: 200,
                  child: ListView(scrollDirection: Axis.horizontal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
