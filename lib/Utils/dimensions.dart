import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
  static double pageView = screenHeight / 2.64;

  //Dynamic Height padding and margin
  static double height10 = screenHeight / (screenHeight / 10);
  static double height20 = screenHeight / (screenHeight / 20);
  static double height15 = screenHeight / (screenHeight / 15);
  static double height45 = screenHeight / (screenHeight / 45);
  static double height30 = screenHeight / (screenHeight / 30);
  //Dynamic Width padding and margin
  static double width10 = screenWidth / (screenWidth / 10);
  static double width20 = screenWidth / (screenWidth / 20);
  static double widht15 = screenWidth / (screenWidth / 15);
  static double widht30 = screenWidth / (screenWidth / 30);
  static double widht25 = screenWidth / (screenWidth / 25);

  static double font20 = screenHeight / (screenHeight / 20);
  static double font18 = screenHeight / (screenHeight / 18);
  static double font16 = screenHeight / (screenHeight / 16);
  static double font26 = screenHeight / (screenHeight / 26);
  static double font30 = screenHeight / (screenHeight / 30);

  static double radius20 = screenHeight / (screenHeight / 20);
  static double radius30 = screenHeight / (screenHeight / 30);
  static double radius15 = screenHeight / (screenHeight / 15);

  //Icon Size
  static double iconSize24 = screenHeight / (screenHeight / 24);
  static double iconSize32 = screenHeight / (screenHeight / 32);
  static double iconSize16 = screenHeight / (screenHeight / 16);

  //ListView Size
  static double listViewImgSize = screenWidth / (screenWidth / 120);
  static double listViewTextContSize = screenWidth / (screenWidth / 100);

  //Popular food
  static double popularFoodImgSize = screenHeight / (screenHeight / 350);

  //Bottom Height
  static double bottomHeightBar = screenHeight / (screenHeight / 120);

  //Splash Screen Dimension
  static double splashImg = screenHeight / (screenHeight / 250);
}
