import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({
    required this.coin,
    Key? key,
  }) : super(key: key);

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(coin.index),
      tileColor: const Color(0xF2424242),
      title: GestureDetector(
        onTap: () async {
          await Get.toNamed(
            '/coin_detail',
            arguments: <String, dynamic>{
              'uuid': coin.uuid
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Container(
            color: const Color(0xFF212121),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// Note: some SVG in the API needs to be cleaned for Flutter compatibility which
                /// is why an error will come up. please disregard any errors because it's
                /// out of my ability to fix it. Thanks
                if (coin.iconUrl != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.network(
                      coin.iconUrl!,
                      width: 32,
                      height: 32,
                    ),
                  ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    coin.name!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.menu,
                    size: 24,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
