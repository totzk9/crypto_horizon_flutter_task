import '../entity/coin.dart';

abstract class ICoinProvider {
  Future<List<Coin>> getAllCoins();

  Future<Coin> getCoinData(String uuid);

}
