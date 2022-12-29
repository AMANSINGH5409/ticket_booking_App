import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/MyColor.dart';
import 'package:food_delivery_app/Utils/dimensions.dart';
import 'package:food_delivery_app/pages/home/food_page_body.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.widht15, right: Dimensions.widht15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                          text: "India",
                          color: MyColors.mainColor,
                          size: Dimensions.font30),
                      Row(
                        children: [
                          SmallText(text: "Surat", color: Colors.black54),
                          const Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: MyColors.mainColor,
                    ),
                    child: Icon(
                      Icons.search,
                      size: Dimensions.iconSize24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          //Showing the Body
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
