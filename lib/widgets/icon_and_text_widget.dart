import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  double iconSize;
  final Color iconColor;

  IconAndTextWidget(
      {super.key,
      this.iconSize = 0,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
            color: iconColor,
            size: iconSize == 0 ? Dimensions.iconSize24 : iconSize),
        const SizedBox(width: 5.0),
        SmallText(text: text),
      ],
    );
  }
}
