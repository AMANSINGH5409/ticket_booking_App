import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/MyColor.dart';
import 'package:food_delivery_app/Utils/app_constants.dart';
import 'package:food_delivery_app/Utils/dimensions.dart';
import 'package:food_delivery_app/controllers/cartController.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  int orderCount = 0;
  RecommendedFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartpage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: const AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getCartPage());
                            },
                            child: const AppIcon(
                                icon: Icons.shopping_cart_outlined)),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? const Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20.0,
                                    iconColor: Colors.transparent,
                                    backgroundColor: MyColors.mainColor),
                              )
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 5,
                                top: 3,
                                child: BigText(
                                  text: Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  size: 12.0,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Center(
                    child: BigText(size: Dimensions.font26, text: product.name),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: MyColors.yellowColor,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: ExpandableText(text: product.description!),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20 * 2.5,
                    right: Dimensions.width20 * 2.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                            icon: Icons.remove,
                            iconSize: Dimensions.iconSize24,
                            iconColor: Colors.white,
                            backgroundColor: MyColors.mainColor),
                      ),
                      BigText(
                        text:
                            "\$ ${product.price!} X ${controller.inCartItems}",
                        color: MyColors.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                            icon: Icons.add,
                            iconSize: Dimensions.iconSize24,
                            iconColor: Colors.white,
                            backgroundColor: MyColors.mainColor),
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.bottomHeightBar,
                  padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      right: Dimensions.width20,
                      left: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: MyColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: MyColors.mainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          controller.addItem(product);
                        }),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: MyColors.mainColor),
                          child: BigText(
                            text: "\$ ${product.price!} | Add to cart",
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
