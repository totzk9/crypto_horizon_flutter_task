import 'dart:convert';

import 'package:get/get.dart';

import '../entity/coin.dart';
import '../utils/remote_data_source.dart';
import 'coin_provider_impl.dart';

class CoinProvider extends RemoteDataSource implements ICoinProvider {

  @override
  Future<List<Coin>> getAllCoins() async {
    final Response<dynamic> res = await get('/coins');
    final List<Coin> coins = <Coin>[];
    json.decode(res.bodyString!)['data']['coins'].forEach((dynamic v) {
      coins.add(Coin.fromJson(v));
    });

    return coins;
  }

  @override
  Future<Coin> getCoinData(String uuid) async {
    final Response<dynamic> res = await get('/coin/$uuid');
    return Coin.fromJson(json.decode(res.bodyString!)['data']['coin']);
  }

}
