import 'package:crypto_horizon_flutter_task/common/bindings/coin_binding.dart';
import 'package:crypto_horizon_flutter_task/common/bindings/favorite_binding.dart';
import 'package:crypto_horizon_flutter_task/pages/coin_screen.dart';
import 'package:crypto_horizon_flutter_task/pages/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxInt currentIndex = 0.obs;

  final List<String> pages = <String>['/coins', '/favorites'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/coins') {
      return GetPageRoute(
        settings: settings,
        page: () => CoinScreen(),
        transition: Transition.topLevel,
        binding: CoinBinding(),
      );
    } else if (settings.name == '/favorites') {
      return GetPageRoute(
        settings: settings,
        page: () => FavoriteScreen(),
        transition: Transition.rightToLeftWithFade,
        binding: FavoriteBinding(),
      );
    }
    return null;
  }
}
