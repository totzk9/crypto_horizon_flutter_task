import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:flutter/material.dart';

Widget coinOtherDetailsWidget(Coin coin) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Symbol: ${coin.symbol}', style: const TextStyle(fontSize: 21)),
        const SizedBox(height: 8),
        Text('Overall Rank: ${coin.rank}',
            style: const TextStyle(fontSize: 21)),
        const SizedBox(height: 8),
        Text('Current Price: \$${coin.price!.substring(0, 8)}',
            style: const TextStyle(fontSize: 21)),
        const SizedBox(height: 8),
        Text('Current MarketCap: \$${coin.marketCap}',
            style: const TextStyle(fontSize: 21)),
      ],
    ),
  );
}
