import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/dimensions.dart';

class BrandUnderline extends StatelessWidget {
  const BrandUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Divider(
        color: AppColors.brandcolor,
        thickness: 2,
        radius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
    );
  }
}
