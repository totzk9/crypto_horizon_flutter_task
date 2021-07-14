import 'package:crypto_horizon_flutter_task/common/controllers/favorite_controller.dart';
import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:crypto_horizon_flutter_task/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (List<Coin>? coins) {
        if (coins == null || coins.isEmpty) {
          return const Center(
            child: Center(child: Text('You have no favorites')),
          );
        }
        return Scaffold(
          body: Container(
            color: const Color(0xFF424242),
            height: context.height,
            child: SafeArea(
                child: ReorderableListView.builder(
                    itemBuilder: (_, int index) {
                      return FavoriteItem(
                        coin: coins[index],
                        key: ValueKey<int>(coins[index].index),
                      );
                    },
                    itemCount: coins.length,
                    onReorder: controller.onReorder)
                ),
          ),
        );
      },
      onEmpty: const Text('onEmpty'),
      onLoading: const Center(
        child: Center(child: CircularProgressIndicator()),
      ),
      onError: (String? err) => Container(
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Error: API returned empty'),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.getAllFavorites();
                },
                child: const Text('Retry'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
