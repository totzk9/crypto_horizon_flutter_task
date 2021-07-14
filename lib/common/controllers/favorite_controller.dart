import 'package:get/get.dart';

import '../entity/coin.dart';
import '../repository/coin_repository_impl.dart';

class FavoriteController extends SuperController<List<Coin>> {
  FavoriteController({required this.repository});

  final ICoinRepository repository;

  late List<Coin> favoriteCoins;

  @override
  Future<void> onInit() async {
    await getAllFavorites();
    repository.listenToFavorites(_onFavoritesChange);
    super.onInit();
  }

  Future<List<Coin>> _getFaves() async =>
      Future<List<Coin>>.value(favoriteCoins);

  Future<void> getAllFavorites() async {
    favoriteCoins = await repository.getAllFavorites();
    append(() => _getFaves);
  }

  @override
  void onDetached() => repository.unlistenToFavorites(_onFavoritesChange);

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  Future<void> onResumed() async {}

  Future<void> _onFavoritesChange() async => await getAllFavorites();

  void onReorder(int oldIndex, int newIndex) {
    favoriteCoins.insert(
      newIndex - (newIndex < oldIndex ? 0 : 1),
      favoriteCoins.removeAt(oldIndex),
    );
    // repository.reorderFavorites(favoriteCoins);
  }
}
