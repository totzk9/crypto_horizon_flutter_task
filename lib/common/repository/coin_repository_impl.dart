import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:flutter/foundation.dart';

abstract class ICoinRepository {
  Future<List<Coin>> getAllCoins();

  Future<List<Coin>> getAllFavorites();

  Future<Coin> getCoinData(String uuid);

  Future<void> saveFavorite(Coin coin);
  Future<void> unsaveFavorite(Coin coin);
  Future<void> reorderFavorites(List<Coin> coinList);
  bool isFavorite(Coin coin);

  void listenToFavorites(VoidCallback callback);
  void unlistenToFavorites(VoidCallback callback);
}
