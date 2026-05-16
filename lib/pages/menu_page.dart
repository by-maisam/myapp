import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/spacing.dart';
import 'package:myapp/widgets/myappbar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: menuCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: Dimensions.marginSmall),
                    child: Text(menuCategories[index]["name"]!),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuCategories.length,
                itemBuilder: (context, index) {
                  String Categoryname = menuCategories[index]["name"]!;
                  List<Map<String, dynamic>> categoryproducts = allProducts
                      .where((element) => element['name'] == Categoryname)
                      .toList();
                  return Column(
                    children: [
                      Spacing.smallY,
                      Text(
                        Categoryname,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: allProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 2,
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      allProducts[index]['image'],
                                    ),
                                  ),
                                ),
                                Text(
                                  allProducts[index]['name'],
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                Spacing.smallY,
                                Text(
                                  "Rs. ${allProducts[index]['price']}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Spacing.smallY,
                                Center(
                                  child: FilledButton.icon(
                                    onPressed: () {},
                                    label: Text(
                                      "ADD TO BUCKET",
                                      style: TextStyle(
                                        color: AppColors.brandcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
