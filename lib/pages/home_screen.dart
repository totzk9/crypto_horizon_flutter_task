import 'package:crypto_horizon_flutter_task/common/controllers/home_controller.dart';
import 'package:crypto_horizon_flutter_task/common/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF424242),
        child: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.Coin,
          onGenerateRoute: controller.onGenerateRoute,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined),
              label: 'Crypto',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
