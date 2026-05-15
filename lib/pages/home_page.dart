import 'package:flutter/material.dart';
import 'package:myapp/pages/main_page.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/images.dart';
import 'package:myapp/widgets/myappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Images.kfcLogo),
                      Text(
                        "It's Finger lickin' Good",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.brandcolor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(
                    Icons.location_pin,
                    color: AppColors.buttonTextColor,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Store Locator",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.brandcolor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(
                    Icons.search,
                    color: AppColors.buttonTextColor,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Track Order",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.brandcolor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(
                    Icons.list,
                    color: AppColors.buttonTextColor,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Explore Menu",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "About Us ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Terms and conditions ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Contact Us ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Careers ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
      body: MainPage(),
    );
  }
}
