import 'dart:ffi';

import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommende-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int popPageID, String page) =>
      '$popularFood?popPageID=$popPageID&page=$page';
  static String getRecommendedFood(int recPageID, String page) =>
      '$recommendedFood?recPageID=$recPageID&page=$page';

  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: "/", page: () => const HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['popPageID'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageID: int.parse(pageId!), page: page!);
      },
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['recPageID'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    )
  ];
}
