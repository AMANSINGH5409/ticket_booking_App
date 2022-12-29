import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../Utils/MyColor.dart';
import '../Utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: MyColors.mainColor,
                  size: Dimensions.iconSize16,
                );
              }),
            ),
            const SizedBox(width: 10.0),
            SmallText(text: "4.5"),
            const SizedBox(width: 10.0),
            SmallText(text: "1287"),
            const SizedBox(width: 10.0),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: MyColors.yellowColor,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.7Km",
              iconColor: MyColors.mainColor2,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: MyColors.iconColor2,
            )
          ],
        )
      ],
    );
  }
}
