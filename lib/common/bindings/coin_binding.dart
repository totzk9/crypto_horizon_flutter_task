import 'package:crypto_horizon_flutter_task/common/controllers/coin_controller.dart';
import 'package:get/get.dart';

import '../providers/coin_provider.dart';
import '../providers/coin_provider_impl.dart';
import '../repository/coin_repository.dart';
import '../repository/coin_repository_impl.dart';

class CoinBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ICoinProvider>(() => CoinProvider());
    Get.lazyPut<ICoinRepository>(() => CoinRepository(provider: Get.find()));
    Get.lazyPut(() => CoinController(repository: Get.find()));
  }
}
