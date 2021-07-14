import 'package:crypto_horizon_flutter_task/common/bindings/coin_binding.dart';
import 'package:crypto_horizon_flutter_task/common/bindings/coin_data_binding.dart';
import 'package:crypto_horizon_flutter_task/common/bindings/favorite_binding.dart';
import 'package:crypto_horizon_flutter_task/common/bindings/home_binding.dart';
import 'package:crypto_horizon_flutter_task/pages/coin_details_screen.dart';
import 'package:crypto_horizon_flutter_task/pages/coin_screen.dart';
import 'package:crypto_horizon_flutter_task/pages/home_screen.dart';
import 'package:get/get.dart';

import '../../pages/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const String INITIAL = AppRoutes.Home;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      bindings: [CoinBinding(), FavoriteBinding()]
    ),
    GetPage(
      name: AppRoutes.CoinDetail,
      page: () => CoinDetailsScreen(),
      binding: CoinDataBinding(),
    ),
  ];


}
