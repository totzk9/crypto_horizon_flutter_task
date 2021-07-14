import 'dart:async';

import 'package:crypto_horizon_flutter_task/common/utils/local_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../entity/coin.dart';
import '../providers/coin_provider_impl.dart';
import 'coin_repository_impl.dart';

class CoinRepository implements ICoinRepository {
  CoinRepository({required this.provider});

  final ICoinProvider provider;

  final Box<Coin> _box = LocalDataSource().box;
  late final ValueListenable<Box<Coin>> _listenableBox = LocalDataSource().listenableBox;

  @override
  Future<List<Coin>> getAllCoins() async {
    final List<Coin> response = await provider.getAllCoins();
    if (response.isEmpty) {
      throw Exception('No Data Available');
    } else {
      return response;
    }
  }

  @override
  Future<Coin> getCoinData(String uuid) async {
    final Coin? response = await provider.getCoinData(uuid);
    if (response == null) {
      throw Exception('No Data Available');
    } else {
      return response;
    }
  }

  @override
  Future<List<Coin>> getAllFavorites() {
    final List<Coin> favoriteCoins = _box.values.toList();

    favoriteCoins.sort((Coin coin1, Coin coin2) => coin2.index - coin1.index);

    return Future<List<Coin>>.value(favoriteCoins);
  }

  @override
  Future<void> unsaveFavorite(Coin coin) {
    return _box.delete(coin.key);
  }

  @override
  Future<void> saveFavorite(Coin coin) {
    coin.index = _box.length;
    return _box.put(coin.key, coin);
  }

  @override
  bool isFavorite(Coin coin) => _box.containsKey(coin.key);

  @override
  Future<void> reorderFavorites(List<Coin> coinList) async {
    for (int i = 0; i < coinList.length; i++) {
      final Coin coin = coinList[i];

      coin.index = coinList.length - 1 - i;
      await _box.put(coin.key, coin);
    }
  }

  @override
  void listenToFavorites(VoidCallback callback) =>
      _listenableBox.addListener(callback);

  @override
  void unlistenToFavorites(VoidCallback callback) =>
      _listenableBox.removeListener(callback);
}
