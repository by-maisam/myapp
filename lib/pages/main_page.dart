import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/pages/menu_page.dart';
import 'package:myapp/utils/cart_provider.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/images.dart';
import 'package:myapp/utils/spacing.dart';
import 'package:myapp/widgets/Brandunderline.dart';
import 'package:myapp/utils/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

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
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                    const Spacer(),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MenuPage(),
                              ),
                            );
                          },
                          child: const Text("View All "),
                        ),
                        BrandUnderline(),
                      ],
                    ),
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
                          dashPattern: const [8, 3],
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
                const Text("Best Sellers"),
                BrandUnderline(),
                Spacing.smallY,

                SizedBox(
                  height: 410,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bestSellers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 240, // Increased overall card width
                        margin: const EdgeInsets.only(
                          right: Dimensions.paddingSmall,
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // 3 Containers positioned at the top-center inside the card
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: AppColors.brandcolor,
                                      width: 14,
                                      height: 22,
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      color: AppColors.brandcolor,
                                      width: 14,
                                      height: 22,
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      color: AppColors.brandcolor,
                                      width: 14,
                                      height: 22,
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      bestSellers[index]["name"]!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Spacing.mediumY,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadiusSmall,
                                          ),
                                          color: AppColors.brandcolor,
                                        ),
                                        child: Text(
                                          " Rs. ${bestSellers[index]["price"]!} ",
                                          style: TextStyle(
                                            color: AppColors.buttonTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacing.mediumY,
                                    Center(
                                      child: Image.asset(
                                        bestSellers[index]["image"]!,
                                        height: 140, // Increased image height
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),

                              // Uplifted smaller custom Cart IconButton
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 16.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Handle Add To Cart
                                  },
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.brandcolor,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 6,
                                          offset: const Offset(
                                            0,
                                            3,
                                          ), // Uplifted shadow depth
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FilledButton.icon(
                                          onPressed: () {
                                            // EXACT FIX: Changed allProducts[index] to bestSellers[index] and added listen: false
                                            Provider.of<CartProvider>(
                                              context,
                                              listen: false,
                                            ).addItem(bestSellers[index]);
                                          },
                                          icon: const Icon(Icons.add, size: 18),
                                          label: const Text(
                                            "ADD TO BUCKET",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Spacing.mediumY,
                const Text("Top Sellers"),
                BrandUnderline(),
                Spacing.smallY,

                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bestSellers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200,
                        margin: const EdgeInsets.only(
                          right: Dimensions.paddingSmall,
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                bestSellers[index]["name"]!,
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacing.smallY,
                              Image.asset(
                                bestSellers[index]["image"]!,
                                height: 110,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
