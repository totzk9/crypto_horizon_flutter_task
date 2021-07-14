import 'package:crypto_horizon_flutter_task/common/controllers/coin_controller.dart';
import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:crypto_horizon_flutter_task/widgets/coin_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CoinScreen extends GetView<CoinController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (List<Coin>? coins) {
        if (coins == null || coins.isEmpty) {
          return const Center(
            child: Center(child: Text('List is empty')),
          );
        }
        return Scaffold(
          body: Container(
            color: const Color(0xFF424242),
            height: context.height,
            child: SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            await Get.toNamed('/coin_detail',
                                arguments: <String, dynamic>{'uuid': coins[index].uuid});
                          },
                          child: CoinItem(
                            coin: coins[index],
                          ),
                        );
                      },
                      childCount: coins.length,
                    ),
                  )
                ],
              ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Error: API returned empty'),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: () async {
                await controller.getAllCoins();
              }, child: const Text('Retry'))
            ],
          ),
        ),
      ),
    );
  }
}
