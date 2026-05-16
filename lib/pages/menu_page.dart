import 'package:flutter/material.dart';
import 'package:myapp/utils/cart_provider.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/spacing.dart';
import 'package:myapp/widgets/myappbar.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ItemScrollController categorycontroller = ItemScrollController();
  final ItemScrollController productcontroller = ItemScrollController();
  int selectedcategoryindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upper Horizontal Categories List
            SizedBox(
              height: 50,
              child: ScrollablePositionedList.builder(
                itemScrollController: categorycontroller,
                itemCount: menuCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final isSelected = selectedcategoryindex == index;
                  return Container(
                    margin: EdgeInsets.only(right: Dimensions.marginSmall),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedcategoryindex = index;
                        });
                        // Smoothly scrolls the lower product list to the selected block index
                        productcontroller.scrollTo(
                          index: index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                      child: Chip(
                        label: Text(
                          menuCategories[index]["name"]!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        // Visual Selection State Highlight Enhancements
                        backgroundColor: isSelected
                            ? AppColors.brandcolor
                            : Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Dimensions.borderRadiusSmall,
                          ),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.brandcolor
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacing.smallY,

            // Lower Products Scrollable Column
            Expanded(
              child: ScrollablePositionedList.builder(
                itemScrollController: productcontroller,
                itemCount: menuCategories.length,
                itemBuilder: (context, categoryIndex) {
                  String currentCategoryName =
                      menuCategories[categoryIndex]["name"]!;

                  // FIX 1: Filter elements by matching the 'category' key instead of 'name'
                  List<Map<String, dynamic>> categoryproducts = allProducts
                      .where(
                        (element) => element['category'] == currentCategoryName,
                      )
                      .toList();

                  // Hide headers cleanly if a specific category happens to have zero items loaded
                  if (categoryproducts.isEmpty) return const SizedBox.shrink();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          currentCategoryName,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // FIX 2: Restrict items exclusively to the filtered catalog size
                        itemCount: categoryproducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  0.68, // Adjusted aspect ratio to safely fit image, text, and buttons
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                        itemBuilder: (context, productIndex) {
                          // Extract target scoped product model details securely
                          final product = categoryproducts[productIndex];

                          return Card(
                            elevation: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    // Use asset fallback strategy if testing images inside workspace locally
                                    child: Image.asset(
                                      product['image']!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    product['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  child: Text(
                                    "Rs. ${product['price']!}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FilledButton(
                                    onPressed: () {},
                                    style: FilledButton.styleFrom(
                                      backgroundColor: AppColors.brandcolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: FilledButton.icon(
                                      label: Text(
                                        "ADD TO BUCKET",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                      onPressed: () {
                                        Provider.of<CartProvider>(
                                          context,
                                        ).addItem(product);
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Spacing.mediumY,
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
