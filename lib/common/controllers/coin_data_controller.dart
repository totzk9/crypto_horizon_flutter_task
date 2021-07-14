import 'package:crypto_horizon_flutter_task/widgets/coin_description.dart';
import 'package:crypto_horizon_flutter_task/widgets/coin_other_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../entity/coin.dart';
import '../repository/coin_repository_impl.dart';

class CoinDataController extends SuperController<Coin> {
  CoinDataController({required this.repository});

  final ICoinRepository repository;

  late Coin _coin;

  late Widget content;

  @override
  void onInit() {
    super.onInit();
  }

  Future<Coin> _getCoin() async => Future<Coin>.value(_coin);

  Future<void> getCoinData(String uuid) async {
    _coin = await repository.getCoinData(uuid);
    content = coinDescriptionWidget(_coin.description);
    _coin.changeFavorite(repository.isFavorite(_coin));
    append(() => _getCoin);
  }

  Future<void> changeFavorite() async {
    if (_coin.isFavorite) {
      await repository.unsaveFavorite(_coin);
    } else {
      await repository.saveFavorite(_coin);
    }
    _coin.changeFavorite(!_coin.isFavorite);
    append(() => _getCoin);
  }

  void changeDescriptionTab() {
    content = coinDescriptionWidget(_coin.description);
    refresh();
  }

  void changeOtherTab() {
    content = coinOtherDetailsWidget(_coin);
    refresh();
  }

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
