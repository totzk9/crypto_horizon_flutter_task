import 'dart:io';

import 'package:crypto_horizon_flutter_task/common/entity/coin.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  factory LocalDataSource() => _instance ??= LocalDataSource._();
  LocalDataSource._();

  static LocalDataSource? _instance;
  late Box<Coin> box;
  late final ValueListenable<Box<Coin>> listenableBox;

  Future<void> init() async {
    final CoinAdapter coinAdapter = CoinAdapter();
    if (!Hive.isAdapterRegistered(coinAdapter.typeId)) {
      Hive.registerAdapter<Coin>(coinAdapter);
    }

    final Directory appDocDirectory = await getApplicationDocumentsDirectory();
    await Directory(appDocDirectory.path + '/' + 'dir')
        .create(recursive: true)
        .then((Directory directory) async {
      Hive.init(directory.path);
      box = await Hive.openBox('coin');
      listenableBox = box.listenable();
    });
  }
}
