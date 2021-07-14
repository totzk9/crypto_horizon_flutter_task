import 'package:crypto_horizon_flutter_task/common/controllers/coin_data_controller.dart';
import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:crypto_horizon_flutter_task/widgets/custom_sliver_app_bar.dart';
import 'package:crypto_horizon_flutter_task/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinDetailsScreen extends GetView<CoinDataController> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;

    if (args == null || args['uuid'] == null) {
      return Container();
    }

    return FutureBuilder<void>(
      future: controller.getCoinData(args['uuid']),
      builder: (_, AsyncSnapshot<void> snapshot) {
        return controller.obx(
          (Coin? coin) {
            if (coin == null) {
              return Container();
            }
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: CustomSliverAppBarDelegate(
                      title: coin.name!,
                      imgUrl: coin.iconUrl!,
                      changeFavorite: controller.changeFavorite,
                      descriptionTab: () => controller.changeDescriptionTab(),
                      otherDetailsTab: () => controller.changeOtherTab(),
                    ),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 32, 24, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) =>
                                            Colors.transparent),
                              ),
                              onPressed: () async =>
                                  await controller.changeFavorite(),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      coin.isFavorite
                                          ? 'Remove from Favorites'
                                          : 'Add to Favorites',
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      coin.isFavorite
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 1000),
                          child: controller.content,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          onEmpty: const Text('onEmpty'),
          onLoading: const Center(
            child: Loading(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          onError: (String? err) => Text('onEmpty' + err.toString()),
        );
      },
    );
  }
}
