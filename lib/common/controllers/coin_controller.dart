import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:get/get.dart';

import '../repository/coin_repository_impl.dart';

class CoinController extends SuperController<List<Coin>> {
  CoinController({required this.repository});

  final ICoinRepository repository;

  @override
  Future<void> onInit() async {
    await getAllCoins();
    super.onInit();
  }

  Future<void> getAllCoins() async =>
    append(() => repository.getAllCoins);

  @override
  void onDetached() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }
}
