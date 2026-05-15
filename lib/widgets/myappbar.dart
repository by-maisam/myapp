import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/images.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          bool canPop = ModalRoute.of(context)!.canPop;
          if (!canPop) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodySmall!.color!,
                  BlendMode.srcATop,
                ),
                child: Image.asset(Images.iconMenu),
              ),
            );
          } else {
            return IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).textTheme.bodySmall!.color!,
              ),
            );
          }
        },
      ),
      title: Image.asset(Images.kfcLogo),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            width: 40,
            child: Stack(
              children: [
                Image.asset(Images.iconBucket),
                Center(
                  child: FittedBox(
                    child: Text(
                      "0",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        color: AppColors.LightTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
