import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/MyColor.dart';
import 'package:food_delivery_app/Utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.6,
                  color: MyColors.paraColor,
                  size: Dimensions.font16,
                  text:
                      hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                          size: Dimensions.font16,
                          text: hiddenText ? "Show more" : "Show less",
                          color: MyColors.mainColor),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: MyColors.mainColor),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
